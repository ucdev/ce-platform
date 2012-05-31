<cfcomponent>
	<cffunction name="init" access="public" output="no" returntype="_com.Public_Assessment">
		<cfreturn this />
	</cffunction>
    
	<cffunction name="areAssessComplete" hint="Check if all required assessments have been completed" access="Public" output="true" returntype="boolean">
		<cfargument name="ActivityID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">

		<!--- GET ATTENDEE'S ASSESSMENT INFORMATION --->
        <cfquery name="qGetAssessmentInfo" datasource="#Application.Settings.DSN#">
        	SELECT 	ass.AssessmentID,
            		ass.MaxAttempts,
                    ass.RequiredFlag,
                    ass.PassingScore,
                    ass.DeletedFlag
            FROM ce_Assessment ass
            INNER JOIN ce_Activity_PubComponent apc ON apc.AssessmentID = ass.AssessmentID
            WHERE 	ass.ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND
            		apc.activityId = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND
            		ass.RequiredFlag = 'Y' AND
                    ass.DeletedFlag = 'N' AND
                    apc.DeletedFlag = 'N'
        </cfquery>
        
        <!--- CREATE SUCCESSFULLY COMPLETED ASSESSMENT COUNTER --->
        <cfset AssessCount = 0>
        
        <!--- CHECK IF ASSESSMENTS WERE SUCCESSFUL --->
        <cfloop query="qGetAssessmentInfo">
        	<!--- GET RESULTS FOR CURRENT ASSESSMENT --->
            <cfquery name="qGetResults" datasource="#Application.Settings.DSN#">
            	SELECT 	ResultID,
                		ResultStatusID,
                        Score
                FROM ce_AssessResult
                WHERE 	AssessmentID = <cfqueryparam value="#qGetAssessmentInfo.AssessmentID#" cfsqltype="cf_sql_integer" /> AND
                		PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND
                		DeletedFlag = 'N'
            </cfquery>
            
            <!--- CREATE SUCCESSFULResult VARIABLE --->
            <cfset SuccessfulResult = 0>
            
        	<cfloop query="qGetResults">
            	<!--- CHECK IF A SUCCESSFUL RESULT HAS BEEN FOUND --->
            	<cfif SuccessfulResult EQ 0>
                	<!---CHECK IF CURRENT RESULT IS SUCCESSFUL --->
					<cfif qGetResults.ResultStatusID EQ 1>
                        <cfset AssessCount = AssessCount + 1>
            			<cfset SuccessfulResult = 1>
                    </cfif>
                </cfif>
            </cfloop>
        </cfloop>
        
        <!--- CHECK IF ALL ASSESSMENTS WERE COMPLETED --->
        <cfif AssessCount EQ qGetAssessmentInfo.RecordCount>
			<cfreturn True />
        <cfelse>
			<cfreturn False />
        </cfif>
	</cffunction>
    
    <cffunction name="AllAssessFailed" hint="LMS Function // Determine if the user passed or failed the assessment" access="Public" output="true" returntype="string">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        
        <!--- GET THE NUMBER OF FAILED ASSESSMENTS --->
        <cfquery name="qGetFailCount" datasource="#Application.Settings.DSN#">
        	SELECT Count(ar.ResultID) AS FailCount
            FROM ce_AssessResult ar
            INNER JOIN ce_Assessment a ON a.AssessmentID = ar.AssessmentID
            WHERE 	ar.AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
            		ar.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND 
                    a.PassingScore > ar.Score
        </cfquery>
        
        <!--- GET THE MAX NUMBER OF ATTEMPTS FOR ASSESSMENT- --->
        <cfquery name="qGetMaxAttempts" datasource="#Application.Settings.DSN#">
        	SELECT MaxAttempts
            FROM ce_Assessment
            WHERE AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <!--- CHECK IF THE NUMBER OF FAILED ASSESSMENTS IS EQUIVOLENT TO MAX ATTEMPTS --->
        <cfif qGetFailCount.FailCount GTE qGetMaxAttempts.MaxAttempts AND qGetMaxAttempts.MaxAttempts NEQ 0>
        	<cfset Status = "1|Fail">
        <cfelse>
            <cfquery name="qGetScore" datasource="#Application.Settings.DSN#">
            	SELECT TOP 1 Score
                FROM ce_AssessResult
                WHERE 	
                		AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
                		PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND 
                        ResultStatusID = 1 AND 
                        DeletedFlag = 'N'
                    OR  
                    	AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
                		PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND 
                        ResultStatusID = 3 AND 
                        DeletedFlag = 'N'
                ORDER BY Score DESC
            </cfquery>
            
            <cfset Status = "0|#qGetScore.Score#">
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="AttemptCount" hint="Find out how many times an assessment has been taken by user" access="Public" output="true" returntype="string">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        
        <!--- CHECK HOW MANY ATTEMPTS HAVE BEEN MADE FOR A PARTICULAR ASSESSMENT --->
        <cfquery name="qGetResultCount" datasource="#Application.Settings.DSN#">
        	SELECT Count(ResultID) AS AttemptCount
            FROM ce_AssessResult
            WHERE 	AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
					PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND 
					DeletedFlag = 'N'
        </cfquery>
        
        <cfif qGetResultCount.RecordCount NEQ 0>
        	<cfreturn qGetResultCount.AttemptCount />
        </cfif>
    </cffunction>
    
    <cffunction name="getBestResult" hint="LMS Function // Used for indicating the best assessreult record" access="Public" output="true" returntype="Query">
    	<cfargument name="AssessmentID" type="string" required="true">
        <cfargument name="PersonID" type="string" required="true">
        
        <cfquery name="qGetBestResult" datasource="#Application.Settings.DSN#">
        	SELECT TOP 1 ResultID, ResultStatusID, Score
            FROM ce_AssessResult
            WHERE 	AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND
            		PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
            ORDER BY Score DESC
        </cfquery>
        
        <cfreturn qGetBestResult />
    </cffunction>
    
	<cffunction name="getResult" hint="LMS Function" access="Public" output="true" returntype="string">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
		<cfargument name="EvalType" type="string" required="yes">
        
		<cfset ResultBean = createobject("component","#Application.Settings.Com#AssessResult.AssessResult").Init(PersonID=Arguments.PersonID,AssessmentID=Arguments.AssessmentID,DeletedFlag="N")>
        <cfset ResultExists = Application.Com.AssessResultDAO.Exists(ResultBean)>
        
        <cfif ResultExists AND Arguments.EvalType NEQ "RetryEval">
        	<!--- GATHER EXISTING RESULT RECORD --->
            <cfset ResultBean = Application.Com.AssessResultDAO.ReadOpenPostTest(ResultBean)>
            
            <!--- CHECK IF RESULTSTATUS IS NULL --->
            <cfif ResultBean.getResultStatusID() EQ "">
            	<!--- UPDATE RESULTSTATUS --->
            	<cfset ResultBean.setResultStatusID(2)>
                <cfset ResultBean = Application.Com.AssessResultDAO.Update(ResultBean)>
				
                <!--- RE-READ THE RESULTBEAN --->
				<cfset ResultBean = createobject("component","#Application.Settings.Com#AssessResult.AssessResult").Init(PersonID=Arguments.PersonID,AssessmentID=Arguments.AssessmentID,DeletedFlag="N")>
                <cfset ResultBean = Application.Com.AssessResultDAO.Read(ResultBean)>
            </cfif>
			
            <cfset CurrResultID = ResultBean.getResultID()>
        <cfelse>
        	<!--- CREATE NEW RESULT RECORD --->
            <cfset ResultBean.setResultStatusID("2")>
            <cfset CurrResultID = Application.Com.AssessResultDAO.Create(ResultBean)>
        </cfif>
		<cfreturn CurrResultID>
	</cffunction>
    
    <cffunction name="getResultCode" hint="LMS Function // Get the Result code for each assessment, used to pick which icon each assessment uses" access="Public" output="true" returntype="string">
        <cfargument name="ResultStatusID" type="string" required="true" />
        
        <cfif Arguments.ResultStatusID NEQ "">
            <cfquery name="qGetResultCode" datasource="#Application.Settings.DSN#">
                SELECT Code
                FROM ce_Sys_AssessResultStatus
                WHERE ResultStatusID = <cfqueryparam value="#Arguments.ResultStatusID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfreturn qGetResultCode.Code />
        </cfif>
    </cffunction>
    
    <cffunction name="isAssessFailed" hint="Determine if the user passed or failed the assessment" access="Public" output="true" returntype="struct">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("fail")>
        
        <!--- GET THE NUMBER OF FAILED ASSESSMENTS --->
        <cfquery name="qGetFailCount" datasource="#Application.Settings.DSN#">
        	SELECT Count(ar.ResultID) AS FailCount
            FROM ce_AssessResult ar
            INNER JOIN ce_Assessment a ON a.AssessmentID = ar.AssessmentID
            WHERE 	ar.AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
            		ar.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND 
                    a.PassingScore > ar.Score
        </cfquery>
        
        <!--- GET THE MAX NUMBER OF ATTEMPTS FOR ASSESSMENT- --->
        <cfquery name="qGetMaxAttempts" datasource="#Application.Settings.DSN#">
        	SELECT MaxAttempts
            FROM ce_Assessment
            WHERE AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfif len(qGetMaxAttempts.maxAttempts) EQ 0>
        	<cfset maxAttempts = 0>
        <cfelse>
        	<cfset maxAttempts = qGetMaxAttempts.maxAttempts>
        </cfif>
        
        <!--- CHECK IF THE NUMBER OF FAILED ASSESSMENTS IS EQUIVOLENT TO MAX ATTEMPTS --->
        <cfif qGetFailCount.FailCount GTE maxAttempts AND maxAttempts NEQ 0>
        	<cfset status.setStatus(true)>
        <cfelse>
            <cfquery name="qGetScore" datasource="#Application.Settings.DSN#">
            	SELECT TOP 1 Score
                FROM ce_AssessResult
                WHERE 	
                		AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
                		PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND 
                        ResultStatusID = 1 AND 
                        DeletedFlag = 'N'
                    OR  
                    	AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
                		PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND 
                        ResultStatusID = 3 AND 
                        DeletedFlag = 'N'
                ORDER BY Score DESC
            </cfquery>
            
            <cfif len(qGetScore.score)  EQ 0>
	            <cfset status.setStatusMsg(0)>
            <cfelse>
	            <cfset status.setStatusMsg(qGetScore.Score)>
            </cfif>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="markComplete" access="Public" output="true" returntype="struct">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        <cfargument name="ActivityID" type="string" required="yes">
        <cfargument name="ResultID" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("More information is needed to complete this assessment.")>
        
        <cfset activityInfo = createObject("component","_com.activity.activity").init(activityId=arguments.activityId) />
		<cfset activityInfo = application.com.activityDAO.read(activityInfo) />
		
        <!--- GET RESULT INFORMATION --->
        <cfset ResultBean = CreateObject("component","#Application.Settings.Com#AssessResult.AssessResult").Init(ResultID=Arguments.ResultID)>
        <cfset ResultExists = Application.Com.AssessResultDAO.ExistsByResultID(ResultBean)>
        
		<cfif Arguments.ResultID NEQ "">
			<cfset ResultBean = Application.Com.AssessResultDAO.ReadByResultID(ResultBean)>
            <cfset Arguments.ResultID = ResultBean.getResultID()>
        <cfelse>
        	<cfreturn status />
            <cfabort>
        </cfif>
        
        <!--- GET QUESTIONS FOR ASSESSMENT --->
        <cfquery name="qGetQuestions" datasource="#Application.Settings.DSN#">
        	SELECT 	AQ.QuestionID, 
            		AQ.QuestionTypeID,
            		AQ.RequiredFlag, 
                    AQ.LabelText,
            		AQ.CorrectField AS CorrectAnswer,
                    AQ.VC1,AQ.VC2,AQ.VC3,AQ.VC4,AQ.VC5,AQ.VC6,AQ.VC7,AQ.VC8,AQ.VC9,AQ.VC10,
                    AQ.I1,AQ.I2,AQ.I3,AQ.I4,AQ.I5,AQ.I6,AQ.I7,AQ.I8,AQ.I9,AQ.I10,
                    AQ.DT1,AQ.DT2,AQ.DT3,AQ.DT4,AQ.DT5,
                    AQ.TXT1,AQ.TXT2,AQ.TXT3,AQ.TXT4,AQ.TXT5,
                    AA.AnswerID,
                    AA.VC1 AS AnswerValue
            FROM ce_AssessQuestion AQ
            LEFT OUTER JOIN ce_AssessAnswer AA ON AA.QuestionID = AQ.QuestionID AND AA.ResultID = <cfqueryparam value="#ResultBean.getResultID()#" cfsqltype="cf_sql_integer">
            WHERE 
            	AQ.AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND 
                AQ.QuestionTypeID NOT IN (5,6,7) AND
            	AQ.DeletedFlag = 'N'
            ORDER BY Sort
        </cfquery>
        
        <!--- DEFINE ASSESSMENT COMPARISON VARIABLES --->
        <cfset QuestionCount = 0>
        <cfset requiredQuestions = 0>
        <cfset completedQuestions = 0>
        <cfset CorrectAnswers = 0>
        
        <!--- CHECK IF QUESTIONS ARE REQUIRED --->
        <cfloop query="qGetQuestions">
        	<!--- CHECK IF CURRENT QUESTION IS REQUIRED --->
        	<cfif qGetQuestions.RequiredFlag EQ "Y">
            	<cfset requiredQuestions++>
                
                <!--- CHECK IF PROVIDED ANSWER EXISTS --->
				<cfif qGetQuestions.AnswerValue EQ "">
                	<!--- ADD ERROR MESSAGE--->
					<cfset status.addError("Answer Required",qGetQuestions.QuestionID)>
                <cfelse>
                	<cfset completedQuestions++>
                </cfif>
            </cfif>
            
            <cfif NOT ListFind("5,6,7", qGetQuestions.QuestionTypeID,",")> 
            	<cfset QuestionCount = QuestionCount + 1>
            </cfif>
        </cfloop>
        
        <cfif completedQuestions EQ requiredQuestions>
			<cfset AssessmentBean = CreateObject("component","#Application.Settings.Com#Assessment.Assessment").Init(AssessmentID=Arguments.AssessmentID)>
            <cfset AssessmentBean = Application.Com.AssessmentDAO.Read(AssessmentBean)>
            <!--- CHECK IF ASSESSMENT WAS REQUIRED --->
            <cfif AssessmentBean.getRequiredFlag() EQ "Y" AND ListFind("2,3",AssessmentBean.getAssessTypeID(),",")>
                <cfset QuestionCount = 0>
                
                <cfloop query="qGetQuestions">
                    <!--- CHECK IF QUESTION IS REQUIRED --->
                    <cfif qGetQuestions.RequiredFlag EQ "Y">
                        <!--- VALIDATE CORRECT ANSWER --->
                        <cfif qGetQuestions.CorrectAnswer NEQ "" AND Evaluate("qGetQuestions.#qGetQuestions.CorrectAnswer#") EQ qGetQuestions.AnswerValue AND NOT ListFind("3,4,5,6,7", qGetQuestions.QuestionTypeID,",")>
                            <cfset CorrectAnswers = CorrectAnswers + 1>
                        </cfif>
                        
                        <!--- INCREASE THE QUESTIONCOUNT --->
                        <cfif NOT ListFind("3,4,5,6,7", qGetQuestions.QuestionTypeID,",")> 
                            <cfset QuestionCount = QuestionCount + 1>
                        </cfif>
                    </cfif>
                </cfloop>
                
                <cfset AssessmentScore = (CorrectAnswers/QuestionCount)* 100>
                <cfset ResultBean.setScore(AssessmentScore)>
                
                <cfquery name="qGetPassingScore" datasource="#Application.Settings.DSN#">
                    SELECT PassingScore
                    FROM ce_Assessment
                    WHERE AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" />
                </cfquery>
                
                <!--- MARK EVAL COMPLETE // CHECK IF ASSESS SCORE IS GREATER THAN OR EQUAL TO THE ASSESS PASSING SCORE --->
                <cfif AssessmentScore GTE qGetPassingScore.PassingScore OR AssessmentBean.getAssessTypeID() EQ 3>
                    <cfset ResultBean.setResultStatusID("1")>
                    <cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("Assessment has been marked completed!")>
                <cfelse>
                    <cfset ResultBean.setResultStatusID("3")>
                    <cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("Assessment has been marked failed.")>
                </cfif>
            <cfelse>
                <!--- MARK EVAL COMPLETE --->
                <cfset ResultBean.setResultStatusID("1")>
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Assessment has been marked completed!")>
            </cfif>
            
            <!--- SAVE THE ASSESSRESULTBEAN --->
            <cfset ResultBean = Application.Com.AssessResultDAO.UpdateByResultID(ResultBean)>
    
            <!--- GET ATTENDEE INFO --->
            <cfset AttendeeBean = CreateObject("component","#Application.Settings.Com#Attendee.Attendee").Init(ActivityID=Arguments.ActivityID,PersonID=Arguments.PersonID)>
            <cfset AttendeeBean = Application.Com.AttendeeDAO.Read(AttendeeBean)>
            
            <!--- CHECK IF THE ASSESSMENT IS REQUIRED AND IS A POST TEST --->
            <cfif AssessmentBean.getRequiredFlag() EQ "Y" AND AssessmentBean.getAssessTypeID() EQ 2>
                <!--- GET VARS TO CHECK IF ASSESSMENT HAS BEEN COMPLETELY FAILED --->
                <cfset AttemptCount = this.AttemptCount(AssessmentID=Arguments.AssessmentID,PersonID=Arguments.PersonID)>
                <cfset isAssessFailed = this.isAssessFailed(AssessmentID=Arguments.AssessmentID,PersonID=Arguments.PersonID)>
                
                <!--- CHECK IF ASSESSMENT.MAXATTEMPTS HAS BEEN MET AND ALL ASSESSMENTS WERE FAILED --->
                <cfif AttemptCount GTE AssessmentBean.getMaxAttempts() AND isAssessFailed.getStatus() AND AssessmentBean.getMaxAttempts() NEQ 0>
                    <!--- UPDATE ATTENDEE RECORD TO BE FAILED --->
                    <cfset AttendeeBean.setStatusID(4)>
                    <cfset AttendeeBean.setCompleteDate("")>
                    <cfset AttendeeBean.setTermDate(Now())>
                    <cfset AttendeeBean = Application.Com.AttendeeDAO.Save(AttendeeBean)>
                    
                    <!--- GET PUBGENERAL INFORMATION --->
                    <cfset PubGeneralBean = CreateObject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").Init(ActivityID=Arguments.ActivityID)>
                    <cfset PubGeneralBean = Application.Com.ActivityPubGeneralDAO.Read(PubGeneralBean)>
                    
                    <!--- CHECK NOTIFICATION EMAILS ARE TO BE SENT --->
                    <cfif PubGeneralBean.getNotifyEmails() NEQ "">
                        <!--- GET ACTIVITY INFORMATION --->
                        <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
                        <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
                        
                        <!--- GET PERSON INFORMATION --->
                        <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.PersonID)>
                        <cfset PersonBean = Application.Com.PersonDAO.Read(PersonBean)>
                        
                        <!--- SEND EMAIL NOTIFICATION --->
                        <cfmail	to="#PubGeneralBean.getNotifyEmails()#"
                                bcc="slamkajs@ucmail.uc.edu"
                                from="CCPDLMS.Administration@uc.edu"
                                subject="CCPD LMS - Assessment Failure Notification"
                                type="html">
                            #PersonBean.getFirstName()# #PersonBean.getLastName()# has failed the activity '<a href="http://ccpd.uc.edu/index.cfm/event/Activity.Detail?ActivityID=#ActivityBean.getActivityID()#">#ActivityBean.getTitle()#</a>'.  
                        </cfmail>
                    <cfelse>
                    </cfif>
                    
                    <cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("Activity has been marked as failed.")>
                </cfif>
            <cfelse>
                <!--- IF ASSESSMENT IS NOT A POST TEST, CHECK IF IT IS THE ONLY REQUIRED TEST FOR THE ACTIVITY ---->
                <cfset application.activityAttendee.markComplete(personId=arguments.personId,activityId=arguments.activityId) />
            </cfif>
        <cfelse>
        	<cfset status.setStatusMsg("More answers are required.")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
	<cffunction name="saveAnswer" access="Public" output="false" returntype="string">
		<cfargument name="QuestionID" type="string" required="yes">
		<cfargument name="AssessmentID" type="string" required="yes">
		<cfargument name="ResultID" type="string" required="yes">
		<cfargument name="Answer" type="string" required="yes">
		<cfargument name="FieldType" type="string" required="yes">
        
        <cfset var Status = "">
        
        <cfif Arguments.QuestionID EQ "" OR Arguments.AssessmentID EQ "" OR Arguments.ResultID EQ "" OR Arguments.Answer EQ "">
        	<cfset Status = False>
        	<cfreturn Status />
            <cfabort>
        </cfif>
        
        <cfif Status EQ "">
        	<cfset AnswerBean = CreateObject("component","#Application.Settings.Com#AssessAnswer.AssessAnswer").Init(QuestionId=arguments.questionId,resultId=arguments.resultId,assessmentId=Arguments.AssessmentID)>
            <cfif application.com.assessAnswerDAO.exists(answerBean)>
            	<cfset answerBean = application.com.assessAnswerDAO.read(answerBean)>
            </cfif>
            
		    <cfset AnswerBean.setVC1(Arguments.Answer)>
            <cfset Answerbean.setDeletedFlag("N")>
        
            <cfset Status = Application.Com.AssessAnswerDAO.Save(AnswerBean)>
        </cfif>
        
        <cfreturn Status />
	</cffunction>
</cfcomponent>