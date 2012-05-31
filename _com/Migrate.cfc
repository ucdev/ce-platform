<cfcomponent displayname="Migration Scripts">
	<cfset OldDSN = "AITL-SQL1C">
	<cfset NewDSN = "AITL-SQL1C">
    
	<!--- CONTRIBUTORS 
		The desired result is to migrate the Contributor Amounts into the Child Element of the migrated activity.
		All migrated elements are Parent Child even though most are just single session events.
	--->
	
	<cffunction name="Contributors" access="remote" output="yes">
		<cfset var nMonths = 10>
		
		<cfquery name="qCourseContrib" datasource="#OldDSN#">
			SELECT     C.Name, CC.CourseID, CC.Amount, CC.Created, dbo.tt_Course.Name AS CourseTitle, dbo.cm_ContribType.Name AS ContribType
FROM         dbo.cm_CourseContrib AS CC INNER JOIN
                      dbo.cm_Contributor AS C ON CC.ContributorID = C.ContributorID INNER JOIN
                      dbo.tt_Course ON CC.CourseID = dbo.tt_Course.CourseID INNER JOIN
                      dbo.cm_ContribType ON CC.ContribTypeID = dbo.cm_ContribType.ContribTypeID
WHERE     ((SELECT     COUNT(CourseSectionId) AS Expr1
                         FROM         dbo.tt_CourseSection
                         WHERE     (CourseId = CC.CourseID) AND (StartDate BETWEEN '1/1/2008 00:00:00' AND '12/31/2009 23:59:59')) > 0)
		</cfquery>
		
		<cfloop query="qCourseContrib">
			<cfquery name="qFind" datasource="#NewDSN#">
				SELECT ActivityID,Title,ReleaseDate
				FROM ce_Activity
				WHERE 
				Title=<cfqueryparam value="#Trim(qCourseContrib.CourseTitle)#" cfsqltype="cf_sql_varchar" /> AND 
				ReleaseDate BETWEEN DateAdd(m,-#nMonths#,#CreateODBCDateTime(qCourseContrib.Created)#) AND DateAdd(m,#nMonths#,#CreateODBCDateTime(qCourseContrib.Created)#) AND
				GroupingID=2
				OR
				Title=<cfqueryparam value="#Trim(qCourseContrib.CourseTitle)#" cfsqltype="cf_sql_varchar" /> AND 
				ReleaseDate BETWEEN DateAdd(m,-#nMonths#,#CreateODBCDateTime(qCourseContrib.Created)#) AND DateAdd(m,#nMonths#,#CreateODBCDateTime(qCourseContrib.Created)#) AND
				GroupingID<>2 AND
				ParentActivityID IS NOT NULL
			</cfquery>
			
			<!--- GET ACTIVITY BEANS --->
			<!--- Acquire Activity Info --->
			<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=qFind.ActivityID)>
			<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>

			<cfif ActivityBean.getParentActivityID() NEQ "">
				<cfset ParentActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=ActivityBean.getParentActivityID())>
				<cfset ParentActivityBean = Application.Com.ActivityDAO.Read(ParentActivityBean)>
			</cfif>
			
			#qCourseContrib.CourseTitle# (#qCourseContrib.Name# #DateFormat(DateAdd('m',nMonths*-1,qCourseContrib.Created),'mm/dd/yyyy')# - #DateFormat(DateAdd('m',nMonths,qCourseContrib.Created),'mm/dd/yyyy')#)
			<cfif qFind.RecordCount GT 0>
			<!--- FOUND RECORD --->
			 [Found: #qFind.RecordCount# <cfloop query="qFind">#DateFormat(qFind.ReleaseDate,'mm/dd/yyyy')#,</cfloop>]
			 
			 <!--- DETERMINE TYPE ID --->
			 <cfquery name="qCheck" datasource="#NewDSN#">
			 	SELECT ContribTypeID
				FROM ce_Sys_SupportType
				WHERE Name=<cfqueryparam value="#qCourseContrib.ContribType#" cfsqltype="cf_sql_varchar" />
			 </cfquery>
			 
			 <cfif qCheck.RecordCount EQ 1>
			 	<cfset SupportTypeID = qCheck.ContribTypeID>
			<cfelse>
				<cfset SupportTypeID = 0>
			 </cfif>
			 
			 <!--- SUPPORTER NAME --->
				<!--- Check if exists --->
				<cfquery name="qCheck" datasource="#NewDSN#">
					SELECT ContributorID
					FROM ce_Sys_Supporter
					WHERE Name=<cfqueryparam value="#Trim(qCourseContrib.Name)#" cfsqltype="cf_sql_varchar" />
				</cfquery>
				
				<cfif qCheck.RecordCount EQ 1>
					<cfset SupporterID = qCheck.ContributorID>
				<cfelse>
					<cfset SupporterBean = CreateObject("component","#Application.Settings.Com#System.Supporter").Init()>					
					<cfset SupporterBean.setName(qCourseContrib.Name)>
					<cfset SupporterBean.setDescription("")>
					<cfset SupporterID = Application.Com.SupporterDAO.Create(SupporterBean)>
				</cfif>
				[SupporterID: #SupporterID#] [SupportTypeID: #SupportTypeID#]
				
				<cfset ActivitySupportBean = CreateObject("component","#Application.Settings.Com#ActivityFinance.Support").Init(ActivityID=qFind.ActivityID)>
				<cfset ActivitySupportBean.setAmount(qCourseContrib.Amount)>
				<cfset ActivitySupportBean.setSupporterID(SupporterID)>
				<cfset ActivitySupportBean.setSupportTypeID(SupportTypeID)>
				<cfset ActivitySupportBean.setCreatedBy(Session.Person.getPersonID())>
				<cfset Application.Com.ActivitySupportDAO.Create(ActivitySupportBean)>
				
				
				<!--- Update Activity Stats --->
				<cfset ActivityBean.setStatSupporters(ActivityBean.getStatSupporters()+1)>
				<cfset ActivityBean.setStatSuppAmount(ActivityBean.getStatSuppAmount()+qCourseContrib.Amount)>
				<cfset Application.Com.ActivityDAO.Update(ActivityBean)>
				
				<cfset ParentActivityBean.setStatSupporters(ParentActivityBean.getStatSupporters()+1)>
				<cfset ParentActivityBean.setStatSuppAmount(ParentActivityBean.getStatSuppAmount()+qCourseContrib.Amount)>
				<cfset Application.Com.ActivityDAO.Update(ParentActivityBean)>
			<cfelse>
			<font color="##FF0000"><strong>[Not found]</strong></font>
			</cfif>
			<br>
		</cfloop>
	</cffunction>
	
	<!---
		STD PTC Documents
	--->
	<cffunction name="STDFiles" access="remote" output="yes">
		
		<cfquery name="qFiles" datasource="#OldDSN#">
		SELECT CourseSectionDocID, Name, Description, FileName, FileType, FileSize, CourseSectionId, CreationDate, LastUpdate
		FROM cm_CourseSectionDoc 
		</cfquery>
		
		<cfoutput>
		<cfloop query="qFiles">
			<cfquery name="qActivity" datasource="#NewDSN#">
				SELECT ActivityID FROM ce_Activity
				WHERE ExternalID=#qFiles.CourseSectionID#
			</cfquery>
			
			<cfif qActivity.RecordCount GT 0>
				<font color="GREEN">Activity found. (#qActivity.ActivityID#)</font><br>
				
				<cfif DirectoryExists("#ExpandPath('\_uploads\ActivityFiles\#qActivity.ActivityID#\#qFiles.FileName#')#")>
					<cfdirectory action="delete" recurse="yes" directory="#ExpandPath('\_uploads\ActivityFiles\#qActivity.ActivityID#\#qFiles.FileName#')#">
				</cfif>
				
				<cfif NOT DirectoryExists("#ExpandPath('\_uploads\ActivityFiles\#qActivity.ActivityID#')#")>
					<cfdirectory action="create" directory="#ExpandPath('\_uploads\ActivityFiles\#qActivity.ActivityID#')#">
					<font color="GREEN">Created directory. (/_uploads/#qActivity.ActivityID#)<br></font>
				<cfelse>
					
					<font color="BLACK">Directory already exists. (/_uploads/#qActivity.ActivityID#)</font><br>
				</cfif>
				
				<cfif NOT FileExists("#ExpandPath('\_uploads\ActivityFiles\#qActivity.ActivityID#\#qFiles.FileName#')#")>
					<cfif FileExists("#ExpandPath('\_uploads\ActivityFiles\_old\#qFiles.CourseSectionID#\#qFiles.FileName#')#")>
						<cffile action="move" source="#ExpandPath('\_uploads\ActivityFiles\_old\#qFiles.CourseSectionID#\#qFiles.FileName#')#" destination="#ExpandPath('\_uploads\ActivityFiles\#qActivity.ActivityID#\#qFiles.FileName#')#">
						<font color="GREEN">File moved. (#qFiles.FileName#)</font><br>
					<cfelse>
						<font color="RED">File not found. (#qFiles.FileName#)</font><br>
					</cfif>
				<cfelse>
					<font color="BLACK">File already exists. (#qFiles.FileName#)</font><br>
				</cfif>
				
				<!---<!--- FILE DETAILS --->
				<cfset FileBean = CreateObject("component","#Application.Settings.Com#File.File").init()>
				<cfset FileBean.setFileName(qFiles.FileName)>
				<cfset FileBean.setFileCaption(qFiles.Name)>
				<cfset FileBean.setFileSize(qFiles.FileSize)>
				<cfset FileBean.setFileTypeID(3)>
				<cfset FileBean.setActivityID(qActivity.ActivityID)>
				<cfset FileBean.setCreatedBy(169841)>
				<cfset Application.Com.FileDAO.Create(FileBean)>
				
				<!--- ACTIVITY INFO --->
				<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=qActivity.ActivityID)>
				<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
				
				<!--- ACTION --->
				<cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
				<cfset ActionBean.setActivityID(qActivity.ActivityID)>
				<cfset ActionBean.setCode("FIU")>
				<cfset ActionBean.setShortName("Uploaded a file.")>
				<cfset ActionBean.setLongName("Uploaded file '#qFiles.FileName#' to activity '<a href=""/index.cfm/event/Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>'.")>\
				<cfset ActionBean.setCreatedBy(169841)>
				<cfset Application.Com.ActionDAO.Create(ActionBean)>--->
			<cfelse>
				<font color="RED">Activity not found. (#qActivity.ActivityID#)</font><br>
			</cfif>
		</cfloop>
		</cfoutput>
	</cffunction>
	
	<!---
		STD Evaluation Forms
	--->
	<cffunction name="STDEvalForms" access="remote" output="yes">
		<cfquery name="qCourses" datasource="#OldDSN#">
			SELECT     tC.CourseID AS ttCourseID, tC.Name, eC.CourseID AS ecCourseID
			FROM         dbo.ec_Course AS eC INNER JOIN
					  dbo.tt_Course AS tC ON eC.ttCourseId = tC.CourseID
			WHERE     (tC.CourseTypeID = 9)
		</cfquery>
		
		<cfloop query="qCourses">
			<div><strong>#qCourses.Name#</strong></div>
			
			<!--- FIND ACTIVITY --->
			<cfquery name="qActivity" datasource="#NewDSN#">
				SELECT ActivityID,ParentActivityID
				FROM ce_Activity
				WHERE Title='#qCourses.Name#'
			</cfquery>
			
			<cfif qActivity.RecordCount GT 0>
				<div>Found ActivityID: #qActivity.ActivityID#</div>
				<cfquery name="qEval" datasource="#OldDSN#">
					SELECT     dbo.ec_CourseItem.I2 AS EvalId
					FROM         dbo.ec_CourseItem INNER JOIN
					  dbo.ec_Test ON dbo.ec_CourseItem.I2 = dbo.ec_Test.TestId
					WHERE     (dbo.ec_CourseItem.I1 = #qCourses.ecCourseID#) AND (dbo.ec_CourseItem.I2 IS NOT NULL) AND (dbo.ec_Test.TestTypeId = 1) OR
					  (dbo.ec_CourseItem.I1 = #qCourses.ecCourseID#) AND (dbo.ec_CourseItem.I2 <> '') AND (dbo.ec_Test.TestTypeId = 1)
				</cfquery>
				
				<cfif qEval.RecordCount GT 0>
					<cfquery name="qTestInfo" datasource="#OldDSN#">
						SELECT     TestId, TestTypeId, Name, PassingScore, NumberQuestions, CreationDate, LastUpdate, RandomizeFlag
						FROM         dbo.ec_Test
						WHERE     TestID=#qEval.EvalId#
					</cfquery>
					
					<div>Name: #qTestInfo.Name#</div>
					
					<!--- TEST SAVE --->
					<cfset TestBean = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").init(ActivityID=qActivity.ActivityID)>

					<cfset TestBean.setAssessTypeID(1)>
					<cfset TestBean.setName(qTestInfo.Name)>
					<cfset TestBean.setPassingScore(qTestInfo.PassingScore)>
					<cfset TestBean.setMaxAttempts(0)>
					<cfset TestBean.setRequiredFlag("Y")>
					<cfset TestBean.setRandomFlag("N")>
					<cfset TestBean.setCommentFlag("N")>
					
					<cfset NewAssessID = Application.Com.AssessmentDAO.Create(TestBean)>
					
					<cfquery name="qQuestions" datasource="#OldDSN#">
						SELECT     TQ.TestQuestionId, TQ.TestId, TQ.QuestionText, TQ.SequenceNumber, TQ.AnswerTypeId, TQ.AnswerType, TQ.DisplayFlag, TQ.MCCorrectAnswer, 
						TQ.VC1, TQ.VC2, TQ.VC3, TQ.VC4, TQ.VC5, TQ.VC6, TQ.VC7, TQ.VC8, TQ.VC9, TQ.VC10, TQ.CreationDate, TQ.LastUpdate, AT.Code As AnswerTypeCode, AT.Description As AnswerTypeName
						FROM         dbo.ec_TestQuestion AS TQ INNER JOIN
						dbo.ec_AnswerType AS AT ON TQ.AnswerTypeId = AT.AnswerTypeID
						WHERE TQ.TestID=#qTestInfo.TestID#
						ORDER BY TQ.SequenceNumber
					</cfquery>
					
					<cfloop query="qQuestions">
						<div>[#qQuestions.AnswerTypeCode#] #qQuestions.QuestionText#</div>
						
						<!--- TYPE CONVERSION --->
						<cfswitch expression="#qQuestions.AnswerTypeCode#">
							<cfcase value="Caption">
								<cfset QuestionTypeID=5>
							</cfcase>
							<cfcase value="SubCaption">
								<cfset QuestionTypeID=6>
							</cfcase>
							<cfcase value="RadioH">
								<cfset QuestionTypeID=1>
							</cfcase>
							<cfcase value="RadioV">
								<cfset QuestionTypeID=1>
							</cfcase>
							<cfcase value="TextArea">
								<cfset QuestionTypeID=4>
							</cfcase>
							<cfcase value="Text">
								<cfset QuestionTypeID=3>
							</cfcase>
						</cfswitch>
						<cfset QuestionBean = CreateObject("component","#Application.Settings.Com#AssessQuestion.AssessQuestion").init(QuestionID=0)>
						
						<cfset QuestionBean.setQuestionTypeID(QuestionTypeID)>
						<cfset QuestionBean.setLabelText(qQuestions.QuestionText)>
						<cfset QuestionBean.setDetailText("")>
						<cfset QuestionBean.setRequiredFlag("N")>
						<cfset QuestionBean.setVC1(qQuestions.VC1)>
						<cfset QuestionBean.setVC2(qQuestions.VC2)>
						<cfset QuestionBean.setVC3(qQuestions.VC3)>
						<cfset QuestionBean.setVC4(qQuestions.VC4)>
						<cfset QuestionBean.setVC5(qQuestions.VC5)>
						<cfset QuestionBean.setVC6(qQuestions.VC6)>
						<cfset QuestionBean.setVC7(qQuestions.VC7)>
						<cfset QuestionBean.setVC8(qQuestions.VC8)>
						<cfset QuestionBean.setVC9(qQuestions.VC9)>
						<cfset QuestionBean.setVC10(qQuestions.VC10)>
						<cfset QuestionBean.setAssessmentID(NewAssessID)>
						
						<cfset Application.Com.AssessQuestionDAO.Create(QuestionBean)>
					</cfloop>
				</cfif>
			</cfif><!--- IF FOUND ACTIVITY --->
		</cfloop>
	</cffunction>
	
	<!---
		STD eLearning Container Set
	--->
	<cffunction name="STDeLearning" access="remote" output="yes">
		<cfquery name="qSTD" datasource="#OldDSN#">
			SELECT tt_CourseSection.CourseSectionId, tt_Course.Name AS CourseTitle, tt_CourseSection.StartDate AS CourseDate 
			FROM tt_Course 
			INNER JOIN tt_CourseSection ON tt_Course.CourseID = tt_CourseSection.CourseId 
			INNER JOIN cm_CourseSectionInfo ON tt_CourseSection.CourseSectionId = cm_CourseSectionInfo.CourseSectionID 
			INNER JOIN cm_EventType ON cm_CourseSectionInfo.EventTypeId = cm_EventType.EventTypeID 
			WHERE (cm_EventType.EventTypeID = 31)  AND (tt_Course.CourseID <> 1739) AND (tt_Course.CourseTypeId = 9) AND (tt_Course.CourseID <> 785) AND (tt_Course.CourseTypeId = 9) AND (tt_Course.CourseID <> 790) AND (tt_Course.CourseTypeId = 9) AND (tt_Course.CourseID <> 783) AND (tt_Course.CourseTypeId = 9) AND (tt_Course.CourseID <> 4010) AND (tt_Course.CourseTypeId = 9) AND (tt_Course.CourseID <> 2884) AND (tt_Course.CourseTypeId = 9) ORDER BY tt_CourseSection.StartDate DESC
		</cfquery>
		
		<cfloop query="qSTD">
			#qSTD.CourseTitle#...
			<cfquery name="qActivity" datasource="#NewDSN#">
				SELECT ActivityID,ExternalID FROM ce_Activity WHERE ExternalID='#qSTD.CourseSectionID#'
			</cfquery>
			
			<cfloop query="qActivity">
			found [#qActivity.ActivityID#] [#qActivity.ExternalID#]
			<cfquery name="qInsert" datasource="#NewDSN#">
				INSERT INTO ce_Activity_Category (
					ActivityID,
					CategoryID,
					CreatedBy
				) VALUES (
					#qActivity.ActivityID#,
					162,
					169841
				)
			</cfquery>
			</cfloop>
			<br>
			
		</cfloop>
	</cffunction>
	
	<!---
		STD COURSE LIST TO ExternalID FIELD
	--->
	<cffunction name="STDCourseList" access="remote" displayname="Import from CSV" output="yes" returntype="any">
		<cffile action="read" file="#ExpandPath('STDCourseList.csv')#" variable="FileVar">
		<cfset CSVFile = Replace(FileVar,'NULL','','ALL')>
		<cfset CSVFile = Replace(FileVar,'"','','ALL')>
		<cfset CSVFile = ListFix(CSVFile)>
		
		<cfset STD = StructNew()>
		
		<cfloop list="#CSVFile#" index="row" delimiters="#Chr(10)#">
			<cfif GetToken(row,1,",") NEQ "ID">
				<cfset STD.ExternalID = Replace(GetToken(row,2,","),"NULL","")>
				<cfset STD.Title = Replace(GetToken(row,3,","),"NULL","")>
				
				<cfquery name="qFind" datasource="#NewDSN#">
					SELECT ActivityID,Title
					FROM ce_Activity
					WHERE Title=<cfqueryparam value="#Trim(STD.Title)#" cfsqltype="cf_sql_varchar" />
				</cfquery>
				#STD.Title#
				<cfif qFind.RecordCount GTE 1>
					 (Found #qFind.RecordCount#)<br>
					 <cfloop query="qFind">
					 	<cfquery name="qUpdate" datasource="#NewDSN#">
							UPDATE ce_Activity
							SET ExternalID=<cfqueryparam value="#STD.ExternalID#" cfsqltype="cf_sql_varchar" />
							WHERE ActivityID=#qFind.ActivityID#
						</cfquery>
					 </cfloop>
				<cfelse>
					Not Found!<br>
				</cfif>
			</cfif>
		</cfloop>
	</cffunction>
	
    <!--- 
		PIF FORM 
	--->
    <cffunction name="PIF" access="remote" displayname="Migrate PIFs" output="yes" returntype="any">
    	<cfquery name="qGet" datasource="#NewDSN#">
            SELECT     
            	Att.AttendeeID, 
                Att.ActivityID, 
                Act.ReleaseDate, 
                Act.Title, 
                Att.PersonID
            FROM ce_Attendee AS Att 
            INNER JOIN ce_Activity AS Act ON Att.ActivityID = Act.ActivityID
            WHERE 
            	(Att.DeletedFlag = 'N') AND
              ((SELECT     COUNT(Activity_CategoryID) AS CatCount
                  FROM         ce_Activity_Category AS AC
                  WHERE     (CategoryID = 31) AND (DeletedFlag = 'N') AND (ActivityID = Att.ActivityID)) > 0)
                  AND Act.ReleaseDate >= '4/1/2009 00:00:00' AND Act.ReleaseDate < '4/1/2010 00:00:00'
             ORDER BY Act.ReleaseDate
        </cfquery>
        
        <cfoutput>
        <cfloop query="qGet">
        	<cfquery name="qPIF" datasource="#OldDSN#">
                SELECT  TOP 1 STD.cdcSTDInfoId, STD.Registrationid, STD.CBAFundId, STD.CBACDC, STD.CBAOth, STD.CBOFundId, STD.CBOCDC, STD.CBOOth, STD.FunRCId, 
                  STD.FunRCSp, STD.FunRNId, STD.FunRNSp, STD.MarketId, STD.Mspecify, STD.OccClassId, STD.OrgTypeId, STD.Tspecify, STD.ProfCId, STD.ProfCSp, 
                  STD.ProfNId, STD.ProfNSp, STD.WorkState, STD.WorkZip, STD.FocSTD, STD.FocHIV, STD.FocWRH, STD.FocGen, STD.FocAdol, STD.FocMH, 
                  STD.FocSub, STD.FocEm, STD.FocCor, STD.FocOth, STD.FocSpec, STD.PopGen, STD.PopAdol, STD.PopGLB, STD.PopTran, STD.PopHome, 
                  STD.PopCorr, STD.PopPreg, STD.PopSW, STD.PopAA, STD.PopAs, STD.PopNH, STD.PopAIAN, STD.PopHisp, STD.PopImm, STD.PopIDU, STD.PopSub, 
                  STD.PopHIV, STD.PopOth, STD.PopSpec, STD.[Update], STD.Eval, STD.TrainingAlert, STD.CurrentlyEnrolled, STD.RelevantTraining, 
                  STD.MotivationTraining
                FROM         dbo.cm_Registration AS R INNER JOIN
                  dbo.tt_CourseSection AS CS ON R.CourseSectionId = CS.CourseSectionId INNER JOIN
                  dbo.cm_cdcSTDInfo AS STD ON R.RegistrationID = STD.Registrationid
                WHERE     (R.AttendeeID = #qGet.PersonID#) AND (CS.StartDate BETWEEN '#DateFormat(qGet.ReleaseDate,"mm/dd/yyyy")# 00:00:00' AND '#DateFormat(qGet.ReleaseDate,"mm/dd/yyyy")# 23:59:59')
                ORDER BY STD.CreationDate DESC
            </cfquery>
            <cfif qPIF.RecordCount GT 0>
            #qGet.PersonID# #DateFormat(qGet.ReleaseDate,"mm/dd/yyyy")#...<cfflush>
            <cftry>
				<cfset CDCBean = CreateObject("component","#Application.Settings.Com#Attendee.AttendeeCDC").init()>
                <cfset CDCBean.setAttendeeID(qGet.AttendeeID)>
                
				<cfset CDCBean.setCBAFundID(qPIF.CBAFundId)>
				<cfset CDCBean.setCBACDC(qPIF.CBACDC)>
				<cfset CDCBean.setCBAOth(qPIF.CBAOth)>
				<cfset CDCBean.setCBOFundID(qPIF.CBOFundId)>
				<cfset CDCBean.setCBOCDC(qPIF.CBOCDC)>
				<cfset CDCBean.setCBOOth(qPIF.CBOOth)>
                <cfset CDCBean.setProfCId(qPIF.ProfCId)>
                <cfset CDCBean.setProfCSp(qPIF.ProfCSp)>
                <cfset CDCBean.setProfNId(qPIF.ProfNId)>
                <cfset CDCBean.setProfNSp(qPIF.ProfNSp)>
                
                <cfset CDCBean.setFunRCId(qPIF.FunRCId)>
                <cfset CDCBean.setFunRCSp(qPIF.FunRCSp)>
                <cfset CDCBean.setFunRNId(qPIF.FunRNId)>
                <cfset CDCBean.setFunRNSp(qPIF.FunRNSp)>
                
                <cfset CDCBean.setOccClassID(qPIF.OccClassID)>
                <cfset CDCBean.setOrgTypeID(qPIF.OrgTypeID)>
                <cfset CDCBean.setTspecify(qPIF.Tspecify)>
                
                <cfset CDCBean.setWorkState(qPIF.WorkState)>
                <cfset CDCBean.setWorkZip(qPIF.WorkZip)>
                
                <cfset CDCBean.setFocSTD(qPIF.FocSTD)>
                <cfset CDCBean.setFocHIV(qPIF.FocHIV)>
                <cfset CDCBean.setFocWRH(qPIF.FocWRH)>
                <cfset CDCBean.setFocGen(qPIF.FocGen)>
                <cfset CDCBean.setFocAdol(qPIF.FocAdol)>
                <cfset CDCBean.setFocMH(qPIF.FocMH)>
                <cfset CDCBean.setFocSub(qPIF.FocSub)>
                <cfset CDCBean.setFocEm(qPIF.FocEm)>
                <cfset CDCBean.setFocCor(qPIF.FocCor)>
                <cfset CDCBean.setFocOth(qPIF.FocOth)>
                <cfset CDCBean.setFocSpec(qPIF.FocSpec)>
                
                <cfset CDCBean.setPopGen(qPIF.PopGen)>
                <cfset CDCBean.setPopAdol(qPIF.PopAdol)>
                <cfset CDCBean.setPopGLB(qPIF.PopGLB)>
                <cfset CDCBean.setPopTran(qPIF.PopTran)>
                <cfset CDCBean.setPopHome(qPIF.PopHome)>
                <cfset CDCBean.setPopCorr(qPIF.PopCorr)>
                <cfset CDCBean.setPopPreg(qPIF.PopPreg)>
                <cfset CDCBean.setPopSW(qPIF.PopSW)>
                <cfset CDCBean.setPopAA(qPIF.PopAA)>
                <cfset CDCBean.setPopAs(qPIF.PopAs)>
                <cfset CDCBean.setPopNH(qPIF.PopNH)>
                <cfset CDCBean.setPopAIAN(qPIF.PopAIAN)>
                <cfset CDCBean.setPopHisp(qPIF.PopHisp)>
                <cfset CDCBean.setPopImm(qPIF.PopImm)>
                <cfset CDCBean.setPopSub(qPIF.PopSub)>
                <cfset CDCBean.setPopIDU(qPIF.PopIDU)>
                <cfset CDCBean.setPopHIV(qPIF.PopHIV)>
                <cfset CDCBean.setPopOth(qPIF.PopOth)>
                <cfset CDCBean.setPopSpec(qPIF.PopSpec)>
                
                <cfset CDCBean.setMarketId(qPIF.MarketID)>
                <cfset CDCBean.setMspecify(qPIF.Mspecify)>
                <cfset CDCBean.setUpdates(qPIF.Update)>
                <cfset CDCBean.setEval(qPIF.Eval)>
                <cfset CDCBean.setTrainingAlert(qPIF.TrainingAlert)>
                <cfset CDCBean.setCurrentlyEnrolled(qPIF.CurrentlyEnrolled)>
                <cfset CDCBean.setRelevantTraining(qPIF.RelevantTraining)>
                <cfset CDCBean.setMotivationTraining(qPIF.MotivationTraining)>
                
                <!--- Set who updated the info --->
                <cfset CDCBean.setCreatedBy(qGet.AttendeeID)>
                <cfset CDCBean = Application.Com.AttendeeCDCDAO.Create(CDCBean)>
             <cfcatch>
        	[failed]<cfflush>
            </cfcatch>
            </cftry>
            <br />
            </cfif>
        </cfloop>
        </cfoutput>
    </cffunction>
    
    
    <!---
		ACTIVITIES
	--->
	<cffunction name="Activity" access="remote" displayname="Migrate Activities" output="yes" returntype="any">
		<cfargument name="Mode" type="numeric" required="yes">
		<cfargument name="ItemSet" type="numeric" required="yes">
        <cfargument name="TheDay" type="numeric" required="no" default="1">
        <cfargument name="TheYear" type="numeric" required="no" default="1999">
		<!---
		Modes:
		1 = Grand Rounds
		2 = All Other Courses
		--->
       
       <cfset Yr = Arguments.TheYear>       
 		
		<cfswitch expression="#Arguments.Mode#">
			<cfcase value="1">
            	<cfset i = Arguments.ItemSet>
				<cfset StartMonthDay = "#i#/#Arguments.TheDay#">
                <cfset LastDay = LastDayOfMonth(i,Yr)>
                <cfset EndMonthDay = "#i#/#Arguments.TheDay#">
                
                <cfset RunGrandRounds()>
                
                <cfif Arguments.TheDay LT Day(LastDay)>
                	<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Activity&Mode=1&TheDay=#Arguments.TheDay+1#&ItemSet=#i#&TheYear=#Yr#';</script></cfoutput>
                <cfelse>
					<cfif i LT 12>
                        <cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Activity&Mode=1&ItemSet=#i+1#&TheYear=#Yr#';</script></cfoutput>
                    <cfelse>
                        <cfif Yr LTE 2009>
                            <cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Activity&Mode=1&ItemSet=1&TheYear=#Yr+1#';</script></cfoutput>
                        <cfelse>
                            Complete!
                        </cfif>
                    </cfif>
                </cfif>
			</cfcase>
			<cfcase value="2">		
                <cfset i = Arguments.ItemSet>
				<cfset StartMonthDay = "#i#/#Arguments.TheDay#">
                <cfset LastDay = LastDayOfMonth(i,Yr)>
                <cfset EndMonthDay = "#i#/#Arguments.TheDay#">
                
                <cfset RunAllOthers()>
                
                <cfif Arguments.TheDay LT Day(LastDay)>
                	<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Activity&Mode=2&TheDay=#Arguments.TheDay+1#&ItemSet=#i#&TheYear=#Yr#';</script></cfoutput>
                <cfelse>
					<cfif i LT 12>
                        <cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Activity&Mode=2&ItemSet=#i+1#&TheYear=#Yr#';</script></cfoutput>
                    <cfelse>
                        <cfif Yr LTE 2009>
                            <cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Activity&Mode=2&ItemSet=1&TheYear=#Yr+1#';</script></cfoutput>
                        <cfelse>
                            Complete!
                        </cfif>
                    </cfif>
                </cfif>
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<cffunction name="isMD" access="public" displayname="Is MD" output="no" returntype="boolean">
		<cfargument name="PersonID" type="numeric" required="yes">
		
		<cfset var PersonMD = false>
		
		<cfquery name="qEducation" datasource="#OldDSN#">
			SELECT EducationID FROM pd_Person_Education WHERE PersonID=<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
		</cfquery>
	
		<cfloop query="qEducation">
			<cfif ListFind(Application.Settings.MDlist,qEducation.EducationID,",")>
				<cfset PersonMD = true>
			</cfif>
		</cfloop>
		
		<cfreturn PersonMD />
	</cffunction>
    
   <!--- <cffunction name="RunGrandRounds" access="public">
		<!--- GRAND ROUNDS --->
        <cfset qEventTypes = QueryNew("EventTypeID,EventType,Sponsor,CSCount,ReleaseDate,StartDate,EndDate,Location")>
        <cfquery name="qInitialRecs" datasource="#OldDSN#" timeout="#CreateTimeSpan(0,1,0,0)#">
            SELECT     EventTypeID, EventType,
                    (SELECT     TOP 1 CSI.SponsoringDept AS Expr1
                            FROM          cm_CourseSectionInfo AS CSI INNER JOIN
                                                   tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                                                   tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
                                                   cm_CourseInfo AS CI ON C.CourseID = CI.CourseID
                            WHERE     (CSI.EventTypeId = ET.EventTypeID) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59') ORDER BY SponsoringDept DESC) 
                      AS Sponsor,
                          (SELECT     COUNT(CSI.CourseSectionID) AS Expr1
                            FROM          cm_CourseSectionInfo AS CSI INNER JOIN
                                                   tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                                                   tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
                                                   cm_CourseInfo AS CI ON C.CourseID = CI.CourseID
                            WHERE      (CSI.EventTypeId = ET.EventTypeID) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')) 
                      AS CSCount,
                          (SELECT     MIN(CS.StartDate) AS Expr1
                            FROM          cm_CourseSectionInfo AS CSI INNER JOIN
                                                   tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                                                   tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
                                                   cm_CourseInfo AS CI ON C.CourseID = CI.CourseID
                            WHERE      (CSI.EventTypeId = ET.EventTypeID) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')) 
                      AS ReleaseDate,
                          (SELECT     MIN(CS.StartDate) AS Expr1
                            FROM          cm_CourseSectionInfo AS CSI INNER JOIN
                                                   tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                                                   tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
                                                   cm_CourseInfo AS CI ON C.CourseID = CI.CourseID
                            WHERE      (CSI.EventTypeId = ET.EventTypeID) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')) 
                      AS StartDate,
                          (SELECT     MAX(CS.EndDate) AS Expr1
                            FROM          cm_CourseSectionInfo AS CSI INNER JOIN
                                                   tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                                                   tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
                                                   cm_CourseInfo AS CI ON C.CourseID = CI.CourseID
                            WHERE      (CSI.EventTypeId = ET.EventTypeID) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')) 
                      AS EndDate,
                          (SELECT     TOP (1) TF.Name
                            FROM          cm_CourseSectionInfo AS CSI INNER JOIN
                                                   tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                                                   tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
                                                   cm_CourseInfo AS CI ON C.CourseID = CI.CourseID LEFT OUTER JOIN
                                                   tt_TrainingFacility AS TF ON CS.TrainingFacilityId = TF.TrainingFacilityId
                            WHERE      (CSI.EventTypeId = ET.EventTypeID) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')) AS Location
            FROM         cm_EventType AS ET
            WHERE     ((SELECT     COUNT(CSI.CourseSectionID) AS Expr1
                         FROM         cm_CourseSectionInfo AS CSI INNER JOIN
                                               tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                                               tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
                                               cm_CourseInfo AS CI ON C.CourseID = CI.CourseID
                         WHERE     (CSI.EventTypeId = ET.EventTypeID) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')) > 0)
            ORDER BY EventType
        </cfquery>
        
        <cfloop query="qInitialRecs">
            <cfset newRow = QueryAddRow(qEventTypes)>
            <cfset QuerySetCell(qEventTypes,"EventTypeID",qInitialRecs.EventTypeID)>
            <cfset QuerySetCell(qEventTypes,"EventType",qInitialRecs.EventType)>
            <cfset QuerySetCell(qEventTypes,"Sponsor",qInitialRecs.Sponsor)>
            <cfset QuerySetCell(qEventTypes,"CSCount",qInitialRecs.CSCount)>
            <cfset QuerySetCell(qEventTypes,"ReleaseDate",qInitialRecs.ReleaseDate)>
            <cfset QuerySetCell(qEventTypes,"StartDate",qInitialRecs.StartDate)>
            <cfset QuerySetCell(qEventTypes,"EndDate",qInitialRecs.EndDate)>
            <cfset QuerySetCell(qEventTypes,"Location",qInitialRecs.Location)>
        </cfloop>
    
    
    <cfquery name="qEventTypes" dbtype="query">
        SELECT * FROM qEventTypes
    </cfquery>
    <cfloop query="qEventTypes">
        <cfquery name="qCS" datasource="#OldDSN#" timeout="#CreateTimeSpan(0,1,0,0)#">
            SELECT DISTINCT CS.CourseId, ISNULL
                  ((SELECT     SUM(Amount) AS Expr1
                      FROM         cm_CourseContrib AS CC
                      WHERE     (CourseID = CS.CourseId)), 0) AS Amount
            FROM         cm_CourseSectionInfo AS CSI INNER JOIN
              tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId
            WHERE     (CSI.EventTypeId = #qEventTypes.EventTypeID#) AND (ISNULL
                  ((SELECT     SUM(Amount) AS Expr1
                      FROM         cm_CourseContrib AS CC
                      WHERE     (CourseID = CS.CourseId)), 0) > 0)
            ORDER BY CS.CourseId
        </cfquery>
        <cfset TotalCSDollars = 0>
        <cfset TotalCSCount = qCS.RecordCount>
        <cfloop query="qCS">
            <cfset TotalCSDollars = TotalCSDollars + qCS.Amount>
        </cfloop>
        
        <!--- CHECK IF PARENT ALREADY EXISTS --->
        <cfquery name="qCheck" datasource="#NewDSN#">
        	SELECT ActivityID FROM ce_Activity
            WHERE Title='#qEventTypes.EventType# #Yr#' AND DeletedFlag='N'
        </cfquery>
       
	   <cfset ParentActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init()>
       
        <cfif qCheck.ActivityID NEQ "">
       		<cfset ParentActivity.setActivityID(qCheck.ActivityID)>
           	<cfset NewActivityID = qCheck.ActivityID>
        <cfelse>
			<cfset ParentActivity.setActivityTypeID(1)>
            <cfset ParentActivity.setGroupingID(2)>
            <cfset ParentActivity.setTitle(qEventTypes.EventType & " #Yr#")>
            <cfset ParentActivity.setDescription("All grand rounds for #Yr#")>
            <cfset ParentActivity.setReleaseDate(qEventTypes.ReleaseDate)>
            <cfset ParentActivity.setStartDate(qEventTypes.StartDate)>
            <cfset ParentActivity.setEndDate(qEventTypes.EndDate)>
            <cfset ParentActivity.setLocation(qEventTypes.Location)>
            <cfset ParentActivity.setSessionType("M")>
            <cfset ParentActivity.setStatusID(1)>
            <cfset ParentActivity.setStatMaxRegistrants(0)>
            <cfset ParentActivity.setStatAttendees(0)>
            <cfset ParentActivity.setStatAddlAttendees(0)>
            <cfset ParentActivity.setStatMD(0)>
            <cfset ParentActivity.setStatNonMD(0)>
            <cfset ParentActivity.setStatSupporters(TotalCSCount)>
            <cfset ParentActivity.setStatSuppAmount(TotalCSDollars)>
            
            <cfif qEventTypes.Sponsor NEQ "">
				<cfset ParentActivity.setSponsor(qEventTypes.Sponsor)>
                <cfset ParentActivity.setSponsorship("J")>
            <cfelse>
                <cfset ParentActivity.setSponsorship("D")>
            </cfif>
            
            <cfset ParentActivity.setCreatedBy(169841)>
            <cfset ParentActivity.setDeletedFlag("N")>
            <cfset NewActivityID = Application.Com.ActivityDAO.Create(ParentActivity)>
            <cfset ParentActivity.setActivityID(NewActivityID)>
            
			<cfset Containers(EventType=qEventTypes.EventType,ActivityID=NewActivityID)> 
         </cfif>
         
         <cfset ParentActivity = Application.Com.ActivityDAO.Read(ParentActivity)>
         
        
        
        <cfquery name="qSessions" datasource="#OldDSN#">
            SELECT     CS.CourseSectionID,C.Name, C.Description, isNull(CS.CurrentEnrollment,0) As CurrentEnrollment, CSI.SponsoringDept, isNull(CS.StartDate,'1/1/1970') AS ReleaseDate, isNull(CS.StartDate,'1/1/1970') As StartDate, isNull(CS.EndDate,'1/1/1970') As EndDate, CS.CourseStatusID, isNull(CS.MaxEnrollment,0) As MaxEnrollment, TF.Name AS Location, TF.Address1, TF.Address2, TF.City, TF.StateId, TF.PostalCode, 
              'M' AS SessionType, 1 AS StatusID
            FROM         cm_CourseSectionInfo AS CSI INNER JOIN
              tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
              tt_Course AS C ON CS.CourseId = C.CourseID INNER JOIN
              cm_CourseInfo AS CI ON C.CourseID = CI.CourseID LEFT OUTER JOIN
              tt_TrainingFacility AS TF ON CS.TrainingFacilityId = TF.TrainingFacilityId
            WHERE     (CSI.EventTypeId = #qEventTypes.EventTypeID#) AND (CI.IsGrandRounds = -1) AND (CS.StartDate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')
        </cfquery>
        
        <cfloop query="qSessions">
            <cfset SessionBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init()>
            <cfset SessionBean.setParentActivityID(NewActivityID)>
            <cfset SessionBean.setActivityTypeID(1)>
            <cfset SessionBean.setGroupingID(2)>
            <cfset SessionBean.setTitle(qSessions.Name)>
            <cfset SessionBean.setDescription(qSessions.Description)>
            <cfset SessionBean.setReleaseDate(qSessions.ReleaseDate)>
            <cfset SessionBean.setStartDate(qSessions.StartDate)>
            <cfset SessionBean.setEndDate(qSessions.EndDate)>
            <cfset SessionBean.setLocation(qSessions.Location)>
            <cfset SessionBean.setAddress1(qSessions.Address1)>
            <cfset SessionBean.setAddress2(qSessions.Address2)>
            <cfset SessionBean.setCity(qSessions.City)>
            <cfset SessionBean.setState(qSessions.StateId)>
            <cfset SessionBean.setPostalCode(qSessions.PostalCode)>
            <cfset SessionBean.setSessionType("M")>
            <cfset SessionBean.setExternalID(qSessions.CourseSectionID)>
			
            <cfif qSessions.SponsoringDept NEQ "">
                <cfset SessionBean.setSponsorship("J")>
				<cfset SessionBean.setSponsor(qSessions.SponsoringDept)>
            <cfelse>
                <cfset SessionBean.setSponsorship("D")>
            </cfif>
            
            <!--- DETERMINE STATUS --->
            <cfswitch expression="#qSessions.CourseStatusID#">
                <cfcase value="3"> <!--- ENDED --->
                    <cfset SessionBean.setStatusID(3)>
                </cfcase>
                <cfcase value="4"> <!--- CANCEL --->
                    <cfset SessionBean.setStatusID(4)>
                </cfcase>
                <cfcase value="5"> <!--- ACTIVE --->
                    <cfset SessionBean.setStatusID(1)>
                </cfcase>
                <cfcase value="6"> <!--- PENDING --->
                    <cfset SessionBean.setStatusID(2)>
                </cfcase>
                <cfdefaultcase>
                    <cfset SessionBean.setStatusID(2)>
                </cfdefaultcase>
            </cfswitch>
            
            <cfif isNumeric(qSessions.MaxEnrollment)>
            	<cfset SessionBean.setStatMaxRegistrants(qSessions.MaxEnrollment)>
            <cfelse>
				<cfset SessionBean.setStatMaxRegistrants(0)>
            </cfif>
            <cfset SessionBean.setStatAttendees(0)>
            <cfset SessionBean.setStatAddlAttendees(qSessions.CurrentEnrollment)>
            <cfset SessionBean.setStatMD(0)>
            <cfset SessionBean.setStatNonMD(0)>
            <cfset SessionBean.setStatSupporters(0)>
            <cfset SessionBean.setStatSuppAmount(0)>
            <cfset SessionBean.setDeletedFlag("N")>
            <cfset NewSessionID = Application.Com.ActivityDAO.Create(SessionBean)>
            <cfset SessionBean.setActivityID(NewSessionID)>
            
			<!--- FUNCS --->
			<cfset Containers(EventType=qEventTypes.EventType,ActivityID=NewSessionID)> 
			<cfset Credit(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
			<!---<cfset Attendees(qSessions.CourseSectionID)>--->
			<cfset Agenda(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
			<cfset Applications(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
			<cfset Committee(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
			<cfset Fees(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
            
            <cfset Application.Com.ActivityDAO.Update(SessionBean)>
        </cfloop><!--- SESSIONS --->
        
        <cfset Application.Com.ActivityDAO.Update(ParentActivity)>
    </cfloop><!--- PARENTS --->
    <!--- // END GRAND ROUNDS --->
    </cffunction>--->
    
    <cffunction name="RunAllOthers" access="public">
    	<!--- ALL OTHER ACTIVITIES --->
        <cfquery name="qCourses" datasource="#OldDSN#" timeout="#CreateTimeSpan(0,1,0,0)#">
            SELECT     C.CourseID, C.Name, C.Description,
                (SELECT     TOP (1) CSI.SponsoringDept
FROM         tt_CourseSection AS CS INNER JOIN
                      cm_CourseSectionInfo AS CSI ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                      cm_EventType ON CSI.EventTypeId = cm_EventType.EventTypeID
WHERE     (CS.CourseId = C.CourseID)) AS SponsoringDept,
                  isNull((SELECT     MIN(StartDate) AS Expr1
                    FROM          tt_CourseSection AS CS
                    WHERE      (CourseId = C.CourseID)),'1/1/1970') AS ReleaseDate,
                  isNull((SELECT     MIN(StartDate) AS Expr1
                    FROM          tt_CourseSection AS CS
                    WHERE      (CourseId = C.CourseID)),'1/1/1970') AS StartDate,
                  isNull((SELECT     MAX(EndDate) AS Expr1
                    FROM          tt_CourseSection AS CS
                    WHERE      (CourseId = C.CourseID)),'1/1/1970') AS EndDate,
                  (SELECT     COUNT(CourseContribID) AS Expr1
                    FROM          cm_CourseContrib AS CS
                    WHERE      (CourseID = C.CourseID)) AS TotalSupporters, ISNULL
                  ((SELECT     SUM(Amount) AS Expr1
                      FROM         cm_CourseContrib AS CS
                      WHERE     (CourseID = C.CourseID)), 0) AS TotalDollars,
                  (SELECT     TOP (1) cm_EventType.EventType
FROM         tt_CourseSection AS CS INNER JOIN
                      cm_CourseSectionInfo AS CSI ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
                      cm_EventType ON CSI.EventTypeId = cm_EventType.EventTypeID
WHERE     (CS.CourseId = C.CourseID) AND (ISNULL(CSI.EventTypeId, '') <> '')) AS EventType, CT.Description AS Expr1
            FROM         cm_CourseInfo AS CI INNER JOIN
              tt_Course AS C ON CI.CourseID = C.CourseID LEFT OUTER JOIN
              tt_CourseType AS CT ON C.CourseTypeID = CT.CourseTypeID
            WHERE     (CI.IsGrandRounds = 0) AND (C.Name <> '') AND (C.LastUpdate BETWEEN '#StartMonthDay#/#Yr# 00:00:00' AND '#EndMonthDay#/#Yr# 23:59:59')
        </cfquery>
        
        <cfloop query="qCourses">
			<!--- CHECK IF EXISTS --->
			<cfquery name="qCheckParent" datasource="#NewDSN#">
				SELECT ActivityID FROM ce_Activity WHERE Title='#qCourses.Name#' AND ReleaseDate=#CreateODBCDateTime(qCourses.ReleaseDate)#
			</cfquery>
			
			<cfif qCheckParent.RecordCount GT 0>
			   <!--- <cfset ParentActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init()>
				<cfset ParentActivity.setActivityTypeID(1)>
				<cfset ParentActivity.setGroupingID(1)>
				<cfset ParentActivity.setTitle(qCourses.Name)>
				<cfset ParentActivity.setDescription(qCourses.Description)>
				<cfset ParentActivity.setReleaseDate(qCourses.ReleaseDate)>
				<cfset ParentActivity.setStartDate(qCourses.StartDate)>
				<cfset ParentActivity.setEndDate(qCourses.EndDate)>
				<cfset ParentActivity.setSessionType("M")>
				<cfset ParentActivity.setStatAttendees(0)>
				<cfset ParentActivity.setStatMaxRegistrants(0)>
				<cfset ParentActivity.setStatAddlAttendees(0)>
				<cfset ParentActivity.setStatMD(0)>
				<cfset ParentActivity.setStatNonMD(0)>
				<cfset ParentActivity.setStatSupporters(qCourses.TotalSupporters)>
				<cfset ParentActivity.setStatSuppAmount(qCourses.TotalDollars)>		
				<cfset ParentActivity.setCreatedBy(169841)>
				<cfset ParentActivity.setDeletedFlag("N")>
				<cfif qCourses.SponsoringDept NEQ "">
					<cfset ParentActivity.setSponsor(qCourses.SponsoringDept)>
					<cfset ParentActivity.setSponsorship("J")>
				<cfelse>
					<cfset ParentActivity.setSponsorship("D")>
				</cfif>
				<cfset NewActivityID = Application.Com.ActivityDAO.Create(ParentActivity)>
				<cfset ParentActivity.setActivityID(NewActivityID)>
				
				<!--- PARENT CATEGORIE --->
				<cfset Containers(EventType=qCourses.EventType,ActivityID=NewActivityID)> 
				--->
				<cfquery name="qSessions" datasource="#OldDSN#">
					SELECT     CS.CourseSectionId, C.Name, C.Description, ISNULL(CS.CurrentEnrollment, 0) AS CurrentEnrollment, CSI.SponsoringDept, ISNULL(CS.MaxEnrollment, 
						  0) AS MaxEnrollment, ISNULL(CS.StartDate, '1/1/1970') AS ReleaseDate, ISNULL(CS.StartDate, '1/1/1970') AS StartDate, ISNULL(CS.EndDate, '1/1/1970')
						   AS EndDate, CS.CourseStatusId, TF.Name AS Location, TF.Address1, TF.Address2, TF.City, TF.StateId, TF.PostalCode, 'M' AS SessionType, 
						  1 AS StatusID
	FROM         dbo.cm_CourseSectionInfo AS CSI RIGHT OUTER JOIN
						  dbo.cm_CourseInfo AS CI INNER JOIN
						  dbo.tt_Course AS C ON CI.CourseID = C.CourseID INNER JOIN
						  dbo.tt_CourseSection AS CS ON C.CourseID = CS.CourseId ON CSI.CourseSectionID = CS.CourseSectionId LEFT OUTER JOIN
						  dbo.tt_TrainingFacility AS TF ON CS.TrainingFacilityId = TF.TrainingFacilityId
					WHERE (CS.CourseID=#qCourses.CourseID#)
				</cfquery>
				
				<cfloop query="qSessions">
					<!--- CHECK IF EXISTS --->
					<cfquery name="qCheck" datasource="#NewDSN#">
						SELECT ActivityID,ParentActivityID FROM ce_Activity WHERE Title='#qSessions.Name#' AND ReleaseDate=#CreateODBCDateTime(qSessions.StartDate)#
					</cfquery>
					
					<cfif qCheck.RecordCount EQ 0>
						Create<br><cfflush>
						<cflog type="information" text="#qSessions.CourseSectionID# Creating" file="MigrateLog">
						<cfset SessionBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init()>
						<cfset SessionBean.setParentActivityID(qCheckParent.ActivityID)>
						<cfset SessionBean.setActivityTypeID(1)>
						<cfset SessionBean.setGroupingID(1)>
						<cfset SessionBean.setTitle(qSessions.Name)>
						<cfset SessionBean.setDescription(qSessions.Description)>
						<cfset SessionBean.setReleaseDate(qSessions.ReleaseDate)>
						<cfset SessionBean.setStartDate(qSessions.StartDate)>
						<cfset SessionBean.setEndDate(qSessions.EndDate)>
						<cfset SessionBean.setLocation(qSessions.Location)>
						<cfset SessionBean.setAddress1(qSessions.Address1)>
						<cfset SessionBean.setAddress2(qSessions.Address2)>
						<cfset SessionBean.setCity(qSessions.City)>
						<cfset SessionBean.setState(qSessions.StateId)>
						<cfset SessionBean.setPostalCode(qSessions.PostalCode)>
						<cfset SessionBean.setSessionType("M")>
						
						<cfif qSessions.SponsoringDept NEQ "">
							<cfset SessionBean.setSponsor(qSessions.SponsoringDept)>
							<cfset SessionBean.setSponsorship("J")>
						<cfelse>
							<cfset SessionBean.setSponsorship("D")>
						</cfif>
						
						<!--- DETERMINE STATUS --->
						<cfswitch expression="#qSessions.CourseStatusID#">
							<cfcase value="3"> <!--- ENDED --->
								<cfset SessionBean.setStatusID(3)>
							</cfcase>
							<cfcase value="4"> <!--- CANCEL --->
								<cfset SessionBean.setStatusID(4)>
							</cfcase>
							<cfcase value="5"> <!--- ACTIVE --->
								<cfset SessionBean.setStatusID(1)>
							</cfcase>
							<cfcase value="6"> <!--- PENDING --->
								<cfset SessionBean.setStatusID(2)>
							</cfcase>
							<cfdefaultcase>
								<cfset SessionBean.setStatusID(2)>
							</cfdefaultcase>
						</cfswitch>
						
						 <cfif isNumeric(qSessions.MaxEnrollment)>
							<cfset SessionBean.setStatMaxRegistrants(qSessions.MaxEnrollment)>
						<cfelse>
							<cfset SessionBean.setStatMaxRegistrants(0)>
						</cfif>
						
						<cfset SessionBean.setStatAttendees(0)>
						<cfset SessionBean.setStatAddlAttendees(qSessions.CurrentEnrollment)>
						<cfset SessionBean.setStatMD(0)>
						<cfset SessionBean.setStatNonMD(0)>
						<cfset SessionBean.setStatSupporters(0)>
						<cfset SessionBean.setStatSuppAmount(0)>
						<cfset SessionBean.setDeletedFlag("N")>
						<cfset SessionBean.setCreatedBy(169841)>
						<cfset SessionBean.setCreated(now())>
						<cfset SessionBean.setExternalID(qSessions.CourseSectionID)>
						<cfset NewSessionID = Application.Com.ActivityDAO.Create(SessionBean)>
						<cfset SessionBean.setActivityID(NewSessionID)>
						
						<!--- FUNCS --->
						<cfset Containers(EventType=qCourses.EventType,ActivityID=NewSessionID)> 
						<cfset Credit(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
						<!---<cfset Attendees(qSessions.CourseSectionID)>--->
						<cfset Agenda(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
						<cfset Applications(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
						<cfset Committee(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
						<cfset Fees(CourseSectionID=qSessions.CourseSectionID,ActivityID=NewSessionID)>
						
						<cflog type="information" text="#NewSessionID# Session Created" file="MigrateLog">
						
						<cfset SessionBean.setCreated(now())>
						<cfset Application.Com.ActivityDAO.Update(SessionBean)>
					</cfif>
				</cfloop><!--- SESSIONS --->
				
			   <!--- <cfset Application.Com.ActivityDAO.Update(ParentActivity)>--->
			  </cfif> <!--- Check Parent for ID --->
        </cfloop><!--- PARENTS --->
    </cffunction>
    
	<!--- FEES --->
	<cffunction name="Fees" access="public" output="no">
		<cfargument name="CourseSectionID" type="numeric" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
		
		<cfquery name="qFees" datasource="#OldDSN#">
			SELECT     FeeScheduleID, CourseSectionId, FeeDescription, Fee
			FROM    cm_FeeSchedule
			WHERE CourseSectionId=<cfqueryparam value="#qSessions.CourseSectionId#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfloop query="qFees">
			<cfif NOT isNumeric(qFees.Fee)>
				<cfset FeeAmount = 0>
			<cfelse>
				<cfset FeeAmount = qFees.Fee>
			</cfif>
			<cfquery name="qAddFee" datasource="#NewDSN#">
				INSERT INTO ce_Activity_FinFee (
					ActivityID,
					Name,
					DisplayName,
					StartDate,
					EndDate,
					Amount,
					CreatedBy
				) VALUES (
					<cfqueryparam value="#NewSessionID#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#qFees.FeeDescription#" cfsqltype="cf_sql_varchar" />,
					<cfqueryparam value="#qFees.FeeDescription#" cfsqltype="cf_sql_varchar" />,
					#CreateODBCDateTime(qSessions.ReleaseDate)#,
					#CreateODBCDateTime(qSessions.ReleaseDate)#,
					<cfqueryparam value="#FeeAmount#" cfsqltype="cf_sql_float" />,
					169841
				)
			</cfquery>
		</cfloop>
	</cffunction>
	
	<!--- COMMITTEE MEMBERS --->
	<cffunction name="Committee" access="public" output="no">
		<cfargument name="CourseSectionID" type="numeric" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
		
		<cfquery name="qCommittee" datasource="#OldDSN#">
			SELECT     
				EE.CourseSectionId, 
				EE.PersonID, 
				EE.EmployeeTypeID, 
				EE.EventEmployeeId, 
				ET.Code, 
				ET.Description
			FROM 
				dbo.cm_Event_employee AS EE 
			LEFT OUTER JOIN
			  dbo.cm_employeeTypeCode AS ET ON EE.EmployeeTypeID = ET.EmployeeTypeID
			WHERE EE.CourseSectionID=#Arguments.CourseSectionID#
		</cfquery>
		
		<cfloop query="qCommittee">
			<cfswitch expression="#qCommittee.EmployeeTypeID#">
				<cfcase value="1"> <!--- Coordinator --->
					<cfset nRoleID = 1>
				</cfcase>
				<cfcase value="2"> <!--- Director --->
					<cfset nRoleID = 2>
				</cfcase>
				<cfdefaultcase>
					<cfset nRoleID = 0>
				</cfdefaultcase>
			</cfswitch>
			
			
			<cfquery name="qInsertComm" datasource="#NewDSN#">
				INSERT INTO ce_Activity_Committee (
					ActivityID,
					PersonID<cfif nRoleID GT 0>,
					RoleID</cfif>
				) VALUES (
					<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#qCommittee.PersonID#" cfsqltype="cf_sql_integer" />
					<cfif nRoleID GT 0>,<cfqueryparam value="#nRoleID#" cfsqltype="cf_sql_integer" /></cfif>
				)
			</cfquery>
		</cfloop>
	</cffunction>
	
	 <!--- APPLICATION --->
	<cffunction name="Applications" access="public" output="no">
		<cfargument name="CourseSectionID" type="numeric" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
		
		<cfquery name="qApp" datasource="#OldDSN#">
			SELECT 
				TOP 1    
				ID, 
				DateReceived, 
				DateSent, 
				MemberSentTo, 
				HaveCV, 
				HaveConflict, 
				HaveObjectives, 
				HaveSupport, 
				HaveNeeds, 
				HaveBrochure, 
				DateApproved, 
				MemberApproved,  
				HaveAttendence, 
				HaveEvaluations, 
				CourseSectionId, 
				IsApproved
			FROM
				dbo.cm_EventApplication
			WHERE 
				CourseSectionID=#Arguments.CourseSectionID#
		</cfquery>
		
		<cfset ApplicationBean = CreateObject("component","#Application.Settings.Com#ActivityApplication.ActivityApplication").init()>
		<cfset ApplicationBean.setActivityID(Arguments.ActivityID)>
		
		<cfif qApp.DateReceived GT 0>
			<cfset ApplicationBean.setReceivedFlag('Y')>
		<cfelse>
			<cfset ApplicationBean.setReceivedFlag('N')>
		</cfif>
		<cfset ApplicationBean.setReceivedDate(qApp.DateReceived)>
		
		<cfif qApp.DateSent GT 0>
			<cfset ApplicationBean.setSentFlag('Y')>
		<cfelse>
			<cfset ApplicationBean.setSentFlag('N')>
		</cfif>
		<cfset ApplicationBean.setSentDate(qApp.DateSent)>
		
		<cfset ApplicationBean.setApprovedFlag(convertToYesNo(qApp.isApproved))>
		<cfif qApp.isApproved EQ -1>
			<cfset ApplicationBean.setApprovedDate(qApp.DateApproved)>
		</cfif>
		
		<cfset ApplicationBean.setNeedsFlag(convertToYesNo(qApp.HaveNeeds))>
		
		<cfif qApp.HaveNeeds EQ -1>
			<cfset ApplicationBean.setNeedsDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setObjFlag(convertToYesNo(qApp.HaveObjectives))>
		
		<cfif qApp.HaveObjectives EQ -1>
			<cfset ApplicationBean.setObjDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setSuppFlag(convertToYesNo(qApp.HaveSupport))>
		
		<cfif qApp.HaveSupport EQ -1>
			<cfset ApplicationBean.setSuppDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setAttendFlag(convertToYesNo(qApp.HaveAttendence))>
		
		<cfif qApp.HaveAttendence EQ -1>
			<cfset ApplicationBean.setAttendDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setCVFlag(convertToYesNo(qApp.HaveCV))>
		
		<cfif qApp.HaveCV EQ -1>
			<cfset ApplicationBean.setCVDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setBrochFlag(convertToYesNo(qApp.HaveBrochure))>
		
		<cfif qApp.HaveBrochure EQ -1>
			<cfset ApplicationBean.setBrochDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setMembApprFlag(convertToYesNo(qApp.MemberApproved))>
		
		<cfif qApp.MemberApproved EQ -1>
			<cfset ApplicationBean.setMembApprDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setConflictFlag(convertToYesNo(qApp.HaveConflict))>
		
		<cfif qApp.HaveConflict EQ -1>
			<cfset ApplicationBean.setConflictDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset ApplicationBean.setEvalFlag(convertToYesNo(qApp.HaveEvaluations))>
		
		<cfif qApp.HaveEvaluations EQ -1>
			<cfset ApplicationBean.setEvalDate(SessionBean.getReleaseDate())>
		</cfif>
		
		<cfset Application.Com.ActivityApplicationDAO.Create(ApplicationBean)>
	</cffunction>
	
	<cffunction name="Agenda" access="public" output="no">
		<cfargument name="CourseSectionID" type="numeric" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
		
		<!--- EVENT TIMES --->
		<cfquery name="qEventTimes" datasource="#OldDSN#">
			SELECT     EventTimeID, CourseSectionId, isNull(Date,0) As Date, isNull(StartTime,0) As StartTime, isNull(EndTime,0) As EndTime
			FROM         dbo.cm_EventTime
			WHERE CourseSectionID=#Arguments.CourseSectionID#
		</cfquery>
		
		<cfloop query="qEventTimes">
			<cfquery name="qInsertAgenda" datasource="#NewDSN#">
				INSERT INTO ce_Agenda (
					ActivityID,
					EventDate,
					StartTime,
					EndTime,
					Description,
					CreatedBy
				) VALUES (
					<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />,
					<cfqueryparam value="#qEventTimes.Date#" cfsqltype="cf_sql_date" />,
					<cfqueryparam value="#qEventTimes.StartTime#" cfsqltype="cf_sql_time" />,
					<cfqueryparam value="#qEventTimes.EndTime#" cfsqltype="cf_sql_time" />,
					<cfqueryparam value="Start/End" cfsqltype="cf_sql_varchar" />,
					169841
				)
			</cfquery>
		</cfloop>
	</cffunction>
	
	<!--- CREDIT --->
	<cffunction name="Credit" access="public" output="no">
		<cfargument name="CourseSectionID" type="numeric" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
		
		<cfquery name="qCredit" datasource="#OldDSN#">
			SELECT     CourseSectionId, CourseCreditTypeId, CreditHours
			FROM         tt_CourseSection_CreditType
			WHERE     (CourseCreditTypeId = 1) AND CourseSectionID=#Arguments.CourseSectionID#
		</cfquery>
		
		
		<cfloop query="qCredit">
			<cfset CreditBean = CreateObject("component","#Application.Settings.Com#ActivityCredit.ActivityCredit").init(ActivityID=Arguments.ActivityID)>
			<cfset CreditBean.setCreditID(1)>
			<cfset CreditBean.setAmount(qCredit.CreditHours)>
			<cfset CreditBean.setCreatedBy(169841)>
			<cfset Application.Com.ActivityCreditDAO.Create(CreditBean)>
		</cfloop>
	</cffunction>
	
	<!--- CONTAINERS FUNCTION --->
	<cffunction name="Containers" access="public" output="no">
		<cfargument name="EventType" type="string" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
		
		
		<cfquery name="qGetCatID" datasource="#NewDSN#">
			SELECT CategoryID FROM ce_Category
			WHERE Name = <cfqueryparam value="#Arguments.EventType#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfset CategoryBean = CreateObject("component","#Application.Settings.Com#ActivityCategory.ActivityCategory").init()>
		<cfset CategoryBean.setActivityID(Arguments.ActivityID)>
		<cfset CategoryBean.setCategoryID(qGetCatID.CategoryID)>
		<cfset CategoryBean.setCreatedBy(169841)>
		<cfset Application.Com.ActivityCategoryDAO.Create(CategoryBean)>
	</cffunction>
	
	<!--- ATTENDEES FUNCTION --->
    <cffunction name="Attendees" access="remote" output="yes">
		<cfargument name="Month" required="yes" type="string">
		<cfargument name="Day" required="yes" type="string">
		<cfargument name="Year" required="yes" type="string">
		
		<cfset TheMonth = Arguments.Month>
		<cfset TheDay = Arguments.Day>
		<cfset TheYear = Arguments.Year>
		<cfset LastDay = LastDayOfMonth(TheMonth,TheYear)>
		
		<cfset FullDate = TheMonth & "/" & TheDay & "/" & TheYear>
		
		<cfquery name="qGetCourses" datasource="#NewDSN#">
			SELECT ActivityID,ParentActivityID,ExternalID FROM ce_Activity
			WHERE ExternalID <> '' AND ReleaseDate BETWEEN '#FullDate# 00:00:00' AND '#FullDate# 23:59:59' AND Len(ExternalID) > 3 AND ParentActivityID IS NOT NULL
		</cfquery>
		
		<cfloop query="qGetCourses">
			
			<cfquery name="qCredit" datasource="#OldDSN#">
				SELECT     CourseSectionId, CourseCreditTypeId, CreditHours
				FROM         tt_CourseSection_CreditType
				WHERE     (CourseCreditTypeId = 1) AND CourseSectionID=#qGetCourses.ExternalID#
			</cfquery>
			
			
			<cfquery name="qAttendees" datasource="#OldDSN#">
				SELECT RegistrationID, RegistrationDate, CourseSectionId, AttendeeID AS PersonID,EmployeeID,isNull(CreditHourOverride,0) As CreditHourOverride
				FROM cm_Registration
				WHERE CourseSectionID=#qGetCourses.ExternalID#
			</cfquery>
			
			<cfloop query="qAttendees">
				<cfquery name="qCheck" datasource="#NewDSN#">
					SELECT AttendeeID FROM ce_Attendee
					WHERE PersonID=#qAttendees.PersonID# AND ActivityID=#qGetCourses.ActivityID#
				</cfquery>
				
				<cfif qCheck.RecordCount EQ 0>
					<cfset AttendeeBean = CreateObject("component","#Application.Settings.Com#Attendee.Attendee").init()>
					<cfset AttendeeBean.setActivityID(qGetCourses.ActivityID)>
					<cfset AttendeeBean.setPersonID(qAttendees.PersonID)>
					<cfset AttendeeBean.setCheckIn(qAttendees.RegistrationDate)>
					<cfset AttendeeBean.setCreatedBy(169841)>
					
					<!--- CHECK IF MD --->
					<cfif isMD(personId=qAttendees.PersonID)>
						<cfset AttendeeBean.setMDFlag("Y")>
					<cfelse>
						<cfset AttendeeBean.setMDFlag("N")>
					</cfif>
					
					<cfset NewAttendeeID = Application.Com.AttendeeDAO.Create(AttendeeBean)>
					
					 <cfif NOT isNumeric(qCredit.CreditHours)>
						<cfset TheCreditHours = 0>
					<cfelse>
						<cfset TheCreditHours = qCredit.CreditHours>
					</cfif>
					
					<cfif NOT isNumeric(qAttendees.CreditHourOverride)>
						<cfset TheCreditOverride = 0>
					<cfelse>
						<cfset TheCreditOverride = qAttendees.CreditHourOverride>
					</cfif>
					
					<cfquery name="qInsertAttendeeCredit" datasource="#NewDSN#">
						INSERT INTO ce_AttendeeCredit (
							AttendeeID,
							CreditID,
							Amount,
							CreatedBy
						) VALUES (
							<cfqueryparam value="#NewAttendeeID#" cfsqltype="cf_sql_integer" />,
							1,
							<cfif TheCreditOverride EQ 0>
								#TheCreditHours#,
							<cfelse>
								#TheCreditOverride#,
							</cfif>
							169841
						)
					</cfquery>
					
					<cflog type="information" file="MigrationLog" text="Added Attendee #NewAttendeeID#" />
				</cfif>
			</cfloop>
		</cfloop> <!--- COURSES --->
		<cfif TheDay LT Day(LastDay)>
			<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Attendees&Month=#TheMonth#&Day=#TheDay+1#&Year=#TheYear#';</script></cfoutput>
		<cfelse>
			<cfif TheMonth LT 12>
				<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Attendees&Month=#TheMonth+1#&Day=1&Year=#TheYear#';</script></cfoutput>
			<cfelse>
				<cfif TheYear LTE 2009>
					<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/Migrate.cfc?method=Attendees&Month=1&Day=1&Year=#TheYear+1#';</script></cfoutput>
				<cfelse>
					Complete!
				</cfif>
			</cfif>
		</cfif>
	</cffunction>
    
    <cfscript>
	/* LAST DAY OF MONTH */
	function LastDayOfMonth(strMonth) {
	  var strYear=Year(Now());
	  if (ArrayLen(Arguments) gt 1)
		strYear=Arguments[2];
	  return DateAdd("d", -1, DateAdd("m", 1, CreateDate(strYear, strMonth, 1)));
	}
	
	/* CONVERTS -1 to YES and 0 to NO */
	function convertToYesNo(strVar) {
		var sReturn = "N";
		
		if (strVar EQ -1) {
			sReturn = "Y";
		}
		
		return sReturn;
	}
	
	/* FIXES CSV ISSUES */
	function listFix(list) {
	var delim = ",";
	  var null = "NULL";
	  var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
	  var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";
	  var i = "";
		   
	  if(arrayLen(arguments) gt 1) delim = arguments[2];
	  if(arrayLen(arguments) gt 2) null = arguments[3];
	
	  if(findnocase(left(list, 1),delim)) list = null & list;
	  if(findnocase(right(list,1),delim)) list = list & null;
	
	  i = len(delim) - 1;
	  while(i GTE 1){
		delim = mid(delim,1,i) & "_Separator_" & mid(delim,i+1,len(delim) - (i));
		i = i - 1;
	  }
	
	  delim = ReplaceList(delim, special_char_list, esc_special_char_list);
	  delim = Replace(delim, "_Separator_", "|", "ALL");
	
	  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
	  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
		  
	  return list;
	}
	</cfscript>
	
</cfcomponent>