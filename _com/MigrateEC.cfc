<cfcomponent displayname="Migrate from EC pedal" output="yes">
	<cfset OldDSN = "AITL-SQL1C">
	<cfset NewDSN = "AITL-SQL1C">
	
	<cffunction name="Run" access="remote" output="yes">
		<cfargument name="SearchText" type="string" required="no" default="" />
		<cfargument name="CourseID" type="string" required="no" default="0" />
		<cfargument name="Current" type="string" required="no" default="1" />
		<cfargument name="Max" type="string" required="no" default="1" />
		<cfargument name="Amount" type="string" required="no" default="1" />
		
		<cfquery name="qCourses" datasource="#OldDSN#">
			SELECT     
				C.CourseID, 
				C.Title, 
				C.Description, 
				C.keywords, 
				CT.Description AS Type, 
				S.Description AS Status, 
				isNull(C.StartDate,'1/1/1900') As StartDate, 
				isNull(C.EndDate,'1/1/1900') As EndDate, 
				C.MonthsValid, 
				C.ExpirationMonths, 
				C.MaxAttempts, 
				C.FeeRequiredFlag, 
				C.Fee, 
				C.CreationDate, 
				C.LastUpdate, 
				CTyp.Description AS CreditType, 
				CCat.Description AS CreditCategory, 
				CPtTyp.Description AS CreditPointType, 
				isNull(CCT.CreditHours,0) As CreditHours,
				C.AdministratorId
			FROM         
				dbo.ec_CreditPointType AS CPtTyp 
			RIGHT OUTER JOIN
				dbo.ec_Course_CreditType AS CCT ON CPtTyp.CreditPointTypeId = CCT.CreditPointTypeId 
			LEFT OUTER JOIN
				dbo.ec_CreditType AS CTyp ON CCT.CreditTypeId = CTyp.CreditTypeId 
			LEFT OUTER JOIN
				dbo.ec_CreditCategory AS CCat ON CCT.CreditCategoryId = CCat.CreditCategoryId 
			RIGHT OUTER JOIN
				dbo.ec_Course AS C 
			INNER JOIN
				dbo.ec_CourseType AS CT ON C.CourseTypeID = CT.CourseTypeID 
			LEFT OUTER JOIN
				dbo.ec_CourseStatusCode AS S ON C.CourseStatusID = S.CourseStatusID ON CCT.CourseId = C.CourseID
			WHERE     0=0 <cfif Arguments.SearchText NEQ ""> AND (CTyp.Description LIKE '%#Arguments.SearchText#%')</cfif>
			<cfif Arguments.CourseID GT 0> AND C.CourseID = #Arguments.CourseID#<cfelse> AND C.CourseID BETWEEN #Arguments.Current# AND #Arguments.Current+Arguments.Amount#</cfif>
		</cfquery>
		
		<cfoutput>
		<cfset ProgressPerc = Round((Arguments.Current / Arguments.Max) * 100)>
		<h3>Progress</h3>
		<div style="background-color:##CCCCCC; margin:5px;">
			<div style="padding:15px;width:#ProgressPerc#%;background-color:##009900;color:##FFF;text-align:center;">#ProgressPerc#%</div>
		</div>
		<cfflush>
		<h3>Courses Loaded</h3>
		<cfloop query="qCourses">
			<div style="padding:4px; background-color:##EEE; border:1px solid ##CCC; margin:1px;">#qCourses.Title#</div>
			<cfflush>
			<!--- DETERMINE STATUS --->
			<cfswitch expression="#qCourses.Status#">
				<cfcase value="Active">
					<cfset NewStatusID = 1>
				</cfcase>
				<cfcase value="Pending">
					<cfset NewStatusID = 2>
				</cfcase>
				<cfcase value="Ended">
					<cfset NewStatusID = 3>
				</cfcase>
				<cfcase value="Withdrawn">
					<cfset NewStatusID = 4>
				</cfcase>
				<cfcase value="Deleted">
					<cfset NewStatusID = 4>
				</cfcase>
				<cfdefaultcase>
					<cfset NewStatusID = 4>
				</cfdefaultcase>
			</cfswitch>
			
			<!--- LOOKUP CATEGORY --->
			<cfquery name="qCategory" datasource="#NewDSN#">
				SELECT CategoryID,Name
				FROM ce_Sys_CategoryLMS
				WHERE Name=<cfqueryparam value="#qCourses.CreditCategory#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			
			<cfset Activity = CreateObject("component","_com.Activity.Activity").init()>
			<cfset Activity.setActivityID(0)>
			<cfset Activity.setExternalID("EC" & qCourses.CourseID)>
			<cfset Activity.setActivityTypeID(2)>
			<cfset Activity.setGroupingID(6)>
			<cfset Activity.setTitle(qCourses.Title)>
			<cfset Activity.setDescription(qCourses.Description)>
			<cfset Activity.setReleaseDate(qCourses.StartDate)>
			<cfset Activity.setStartDate(qCourses.StartDate)>
			<cfset Activity.setEndDate(qCourses.EndDate)>
			<cfset Activity.setSessionType("S")>
			<cfset Activity.setStatAttendees(0)>
			<cfset Activity.setStatMaxRegistrants(0)>
			<cfset Activity.setStatAddlAttendees(0)>
			<cfset Activity.setStatMD(0)>
			<cfset Activity.setStatNonMD(0)>
			<cfset Activity.setStatSupporters(0)>
			<cfset Activity.setStatSuppAmount(0)>
			<cfset Activity.setStatusID(NewStatusID)>		
			<cfset Activity.setCreatedBy(qCourses.AdministratorId)>
			<cfset Activity.setDeletedFlag("N")>
			<cfset Activity.setSponsor("Unknown")>
			<cfset Activity.setSponsorship("J")>
			
			<cfset Activity.setActivityID(Application.Com.ActivityDAO.Create(Activity))>
			
			<cfif qCategory.CategoryID GT 0>
				<cfquery name="qSetCategory" datasource="#NewDSN#">
					INSERT INTO ce_Activity_CategoryLMS (
						ActivityID,
						CategoryID,
						CreatedBy
					) VALUES (
						<cfqueryparam value="#Activity.getActivityID()#" cfsqltype="cf_sql_integer" />,
						<cfqueryparam value="#qCategory.CategoryID#" cfsqltype="cf_sql_integer" />,
						169841
					)
				</cfquery>
			</cfif>
			
			<cfset Credit(Activity.getActivityID(),qCourses.CreditHours)>
			
			<cfset PublishGeneral(Activity.getActivityID(),qCourses.CourseID)>
			
			<cfset PublishComponents(Activity.getActivityID(),qCourses.CourseID)>
		</cfloop>
		</cfoutput>
		
		<cfif Arguments.Max GT 1 AND Arguments.Current LTE Arguments.Max>
			<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/MigrateEC.cfc?method=Run&CourseID=#Arguments.CourseID#Amount=#Arguments.Amount#&SearchText=#Arguments.SearchText#&Current=#Arguments.Current+Arguments.Amount#&Max=#Arguments.Max#';</script></cfoutput><cfflush>
		<cfelse>
			Done.
		</cfif>
	</cffunction>
	
	<cffunction name="LoadAttendees" access="private" output="yes">
		<cfset var qQuery = QueryNew("CourseID,PersonID,EffectiveDate,ExpirationDate,TrainingStatusID,TestScore,CreditHours")>
		<cfset var qTraining = "">
		Building Query...<cfflush>
		<cfquery name="qTraining" datasource="#OldDSN#">
			SELECT 
				PT1.CourseId,PT1.PersonId, isNull(PT1.EffectiveDate,'1/1/1900') As EffectiveDate, isNull(PT1.ExpirationDate,'1/1/1900') As ExpirationDate, PT1.TrainingStatusID, isNull(PT1.TestScore,0) As TestScore,isNull(PT1.CreditHours,0) As CreditHours
			FROM         dbo.ec_Person_Training AS PT1
			WHERE (PT1.EffectiveDate IN
				  (SELECT     MAX(EffectiveDate) AS Expr1
					FROM          dbo.ec_Person_Training AS PT2
					WHERE      (PT1.CourseID = PT2.CourseID) AND (PT1.PersonId = PT2.PersonId) AND PT2.TrainingStatusID=1)) AND PT1.CourseID=1165
			ORDER BY CourseID,PersonID
		</cfquery>
		
		<cfloop query="qTraining">
			in<cfflush>
			<cfset QueryAddRow(qQuery)>
			<cfset QuerySetCell(qQuery,"CourseID",qTraining.CourseID)>
			<cfset QuerySetCell(qQuery,"PersonID",qTraining.PersonID)>
			<cfset QuerySetCell(qQuery,"EffectiveDate",qTraining.EffectiveDate)>
			<cfset QuerySetCell(qQuery,"ExpirationDate",qTraining.ExpirationDate)>
			<cfset QuerySetCell(qQuery,"TrainingStatusID",qTraining.TrainingStatusID)>
			<cfset QuerySetCell(qQuery,"TestScore",qTraining.TestScore)>
			<cfset QuerySetCell(qQuery,"CreditHours",qTraining.CreditHours)>
		</cfloop>
		
		<cfreturn qQuery>
	</cffunction>
	
	<cffunction name="Attendees" access="remote" output="yes">
		<cfargument name="Current" type="string" required="no" default="1" />
		<cfargument name="Amount" type="string" required="no" default="100" />
		<cfargument name="CurrActivityID" type="string" required="no" />
		<cfargument name="CurrCourseID" type="string" required="no" />
		<cfargument name="DeleteSession" type="string" required="no" default="N" />
		
		<cfset var CourseID = 0>
		<cfset var TotalAttendeeCount = 0>
		<cfset var AttendeeCount = 0>
		<cfset var TotalNewAttendeeCount = 0>
		<cfset var NewAttendeeCount = 0>
		<cfset var TheCurrentCourse = 0>
		<cfset var TheCurrentActivity = 0>
		
		<cfdump var="#TheCurrentCourse#">
		<cfif Arguments.DeleteSession EQ "Y">
			<cfset StructDelete(session,"qTraining")>
		</cfif>
		
		<cfif NOT isDefined("Session.qTraining")>
		<cfquery name="Session.qTraining" datasource="#OldDSN#">
			SELECT 
				PT1.CourseId,PT1.PersonId, isNull(PT1.EffectiveDate,'1/1/1900') As EffectiveDate, isNull(PT1.ExpirationDate,'1/1/1900') As ExpirationDate, PT1.TrainingStatusID, isNull(PT1.TestScore,0) As TestScore,isNull(PT1.CreditHours,0) As CreditHours
			FROM         dbo.ec_Person_Training AS PT1
			WHERE (PT1.EffectiveDate IN
				  (SELECT     MAX(EffectiveDate) AS Expr1
					FROM          dbo.ec_Person_Training AS PT2
					WHERE      (PT1.CourseID = PT2.CourseID) AND (PT1.PersonId = PT2.PersonId) AND PT2.TrainingStatusID=1))
			ORDER BY CourseID,PersonID
		</cfquery>
		</cfif>
		
		<cfif Session.qTraining.RecordCount GT 0>
			#Arguments.Current# // #Arguments.Current+Arguments.Amount#<br>
			SELECT TOP 1 ActivityID FROM ce_Activity
						WHERE ExternalID = 'EC#TheCurrentCourse#' AND DeletedFlag='N'
						ORDER BY Title<cfflush>
			<cfoutput startrow="#Arguments.Current#" maxrows="#Arguments.Amount#" query="Session.qTraining">				
					<cfif Session.qTraining.CourseID NEQ TheCurrentCourse>
						<cfset TheCurrentCourse = Session.qTraining.CourseID>
					</cfif>
					<cfquery name="qActivity" datasource="#NewDSN#">
						SELECT TOP 1 ActivityID FROM ce_Activity
						WHERE ExternalID = 'EC#TheCurrentCourse#' AND DeletedFlag='N'
						ORDER BY Title
					</cfquery>
					
					<cfif qActivity.RecordCount GT 0>
						<cfset TheCurrentCourse = TheCurrentCourse>
						<cfset TheCurrentActivity = qActivity.ActivityID>
						<hr>
						<strong>#TheCurrentActivity# // EC#TheCurrentCourse#</strong><br>
					</cfif>
				
				<cfif qActivity.ActivityID GT 0>
					<!---<cfquery name="qCheck" datasource="#NewDSN#">
						SELECT AttendeeID FROM ce_Attendee
						WHERE PersonID=#Session.qTraining.PersonID# AND ActivityID=#Session.qActivity.ActivityID#
					</cfquery>--->
					#CurrentRow# - [#Session.qTraining.PersonID#]...<cfflush>
					
					<cfset AttendeeBean = CreateObject("component","_com.Attendee.Attendee").init(AttendeeID=0)>
					<cfset AttendeeBean.setActivityID(qActivity.ActivityID)>
					<cfset AttendeeBean.setPersonID(Session.qTraining.PersonID)>
					
					<cfif Application.Com.AttendeeDAO.Exists(AttendeeBean)>
						<cfset AttendeeBean = Application.Com.AttendeeDAO.Read(AttendeeBean)>
					<cfelse>
						<cfset AttendeeBean.setCreatedBy(169841)>
					</cfif>
					<cfset AttendeeBean.setCheckIn(Session.qTraining.EffectiveDate)>
					<cfset AttendeeBean.setStatusID(1)>
					
					<!--- CHECK IF MD --->
					<cfif isMD(personId=Session.qTraining.PersonID)>
						<cfset AttendeeBean.setMDFlag("Y")>
					<cfelse>
						<cfset AttendeeBean.setMDFlag("N")>
					</cfif>
					
					<cfif AttendeeBean.getAttendeeID() GT 0>
						updated...<br><cfflush>
						<cfset Application.Com.AttendeeDAO.Update(AttendeeBean)>
					<cfelse>
						created...<br><cfflush>
						<cfset AttendeeBean.setAttendeeID(Application.Com.AttendeeDAO.Create(AttendeeBean))>
					</cfif>
					
					 <cfif NOT isNumeric(Session.qTraining.CreditHours)>
						<cfset TheCreditHours = 0>
					<cfelse>
						<cfset TheCreditHours = Session.qTraining.CreditHours>
					</cfif>
					
					<cfquery name="qInsertAttendeeCredit" datasource="#NewDSN#">
						INSERT INTO ce_AttendeeCredit (
							AttendeeID,
							CreditID,
							Amount,
							ExpirationDate,
							CreatedBy
						) VALUES (
							<cfqueryparam value="#AttendeeBean.getAttendeeID()#" cfsqltype="cf_sql_integer" />,
							1,
							#TheCreditHours#,
							#CreateODBCDateTime(Session.qTraining.ExpirationDate)#,
							169841
						)
					</cfquery>
				</cfif>
				<cfif Session.qTraining.CurrentRow EQ (Arguments.Current+Arguments.Amount)-1 AND Session.qTraining.RecordCount NEQ Session.qTraining.CurrentRow>
					<script>window.location='#Application.Settings.RootPath#/_com/MigrateEC.cfc?method=Attendees&CurrCourseID=#TheCurrentCourse#&CurrActivityID=#TheCurrentActivity#&Amount=#Arguments.Amount#&Current=#Arguments.Current+Arguments.Amount#';</script>
				</cfif>
			</cfoutput>
			
		</cfif>
		
		
	</cffunction>
	
	<!--- PUBLISH: GENERAL --->
	<cffunction name="PublishGeneral" access="public" output="no">
		<cfargument name="ActivityID" required="yes" type="numeric" />
		<cfargument name="CourseID" required="yes" type="numeric" />
		
		<cfset PubGeneral = CreateObject("component","_com.ActivityPubGeneral.ActivityPubGeneral").init(ActivityID=Arguments.ActivityID)>
		<cfif Application.Com.ActivityPubGeneralDAO.Exists(PubGeneral)>
			<cfset PubGeneral = Application.Com.ActivityPubGeneralDAO.Read(PubGeneral)>
		</cfif>
		
		<!--- OVERVIEW --->
		<cfset PubGeneral.setOverview(qCourses.Description)>

		<!--- OBJECTIVES --->
		<cfquery name="qItems" datasource="#OldDSN#">
			SELECT     I.VC1 AS Objective, ISNULL(I.SequenceNumber, 1) AS Sort, I.I1
			FROM         dbo.ec_CourseItem AS I INNER JOIN
								  dbo.ec_CourseItemType AS IT ON I.CourseItemTypeId = IT.CourseItemTypeID INNER JOIN
								  dbo.ec_Course AS C ON I.I1 = C.CourseID
			WHERE     (IT.Code IN ('EMTObj', 'EMVObj')) AND I.I1 = <cfqueryparam value="#qCourses.CourseID#" cfsqltype="cf_sql_integer" />
			ORDER BY I.SequenceNumber
		</cfquery>
		
		<cfsavecontent variable="TheObjectives">
			<ul>
		<cfloop query="qItems">
			<cfoutput>
				<li>#qItems.Objective#</li>
			</cfoutput>
		</cfloop>
			</ul>
		</cfsavecontent>
		
		<cfset PubGeneral.setObjectives(TheObjectives)>
		
		<!--- KEYWORDS --->
		<cfset PubGeneral.setKeywords(qCourses.keywords)>
		
		
		<cfset PubGeneral.setPublishDate(qCourses.StartDate)>
		<cfset PubGeneral.setRemoveDate(qCourses.EndDate)>
		<cfset PubGeneral.setPaymentFlag("N")>
		
		<cfset PubGeneral.setTermsFlag("N")>
		<cfset PubGeneral.setTermsText("")>
		<cfset PubGeneral.setUpdated(now())>
		<cfset PubGeneral.setStatViews(0)>
		<cfset PubGeneral.setStatVoteCount(0)>
		<cfset PubGeneral.setStatVoteValue(0)>
		
		<cfset Application.Com.ActivityPubGeneralDAO.Save(PubGeneral)>
	</cffunction>
	
	<!--- Files --->
	<cffunction name="Files" access="public" output="no">
		<cfquery name="qItems" datasource="#OldDSN#">
			SELECT     
				I.VC1 AS ComponentDetail, 
				I.VC2 AS ComponentTitle, 
				I.VC3, 
				I.VC4 AS FileOrURL, 
				IT.Code, 
				I.I1 As CourseID, 
				ISNULL(I.SequenceNumber, 1) AS Sort
			FROM
				dbo.ec_CourseItem AS I 
			INNER JOIN
				dbo.ec_CourseItemType AS IT ON I.CourseItemTypeId = IT.CourseItemTypeID 
			INNER JOIN
				dbo.ec_Course AS C ON I.I1 = C.CourseID
			WHERE     
				(IT.Code IN ('EMTArticle', 'EMVVideo'))
		</cfquery>
		
		
	</cffunction>
	
	<!--- PUBLISH: COMPONENTS  --->
	<cffunction name="PublishComponents" access="public" output="no">
		<cfargument name="ActivityID" required="yes" type="numeric" />
		<cfargument name="CourseID" required="yes" type="numeric" />
		
		<cfset var isURL = false>
		
		<cfquery name="qItems" datasource="#OldDSN#">
			SELECT     
				I.VC1 AS ComponentDetail, 
				I.VC2 AS ComponentTitle, 
				I.VC3, 
				I.VC4 AS FileOrURL, 
				IT.Code, 
				I.I1 As CourseID, 
				ISNULL(I.SequenceNumber, 1) AS Sort
			FROM
				dbo.ec_CourseItem AS I 
			INNER JOIN
				dbo.ec_CourseItemType AS IT ON I.CourseItemTypeId = IT.CourseItemTypeID 
			INNER JOIN
				dbo.ec_Course AS C ON I.I1 = C.CourseID
			WHERE     
				(IT.Code IN ('EMTArticle', 'EMVVideo')) AND I.I1=#Arguments.CourseID#
		</cfquery>
		
		<cfloop query="qItems">
			<!--- DELETE RECORDS FOR THIS ACTIVITY --->
			<cfquery name="qGetFile" datasource="#NewDSN#">
				SELECT FileID FROM ce_File
				WHERE ActivityID=#Arguments.ActivityID# AND FileName='#qItems.FileOrURL#'
			</cfquery>
			
			<cfloop query="qGetFile">
				<cfif qGetFile.FileID GT 0>
				<cfquery name="qDelete" datasource="#NewDSN#">
					DELETE ce_File
					WHERE FileID=#qGetFile.FileID#
				</cfquery>
				<cfquery name="qDelete" datasource="#NewDSN#">
					DELETE ce_Activity_PubComponent
					WHERE FileID=#qGetFile.FileID#
				</cfquery>
				</cfif>
			</cfloop>
			
			<cfif qItems.FileOrURL CONTAINS "http://">
				<cfset isURL = true>
			</cfif>
			
			<cfif NOT isURL>
				<!--- MOVE FILE INTO PLACE --->
				<cfset SourceDir = ExpandPath('/admin/_uploads/_migrate/')>
				<cfset DestinationDir = ExpandPath('/admin/_uploads/ActivityFiles/#Arguments.ActivityID#/')>
				<cfif NOT DirectoryExists(DestinationDir)>
					<cfdirectory action="create" directory="#DestinationDir#" />
				</cfif>
				
				<cfif FileExists("#SourceDir##qItems.FileOrURL#") AND NOT FileExists("#DestinationDir##qItems.FileOrURL#")>
					<cffile action="move" source="#SourceDir##qItems.FileOrURL#" destination="#DestinationDir##qItems.FileOrURL#" />
				</cfif>
				
				<!--- FILE DETAILS --->
				<cfset FileBean = CreateObject("component","_com.File.File").init()>
				<cfset FileBean.setFileName(qItems.FileOrURL)>
				<cfset FileBean.setFileCaption(qItems.ComponentTitle)>
				<cfset FileBean.setFileSize(0)>
				<cfset FileBean.setFileTypeID(3)>
				<cfset FileBean.setActivityID(Arguments.ActivityID)>
				<cfset FileBean.setCreatedBy(169841)>
				<cfset FileBean.setFileID(Application.Com.FileDAO.Create(FileBean))>
			</cfif>
			
			<cfset PubComponent = CreateObject("component","_com.ActivityPubComponent.ActivityPubComponent").init()>
			<cfif isURL>
				<cfset PubComponent.setComponentID(10)>
			<cfelse>
				<cfset PubComponent.setComponentID(3)>
			</cfif>
			<cfset PubComponent.setActivityID(Arguments.ActivityID)>
			<cfset PubComponent.setDisplayName(qItems.ComponentTitle)>
			<cfset PubComponent.setDescription(qItems.ComponentDetail)>
			<cfif isURL>
				<cfset PubComponent.setExternalURL(qItems.FileOrURL)>
			<cfelse>
				<cfset PubComponent.setFileID(FileBean.getFileID())>
			</cfif>
			
			<cfif PubComponent.getCreatedBy() EQ "">
				<cfset PubComponent.setCreatedBy(Session.Person.getPersonID())>
			<cfelse>
				<cfset PubComponent.setUpdatedBy(Session.Person.getPersonID())>
				<cfset PubComponent.setUpdated(now())>
			</cfif>
			
			<cfset Application.Com.ActivityPubComponentDAO.Create(PubComponent)>
		</cfloop>
	</cffunction>
	
	<cffunction name="TestResults" access="remote" output="yes">
		<cfargument name="Mode" type="string" required="no" default="ALL">
		<cfargument name="TestNumber" type="string" required="no" default="1">
		<cfargument name="StopPoint" type="string" required="no" default="500">
		<cfargument name="StatusID" type="string" required="no" default="1">
		
		<cfset var TestType = 0>
		<cfset var ResultStatusID = 1>
		
		<cfswitch expression="#Arguments.Mode#">
			<cfcase value="ALL">
				<cfset TestType = 0>
			</cfcase>
			<cfcase value="PRE">
				<cfset TestType = 3>
			</cfcase>
			<cfcase value="POST">
				<cfset TestType = 2>
			</cfcase>
			<cfcase value="EVAL">
				<cfset TestType = 1>
			</cfcase>
		</cfswitch>
		
		<cfquery name="qTests" datasource="#NewDSN#">
			SELECT     A.AssessmentID, A.ActivityID, A.Name, A.ExternalID,
					  (SELECT     COUNT(QuestionID) AS Expr1
						FROM          ce_AssessQuestion AS Q
						WHERE      (AssessmentID = A.AssessmentID) AND (DeletedFlag = 'N')) AS QuestionCount, A.DeletedFlag
			FROM         ce_Assessment AS A INNER JOIN
				  ce_Activity AS Act ON A.ActivityID = Act.ActivityID
			WHERE     (A.ExternalID LIKE 'EC-%-#Arguments.TestNumber#')<cfif TestType GT 0> AND (A.AssessTypeID = #TestType#)</cfif> AND (A.DeletedFlag = 'N') AND (Act.DeletedFlag = 'N')
		</cfquery>

		<cfif qTests.RecordCount GT 0>
			<cfset TestID = ListGetAt(qTests.ExternalID,3,'-')>
			<cfset CourseID = ListGetAt(qTests.ExternalID,2,'-')>
			<cfquery name="qResults" datasource="#OldDSN#">
				SELECT PersonTestResultID,PersonID,TestID,TestDate,TestStatusID
				FROM ec_Person_TestResult
				WHERE TestID=#TestID# AND TestStatusID=#Arguments.StatusID#
			</cfquery>
			<strong>#qTests.Name#</strong>[#qTests.ExternalID#] (Results: #qResults.RecordCount#) (Questions: #qTests.QuestionCount#)<br>
			<cfflush>
			
			<cfloop query="qResults">
				<cfswitch expression="#qResults.TestStatusID#">
					<cfcase value="1"> <!--- Pass --->
						<cfset ResultStatusID = 5>
					</cfcase>
					<cfcase value="2"> <!--- Fail --->
						<cfset ResultStatusID = 3>
					</cfcase>
					<cfcase value="3"> <!--- Retake --->
						<cfset ResultStatusID = 1>
					</cfcase>
					<cfcase value="4"> <!--- In Progress --->
						<cfset ResultStatusID = 2>
					</cfcase>
					<cfcase value="5"> <!--- Complete --->
						<cfset ResultStatusID = 5>
					</cfcase>
				</cfswitch>
				
				<cfquery name="qCheckResult" datasource="#NewDSN#">
					SELECT TOP (1) ResultID FROM ce_AssessResult
					WHERE PersonID=#qResults.PersonID# AND AssessmentID=#qTests.AssessmentID# AND ResultStatusID=#ResultStatusID#
				</cfquery>
				
				<cfset ResultBean = CreateObject("component","_com.AssessResult.AssessResult").init()>
				<cfset ResultBean.setPersonID(qResults.PersonID)>
				<cfset ResultBean.setAssessmentID(qTests.AssessmentID)>
				<cfset ResultBean.setResultStatusID(ResultStatusID)>
				
				<cfif Application.Com.AssessResultDAO.Exists(ResultBean)>
					<cfset ResultBean = Application.Com.AssessResultDAO.Read(ResultBean)>
				</cfif>
				
				<cfset ResultBean.setScore(0)>
				<cfif ResultBean.getResultID() GT 0>
					<cfset ResultID = Application.Com.AssessResultDAO.Update(ResultBean)>
				<cfelse>
					<cfset ResultID = Application.Com.AssessResultDAO.Create(ResultBean)>
					<cfset ResultBean.setResultID(ResultID)>
				</cfif>
				<cfflush>
				
				
				<!--- MOVE ANSWERS / GRADE --->
				<cfquery name="qAnswers" datasource="#OldDSN#">
					SELECT     
						PersonTestAnswerId, 
						PersonTestResultId, 
						TestQuestionId, 
						MCAnswer,
						(SELECT     
							MCCorrectAnswer
						FROM  ec_TestQuestion AS Q
						WHERE (TestQuestionId = A.TestQuestionId)) AS CorrectAnswer, I1, D1, VC1, IsCorrectFlag, CreationDate, LastUpdate
					FROM         dbo.ec_Person_TestAnswer AS A
					WHERE PersonTestResultID=#qResults.PersonTestResultID#
				</cfquery>
				
				<cfset CorrectCount = 0>
				<cfloop query="qAnswers">
					<cfquery name="qLookup" datasource="#NewDSN#">
						SELECT QuestionID
						FROM ce_AssessQuestion
						WHERE ExternalID='EC-#qAnswers.TestQuestionID#'
					</cfquery>
					
					<cfquery name="qCheckResult" datasource="#NewDSN#">
						SELECT TOP (1) AnswerID FROM ce_AssessAnswer
						WHERE AssessmentID=#ResultBean.getAssessmentID()# AND QuestionID=#qLookup.QuestionID#
					</cfquery>
					
					<cfif qCheckResult.RecordCount LTE 0>
						<cfif qAnswers.MCAnswer NEQ qAnswers.CorrectAnswer>
							<cfset IsCorrect = false>
						<cfelse>
							<cfset IsCorrect = true>
							<cfset CorrectCount++>
						</cfif>
						
						<cfset AnswerBean = CreateObject("component","_com.AssessAnswer.AssessAnswer").Init()>
						<cfset AnswerBean.setQuestionID(qLookup.QuestionID)>
						<cfset AnswerBean.setAssessmentID(ResultBean.getAssessmentID())>
						<cfset AnswerBean.setResultID(ResultBean.getResultID())>
						<cfset AnswerBean.setVC1(qAnswers.MCAnswer)>
						<cfif IsCorrect>
							<cfset AnswerBean.setCorrectFlag("Y")>
						<cfelse>
							<cfset AnswerBean.setCorrectFlag("N")>
						</cfif>
					
						<cfset Status = Application.Com.AssessAnswerDAO.Create(AnswerBean)>
					</cfif>
				</cfloop>
				
				<cfset TestScore = NumberFormat((CorrectCount / qTests.QuestionCount)*100,'00.0')>
				#qResults.PersonID# - #qResults.TestID# - #TestScore#<br>
				<cfset ResultBean.setScore(TestScore)>
				<cfset Application.Com.AssessResultDAO.Update(ResultBean)>
				<cfflush>
				<!--- FINISH RESULT BEAN --->
			</cfloop>
		</cfif>
		<cfif Arguments.TestNumber LTE Arguments.StopPoint>
			<cfif Arguments.StatusID LT 5>
				<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/MigrateEC.cfc?method=TestResults&Mode=#Arguments.Mode#&TestNumber=#Arguments.TestNumber#&StopPoint=#Arguments.StopPoint#&StatusID=#Arguments.StatusID+1#';</script></cfoutput><cfflush>
			<cfelse>
				<cfoutput><script>window.location='#Application.Settings.RootPath#/_com/MigrateEC.cfc?method=TestResults&Mode=#Arguments.Mode#&TestNumber=#Arguments.TestNumber+1#&StopPoint=#Arguments.StopPoint#&StatusID=1';</script></cfoutput><cfflush>
			</cfif>
		<cfelse>
			Done.
		</cfif>
	</cffunction>
	
	<cffunction name="OldSurveyFix" access="remote" output="yes">
		<cfquery name="qActivities" datasource="#NewDSN#">
			SELECT *
			FROM ce_Activity_PubGeneral
			WHERE Overview LIKE '%course_send.cfm%'
		</cfquery>
		
		<cfloop query="qActivities">
			<cfset TheOverview = qActivities.Overview>
			<cfset TheOverview = Application.UDF.stripHTML(qActivities.Overview)>
			<cfset TheOverview = Replace(TheOverview,'located here:&nbsp; http://webcentral.uc.edu/cpd_online2/survey/course_send.cfm?form=','reader survey on the right entitled ','ALL')>
			<cfset TheOverview = Replace(TheOverview,'located here:','on the right entitled ','ALL')>
			<cfset TheOverview = Replace(TheOverview,'http://webcentral.uc.edu/cpd_online2/survey/course_send.cfm?form=','','ALL')>
			#TheOverview#
			<hr>
			<cfquery name="qUpdate" datasource="#NewDSN#">
				UPDATE ce_Activity_PubGeneral
				SET Overview=<cfqueryparam value="#TheOverview#" cfsqltype="cf_sql_varchar" />
				WHERE ActivityID=#qActivities.ActivityID#
			</cfquery>
		</cfloop>
	</cffunction>
	
	<cffunction name="TestMover" access="remote" output="yes">
		<cfargument name="Mode" required="no" default="Import" />
		
		<cfset Alphabet = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z">
		
		<cfquery name="qTests" datasource="#OldDSN#">
			SELECT     
				I.I1 AS CourseID, 
				T.TestId AS TestID, 
				T.Name AS TestName, 
				TT.Code AS TestTypeCode, 
				TT.Description AS TestTypeDesc, 
				T.PassingScore AS TestPassingScore, 
				T.NumberQuestions AS TestNoQuestions, 
				CIT.Title AS ItemType, 
				CIT.Code AS ItemTypeCode, 
				CIT.Description AS ItemTypeDesc, 
				T.CreationDate AS TestCreated, 
				T.LastUpdate AS TestUpdated
			FROM         
				dbo.ec_CourseItemType AS CIT 
			INNER JOIN
				dbo.ec_CourseItem AS I ON CIT.CourseItemTypeID = I.CourseItemTypeId 
			INNER JOIN
				dbo.ec_Test AS T ON I.I2 = T.TestId 
			INNER JOIN
				dbo.ec_TestType AS TT ON T.TestTypeId = TT.TestTypeId
			WHERE CIT.Code LIKE '%Test%' AND I.I1 IN (900,1138) OR CIT.Code LIKE '%Eval%' AND I.I1 IN (900,1138)
		</cfquery>
		
		<cfswitch expression="#Arguments.Mode#">
			<cfcase value="Clear">
				<!--- CLEAR FIRST --->
				<cfloop query="qTests">
					<cfquery name="qGetActivityID" datasource="#NewDSN#">
						SELECT ActivityID FROM ce_Activity
						WHERE ExternalID='EC#qTests.CourseID#' AND DeletedFlag='N'
					</cfquery>
					
					<cfif qGetActivityID.ActivityID GT 0>
						<cfquery name="qClear" datasource="#NewDSN#">
							UPDATE ce_Assessment
							SET DeletedFlag='Y'
							WHERE ActivityID = #qGetActivityID.ActivityID#
						</cfquery>
						
						<cfquery name="qClearComp" datasource="#NewDSN#">
							UPDATE ce_Activity_PubComponent
							SET DeletedFlag='Y'
							WHERE ActivityID = #qGetActivityID.ActivityID# AND ComponentID IN (5,11,12)
						</cfquery>
					</cfif>			
				</cfloop>
				
				
				<strong>MARKED EXISTING AS DELETED<hr></strong><cfflush>
			</cfcase>
			
			<!--- IMPORT RECORDS --->
			<cfcase value="Import">
				<cfloop query="qTests">
					<cfquery name="qGetActivityID" datasource="#NewDSN#">
						SELECT ActivityID FROM ce_Activity
						WHERE ExternalID='EC#qTests.CourseID#' AND DeletedFlag='N'
					</cfquery>
					
					<cfif qGetActivityID.ActivityID GT 0>
						<strong>#qGetActivityID.ActivityID# ... #qTests.TestName# - #qTests.TestTypeDesc#</strong><br><cfflush>
						
						<!--- CONVERT VALUES --->
						<cfswitch expression="#Trim(qTests.TestTypeDesc)#">
							<cfcase value="Evaluation">
								<cfset TestTypeID = 1>
								<cfset ComponentType = 5>
							</cfcase>
							<cfcase value="PostTest">
								<cfset TestTypeID = 2>
								<cfset ComponentType = 11>
							</cfcase>
							<cfcase value="PreTest">
								<cfset TestTypeID = 3>
								<cfset ComponentType = 12>
							</cfcase>
							<cfdefaultcase>
								<cfset TestTypeID = 1>
								<cfset ComponentType = 5>
							</cfdefaultcase>
						</cfswitch>
						
						<!--- START COMPONENT --->
						<cfset PubComponent = CreateObject("component","_com.ActivityPubComponent.ActivityPubComponent").init(PubComponentID=0)>
						<cfset PubComponent.setComponentID(ComponentType)>
						<cfset PubComponent.setActivityID(qGetActivityID.ActivityID)>
						<cfset PubComponent.setDisplayName(qTests.TestName)>
						<cfset PubComponent.setDescription("")>
						<cfset PubComponent.setExternalURL("")>
						<cfset PubComponent.setFileID("")>
		
						<cfset DetailBean = CreateObject("component","_com.Assessment.Assessment").init()>
						<cfset DetailBean.setAssessmentID(0)>
						
						<cfset DetailBean.setActivityID(qGetActivityID.ActivityID)>
						<cfset DetailBean.setAssessTypeID(TestTypeID)>
						<cfset DetailBean.setName(qTests.TestName)>
						<cfset DetailBean.setDescription("")>
						<cfset DetailBean.setPassingScore(qTests.TestPassingScore)>
						<cfset DetailBean.setMaxAttempts(0)>
						<cfset DetailBean.setRequiredFlag("Y")>
						<cfset DetailBean.setRandomFlag("N")>
						<cfset DetailBean.setCommentFlag("N")>
						<cfset DetailBean.setExternalID("EC-#qTests.CourseID#-#qTests.TestID#")>
						
						<cfset NewAssessID = Application.Com.AssessmentDAO.Create(DetailBean)>
						
						<!--- FINISH COMPONENT --->
						<cfset PubComponent.setAssessmentID(NewAssessID)>
						<cfset PubComponent.setCreatedBy(Session.Person.getPersonID())>
						<cfset Application.Com.ActivityPubComponentDAO.Create(PubComponent)>
						
						<cfquery name="qQuestions" datasource="#OldDSN#">
							SELECT     
								TestQuestionId, 
								TestId, 
								QuestionText, 
								Remediation, 
								SequenceNumber, 
								AnswerTypeId, 
								AnswerType, 
								DisplayFlag, 
								MCCorrectAnswer, 
								I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, 
								T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, 
								D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, 
								VC1, VC2, VC3, VC4, VC5, VC6, VC7, VC8, VC9, VC10, 
								CreationDate, 
								LastUpdate
							FROM dbo.ec_TestQuestion
							WHERE
								TestID=#qTests.TestID#
							ORDER BY SequenceNumber
						</cfquery>
						
						<cfloop query="qQuestions">
							<cfswitch expression="#qQuestions.AnswerType#">
								<cfcase value="Text Area">
									<cfset QuestionTypeID = 4>
								</cfcase>
								<cfcase value="Text">
									<cfset QuestionTypeID = 3>
								</cfcase>
								<cfcase value="MC">
									<cfset QuestionTypeID = 1>
								</cfcase>
								<cfcase value="Radio - H">
									<cfset QuestionTypeID = 1>
								</cfcase>
								<cfcase value="Radio - V">
									<cfset QuestionTypeID = 1>
								</cfcase>
							</cfswitch>
							#qQuestions.QuestionText# [#qQuestions.AnswerType#]<br><cfflush>
							<cfset QuestionBean = CreateObject("component","_com.AssessQuestion.AssessQuestion").init(QuestionID=0)>
							
							<cfset QuestionBean.setQuestionTypeID(QuestionTypeID)>
							<cfset QuestionBean.setLabelText(qQuestions.QuestionText)>
							<cfset QuestionBean.setDetailText("")>
							<cfset QuestionBean.setRequiredFlag("Y")>
							
							
							<cfloop from="1" to="10" index="i">
								<cfset Evaluate("QuestionBean.setVC#i#(qQuestions.VC#i#)")>
								- #Evaluate("qQuestions.VC#i#")#<br>
								<cfflush>
							</cfloop>
							
							<cfset QuestionBean.setExternalID("EC-#qQuestions.TestQuestionId#")>
							
							<cfset QuestionBean.setAssessmentID(NewAssessID)>
							
							<cfset CorrectAnswer = ListFind(Alphabet,qQuestions.MCCorrectAnswer,',')>
							<cfset QuestionBean.setCorrectField("VC#CorrectAnswer#")>
							<cfset QuestionBean = Application.Com.AssessQuestionDAO.Create(QuestionBean)>
						</cfloop>
					</cfif>
				</cfloop>
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<!--- OLD FORM BUILDER APP --->
	<cffunction name="FormBuilder" access="remote" output="yes">
		<cfargument name="FormName" type="string" required="no" default="" />
		
		<cfquery name="qForms" datasource="CCPD-SQL">
		SELECT     formid, formname, formcomment, formsubject
		FROM   afhforms
		WHERE 0=0
		<cfif Arguments.FormName NEQ "">
			AND formname='#Arguments.FormName#'
		</cfif>
		</cfquery>
		
		<cfloop query="qForms">
			<cfquery name="qCourse" datasource="#OldDSN#">
				SELECT CourseID FROM ec_Course
				WHERE Description LIKE '%#Trim(qForms.formname)#%'
			</cfquery>
			
			<cfif qCourse.CourseID GT 0>
				<!--- GET ACTIVITY ID --->
				<cfquery name="qActivity" datasource="#NewDSN#">
					SELECT ActivityID FROM ce_Activity
					WHERE ExternalID = 'EC#qCourse.CourseID#' AND DeletedFlag='N'
				</cfquery>
				
				<!--- START COMPONENT --->
				<cfset PubComponent = CreateObject("component","_com.ActivityPubComponent.ActivityPubComponent").init(PubComponentID=0)>
				<cfset PubComponent.setComponentID(5)>
				<cfset PubComponent.setActivityID(qActivity.ActivityID)>
				<cfset PubComponent.setDisplayName(qForms.formname)>
				<cfset PubComponent.setDescription(qForms.formcomment & "<br>" & qForms.formsubject)>
				<cfset PubComponent.setExternalURL("")>
				<cfset PubComponent.setFileID("")>
				
				<!--- ASSESSMENT --->
				<cfset Assessment = CreateObject("component","_com.Assessment.Assessment").init(ActivityID=qActivity.ActivityID,AssessmentID=0)>
				
				<cfset Assessment.setActivityID(qActivity.ActivityID)>
				<cfset Assessment.setName(qForms.formname)>
				<cfset Assessment.setDescription(qForms.formcomment & "<br>" & qForms.formsubject)>
				<cfset Assessment.setRequiredFlag("Y")>
				<cfset Assessment.setAssessTypeID(1)>

				<cfset Assessment.setAssessmentID(Application.Com.AssessmentDAO.Create(Assessment))>
				
				<!--- FINISH COMPONENT --->
				<cfset PubComponent.setAssessmentID(Assessment.getAssessmentID())>
				<cfset PubComponent.setCreatedBy(Session.Person.getPersonID())>
				<cfset Application.Com.ActivityPubComponentDAO.Create(PubComponent)>
				
				<cfoutput>
				<h1>#qForms.formname# (CourseID: #qCourse.CourseID#)</h1>
				
				<cfquery name="qFields" datasource="CCPD-SQL">
					SELECT     fieldid, fieldname, fieldcaption, fieldtype, fieldorder, fieldrequired,fielddatavalues,fielddatacaptions
					FROM         afhformfields
					WHERE fieldformname='#qForms.formname#'
					ORDER BY FieldOrder
				</cfquery>
				
				<cfloop query="qFields">
					<cfswitch expression="#qFields.fieldtype#">
						<cfcase value="caption">
							<cfset QuestionType = 5>
						</cfcase>
						<cfcase value="text">
							<cfset QuestionType = 3>
						</cfcase>
						<cfcase value="radio">
							<cfset QuestionType = 1>
						</cfcase>
						<cfcase value="checkbox">
							<cfset QuestionType = 8>
						</cfcase>
					</cfswitch>
					
					<cfswitch expression="#qFields.fieldrequired#">
						<cfcase value="Yes">
							<cfset RequiredFlag = "Y">
						</cfcase>
						<cfcase value="No">
							<cfset RequiredFlag = "N">
						</cfcase>
						<cfdefaultcase>
							<cfset RequiredFlag = "N">
						</cfdefaultcase>
					</cfswitch>
					
					<cfset QuestionBean = CreateObject("component","_com.AssessQuestion.AssessQuestion").init()>
					
					<cfset QuestionBean.setQuestionTypeID(QuestionType)>
					<cfset QuestionBean.setLabelText(qFields.fieldcaption)>
					<cfset QuestionBean.setDetailText("")>
					<cfset QuestionBean.setRequiredFlag(RequiredFlag)>
					
					<!--- LOOP THROUGH OPTIONS MAX OUT AT 10 --->
					<cfif ListLen(qFields.fielddatacaptions,'|') GT 0>
					<cfloop from="1" to="#ListLen(qFields.fielddatacaptions,'|')#" index="i">
						<cfset Caption = Replace(ListGetAt(qFields.fielddatacaptions,i,'|'),"'","''","ALL")>
						<cfset Value = ListGetAt(qFields.fielddatavalues,i,'|')>
						
						<cfset Evaluate("QuestionBean.setVC#i#('#Caption#')")>
					</cfloop>
					</cfif>
					
					<cfset QuestionBean.setAssessmentID(Assessment.getAssessmentID())>
					<cfset QuestionBean.setCorrectField("")>
					
					<cfset Application.Com.AssessQuestionDAO.Create(QuestionBean)>
					
					<strong>#qFields.FieldCaption# </strong><font color="##0099CC">(#qFields.fieldtype#)</font><br>
						<cfloop from="1" to="#ListLen(fielddatacaptions,'|')#" index="i">
							<cfset Caption = ListGetAt(qFields.fielddatacaptions,i,'|')>
							<cfset Value = ListGetAt(qFields.fielddatavalues,i,'|')>
							
							- [#i#] #Caption#<br>
						</cfloop>
				</cfloop>
				</cfoutput>
			</cfif>
		</cfloop>
	</cffunction>
	
	<!--- CREDIT --->
	<cffunction name="Credit" access="public" output="no">
		<cfargument name="ActivityID" type="numeric" required="yes">
		<cfargument name="CreditHours" type="numeric" required="yes">
		
		<cfset CreditBean = CreateObject("component","_com.ActivityCredit.ActivityCredit").init(ActivityID=Arguments.ActivityID)>
		<cfset CreditBean.setCreditID(1)>
		<cfset CreditBean.setAmount(Arguments.CreditHours)>
		<cfset CreditBean.setCreatedBy(169841)>
		<cfset Application.Com.ActivityCreditDAO.Save(CreditBean)>
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
</cfcomponent>