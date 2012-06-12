<cfcomponent hint="Attendee Functions [Faculty/Committee functions are kept in ActivityPeople.CFC]">
	<cfinclude template="/_com/_UDF/isMD.cfm" />
    
	<cffunction name="init" access="public" output="no" returntype="_com.Public_ActivityAttendee">
		<cfreturn this />
	</cffunction>
    
    <cffunction name="getAttendeeDate" hint="Returns requested date information for provided attendee." access="Public" output="false">
    	<cfargument name="AttendeeID" type="numeric" required="yes">
    	<cfargument name="PersonID" type="numeric" required="yes">
        <cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="Type" type="numeric" required="yes">
        
        <!---
			THE TYPE INPUT CAN BE ANY OF THE FOLLOWING
			1: Completed
			2: In progress (Returns register date)
			3: Registered
			4: Terminated
		--->
        
        <cfset var DateInfo = "">
        <cfset var AttendeeInfo = "">
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Attendee Date does not exist.")>
        
        
        <cfswitch expression="#Arguments.Type#">
        	<cfcase value="1">
            	<cfquery name="AttendeeInfo" datasource="#Application.Settings.DSN#">
                	SELECT CompleteDate AS RequestedDate
                    FROM ce_Attendee
                    WHERE 
                    	<cfif arguments.attendeeId GT 0>
                        attendeeId = <cfqueryparam value="#Arguments.attendeeId#" cfsqltype="cf_sql_integer" />
                        <cfelse>
                    	PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
                       	</cfif>
                </cfquery>
            	<cfset status.setStatusMsg("COMPLETE (" & DateFormat(AttendeeInfo.RequestedDate, "MM/DD/YYYY") & ")")>
                <cfset status.setData({ 'date': DateFormat(AttendeeInfo.RequestedDate, "MM/DD/YYYY") }) />
            </cfcase>
        	<cfcase value="2">
            	<cfquery name="AttendeeInfo" datasource="#Application.Settings.DSN#">
                	SELECT RegisterDate AS RequestedDate
                    FROM ce_Attendee
                    WHERE 
                    	<cfif arguments.attendeeId GT 0>
                        attendeeId = <cfqueryparam value="#Arguments.attendeeId#" cfsqltype="cf_sql_integer" />
                        <cfelse>
                    	PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
                       	</cfif>
                </cfquery>
            	<cfset status.setStatusMsg("IN PROGRESS")>
                <cfset status.setData({ 'date': DateFormat(AttendeeInfo.RequestedDate, "MM/DD/YYYY") }) />
            </cfcase>
        	<cfcase value="3">
            	<cfquery name="AttendeeInfo" datasource="#Application.Settings.DSN#">
                	SELECT RegisterDate AS RequestedDate
                    FROM ce_Attendee
                    WHERE 
                    	<cfif arguments.attendeeId GT 0>
                        attendeeId = <cfqueryparam value="#Arguments.attendeeId#" cfsqltype="cf_sql_integer" />
                        <cfelse>
                    	PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
                       	</cfif>
                </cfquery>
            	<cfset status.setStatusMsg("REGISTERED (" & DateFormat(AttendeeInfo.RequestedDate, "MM/DD/YYYY") & ")")>
                <cfset status.setData({ 'date': DateFormat(AttendeeInfo.RequestedDate, "MM/DD/YYYY") }) />
            </cfcase>
        	<cfcase value="4">
            	<cfquery name="AttendeeInfo" datasource="#Application.Settings.DSN#">
                	SELECT TermDate AS RequestedDate
                    FROM ce_Attendee
                    WHERE 
                    	<cfif arguments.attendeeId GT 0>
                        attendeeId = <cfqueryparam value="#Arguments.attendeeId#" cfsqltype="cf_sql_integer" />
                        <cfelse>
                    	PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
                       	</cfif>
                </cfquery>
            	<cfset status.setStatusMsg("TERMINATED (" & DateFormat(AttendeeInfo.RequestedDate, "MM/DD/YYYY") & ")")>
                <cfset status.setData({ 'date': DateFormat(AttendeeInfo.RequestedDate, "MM/DD/YYYY") }) />
            </cfcase>
        </cfswitch>
        
        <cfif isQuery(AttendeeInfo)>
        	<cfset status.setStatus(true)>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="getAttendees" access="public" output="false" returntype="query">
		<cfargument name="AttendeeID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		
		<cfquery name="qList" datasource="#application.settings.dsn#">
			SELECT     
				att.AttendeeID, 
				att.ActivityID, 
				att.PersonID, 
				att.StatusID,
				att.CheckedInFlag, 
				att.CheckIn, 
				att.CheckedOutFlag, 
				att.CheckOut, 
				att.PaymentDate, 
				att.PayAmount, 
				att.PayOrderNo, 
				att.RegisterDate, 
				att.CompleteDate, 
				att.TermDate,
				att.Created, 
				att.Updated, 
				att.Deleted, 
				att.DeletedFlag, 
				att.MDflag,
				CASE 
					WHEN isNull(att.PersonId,0) = 0 THEN
						isNull(att.lastname,'') + ', ' + isNull(att.FirstName,'')
					ELSE
						isNull(p1.lastname,'') + ', ' + isNull(p1.FirstName,'')
				END As FullName,
				p1.FirstName, 
				p1.MiddleName,
				p1.LastName, 
				p1.Email,
				address.City,
				address.State,
				address.Country,
				A.Title, 
				A.Description,
				A.StartDate,
				ats.Name AS StatusName,
				A.StartDate,
                CASE p1.deletedFlag
                    WHEN 'Y' THEN 'true'
                    ELSE 'false'
                END AS personDeleted,
				CASE 
					WHEN isNull(att.PersonId,0) = 0 THEN
						0 
					ELSE
						1
				END As hasAcctFlag
        FROM         
			ce_Attendee AS att 
        INNER JOIN 
			ce_Activity AS A ON att.ActivityID = A.ActivityID 
        LEFT OUTER JOIN 
			ce_person AS p1 ON p1.personid = att.PersonID
        LEFT OUTER JOIN 
			ce_Person_Address AS Address ON p1.PrimaryAddressID=Address.addressid
        LEFT OUTER JOIN 
			ce_Sys_AttendeeStatus ats ON ats.AttendeeStatusID = att.StatusID
        WHERE     
			(A.DeletedFlag='N')
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	att.AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	att.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	att.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	att.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	att.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	att.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	att.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif><!---
		OR
		(A.DeletedFlag='N') AND ((SELECT COUNT(PD1.PersonDegreeID)
        									 FROM ce_Person_Degree PD1
                                             WHERE PersonID = ATT.PersonID) = 0) --->
		<!---<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	att.AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	att.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	att.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	att.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	att.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	att.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	att.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>--->
		ORDER BY (CASE 
			WHEN isNull(att.PersonId,0) = 0 THEN
				0 
			ELSE
				1
		END),(CASE 
			WHEN isNull(att.PersonId,0) = 0 THEN
				isNull(att.lastname,'') + ', ' + isNull(att.FirstName,'')
			ELSE
				isNull(p1.lastname,'') + ', ' + isNull(p1.FirstName,'')
		END)
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
    
	<cffunction name="getActivityStatus" hint="LMS Function" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        
        <cfquery name="qGetAttendeeStatus" datasource="#Application.Settings.DSN#">
        	SELECT a.StatusID, ats.Name
            FROM ce_Attendee a
            INNER JOIN ce_Sys_AttendeeStatus ats ON ats.AttendeeStatusID = a.StatusID
            WHERE 
            	a.ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
            	a.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND
                a.DeletedFlag = 'N'
        </cfquery>
        
		<cfreturn qGetAttendeeStatus.Name />
	</cffunction>
    
    <cffunction name="markComplete"  access="Public" output="true" returntype="struct">
		<cfargument name="PersonID" type="string" required="yes">
        <cfargument name="ActivityID" type="string" required="yes">
        
        <cfset var Status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        <cfset var AssessPass = 0>
		
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot complete activity due to unknown reasons.")>
        
        <!--- CHECK IF ALL ASSESSMENTS ARE COMPLETE --->
        <cfset AllAssessComplete = Application.Assessment.areAssessComplete(ActivityID=Arguments.ActivityID,PersonID=Arguments.PersonID)>
        <cfset activityInfo = createObject("component","_com.activity.activity").init(activityId=arguments.activityId) />
		<cfset activityInfo = application.com.activityDAO.read(activityInfo) />
		
        <!--- CHECK IF ANY ERRORS WERE FOUND --->
        <cfif AllAssessComplete>
        	<!--- GATHER ATTENDEE INFORMATION --->
            <cfset AttendeeBean = CreateObject("component","#Application.Settings.Com#Attendee.Attendee").Init(ActivityID=Arguments.ActivityID,PersonID=Arguments.PersonID)>
            <cfset AttendeeBean = Application.Com.AttendeeDAO.Read(AttendeeBean)>
            
			<cfif attendeeBean.getStatusID() NEQ 1>
				<!--- GET LIST OF ASSESSMENTS --->
				<cfquery name="AssessmentList" datasource="#Application.Settings.DSN#">
					SELECT 
						APC.AssessmentID,
						ASS.PassingScore
					FROM ce_Activity_PubComponent APC
					INNER JOIN ce_Assessment ASS ON ASS.AssessmentID = APC.AssessmentID
					WHERE 
						(APC.ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />) AND
						(APC.AssessmentID IS NOT NULL) AND
						(APC.DeletedFlag = 'N')
				</cfquery>
				
				<!--- CHECK WHETHER ALL ASSESSMENTS WERE PASSED --->
				<cfloop query="AssessmentList">
					<cfset CurrResult = Application.Assessment.isAssessFailed(PersonID=Arguments.PersonID,AssessmentID=AssessmentList.AssessmentID)>
					
					<cfif len(assessmentList.passingScore) EQ 0>
						<cfset passingScore = 0>
					<cfelse>
						<cfset passingScore = assessmentList.passingScore>
					</cfif>
					
					<cfif isNumeric(currResult.getStatusMsg()) AND currResult.getStatusMsg() GTE passingScore>
						<cfset AssessPass = AssessPass + 1>
					</cfif>
				</cfloop>
				<!--- CHECK IF THE ACTIVITY WAS PASSED/FAILED --->
				<cfif AssessPass EQ AssessmentList.RecordCount>
					<!--- UPDATE ATTENDEE STATUSID --->
					<cfset AttendeeBean.setStatusID(1)>
					<cfset AttendeeBean.setTermDate("")>
					
					<cfif activityInfo.getActivityTypeID() NEQ 2>
						  <cfset AttendeeBean.setCompleteDate(activityInfo.getEndDate())>
					<cfelse>
						<cfset AttendeeBean.setCompleteDate(Now())>
					</cfif>
					
					<cfset Application.History.Add(
								HistoryStyleID=95,
								FromPersonID=Arguments.PersonID,
								ToActivityID=Arguments.ActivityID)>
					
					<!--- UPDATE STATS --->
					<cfset createObject("component", "admin._com.scripts.statFixer").run(activityId=arguments.activityId,mode='manual')>
					
					<!--- UPDATE ATTENDEE --->
					<cfset Application.Com.AttendeeDAO.Save(AttendeeBean)>
					
					<cftry>
						<cfset application.email.send(EmailStyleID=5,ToAttendeeID=AttendeeBean.getAttendeeID(),ToActivityID=arguments.activityId,ToPersonID=arguments.PersonId,ToCreditID=1) />
						
						<cfcatch type="any">
						
						</cfcatch>
					</cftry>
				<cfelse>
					<!--- UPDATE ATTENDEE STATUSID --->
					<cfset AttendeeBean.setStatusID(4)>
					<cfset AttendeeBean.setCompleteDate("")>
					<cfset AttendeeBean.setTermDate(Now())>
					
					<!--- UPDATE ATTENDEE --->
					<cfset Application.Com.AttendeeDAO.Save(AttendeeBean)>
					
					<cfset Application.History.Add(
								HistoryStyleID=97,
								FromPersonID=Arguments.PersonID,
								ToActivityID=Arguments.ActivityID)>
				</cfif>
            </cfif>
			
            <!--- SET STATUS --->
            <cfset status.setStatus(true)>
        	<cfset status.setStatusMsg("Activity has been marked completed!")>
        </cfif>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="removeAll" access="Public" output="true" returntype="struct">
		<cfargument name="ActivityID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot remove all attendees for unknown reasons.")>
		
		<!--- Check to make sure the Argument var is not blank --->
		<cfif Arguments.ActivityID EQ "">
			<cfset status.setStatusMsg("More information is required to remove all Attendees from this activity.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>
            
            <!--- DELETE ATTENDEECREDIT RECORDS --->
            <cfquery name="qDeleteAttendeeCredits" datasource="#Application.Settings.DSN#">
            	DELETE FROM ceschema.ce_AttendeeCredit
				WHERE attendeeId IN (SELECT attendeeId FROM ceschema.ce_attendee WHERE ActivityId = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />)
            </cfquery>
            
            <!--- UPDATE ATTENDEE RECORDS --->
            <cfquery name="qRemoveAll" datasource="#Application.Settings.DSN#">
                UPDATE ce_Attendee
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />
                WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
            </cfquery>
            
            <!--- ACTIVITY DETAIL --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <!--- ACTIVITY STATS --->
            <cfset ActivityBean.setStatAttendees(0)>
            <cfset ActivityBean.setStatMD(0)>
            <cfset ActivityBean.setStatNonMD(0)>
                    
            <!--- Check if activity is a Parent Activity --->
            <cfif ActivityBean.getParentActivityID() NEQ "">
                <!--- Update ParentActivity StatAttendees --->
                <cfset ParentActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=ActivityBean.getParentActivityID())>
                <cfset ParentActivityBean = Application.Com.ActivityDAO.Read(ParentActivityBean)>
                <cfset ParentActivityBean.setStatAttendees(0)>
                <cfset ParentActivityBean.setStatMD(0)>
                <cfset ParentActivityBean.setStatNonMD(0)>
                <cfset ParentActivityBean = Application.Com.ActivityDAO.Update(ParentActivityBean)>
            </cfif>
            
            <cfset Application.Com.ActivityDAO.Update(ActivityBean)>
            
            <cfset Application.History.Add(
                        HistoryStyleID=67,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID)>
            
        	<cfset status.setStatus(true)>
        	<cfset status.setStatusMsg("All attendees have been removed.")>
            
            <cfcatch type="any">
                <cfset Status.setStatusMsg("Fail|Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>

	<cffunction name="removeChecked" access="Public" output="true" returntype="struct">
		<cfargument name="AttendeeList" required="false" type="string" default="">
		<cfargument name="ActivityID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot selected attendees for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.AttendeeList EQ "" OR Arguments.ActivityID EQ "">
        	<cfset status.setStatusMsg("More information is required to remove the selected members.")>
            <cfreturn status />
            <cfabort>
		</cfif>
    
		<cfset AddCount = 0>
        <cfset CurrDateTime = DateFormat(Now(),"MM/DD/YYYY") & " " & TimeFormat(Now(),"hh:mm:ssTT")>
            
		<!--- ACTIVITY DETAIL --->
        <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
        <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
        
        <Cfset personList = "">
        
        <cfloop list="#Arguments.AttendeeList#" index="attendeeId">
            <!--- ATTENDEE DETAIL --->
            <cfset AttendeeBean = CreateObject("component","#Application.Settings.Com#Attendee.Attendee").init(ActivityID=Arguments.ActivityID)>
            <cfset AttendeeBean.setAttendeeId(attendeeId) />
            <cfset AttendeeBean = Application.Com.AttendeeDAO.read(AttendeeBean)>
            
            <!--- UPDATE PERSON LIST --->
            <cfset personList = listAppend(personList, attendeeBean.getPersonId(), ",")>
            
            <cfset AttendeeBean.setDeletedFlag("Y")>
            <cfset AttendeeBean.setDeleted(now())>
            
            <!--- DELETE ATTENDEECREDIT RECORDS --->
            <cfquery name="qDeleteAttendeeCredits" datasource="#Application.Settings.DSN#">
                DELETE FROM ce_AttendeeCredit
                WHERE AttendeeID = <cfqueryparam value="#AttendeeBean.getAttendeeID()#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfset Application.Com.AttendeeDAO.update(AttendeeBean)>
            
            <!--- Count the total records being deleted --->
            <cfset AddCount++>
        </cfloop>
		
		<cfset createObject("component", "admin._com.scripts.statFixer").run(activityId=arguments.activityId,mode='manual')>
            
		<!--- ACTIVITY ACTION UPDATER --->
        <cfif AddCount EQ 1>
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("1 attendee has been removed.")>
            
            <!--- ADD HISTORY ITEM --->
            <cfset Application.History.Add(
                        HistoryStyleID=50,
                        FromPersonID=session.currentuser.id,
                        ToPersonID=PersonList,
                        ToActivityID=Arguments.ActivityID)>
        <cfelseif AddCount GT 1>
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg(AddCount & " attendees have been removed.")>
            
            <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
                SELECT DisplayName
                FROM ce_Person
                WHERE PersonID IN (#PersonList#)
            </cfquery>
            
            <cfset OutputVar = "">
            <cfloop query="PersonInfo">
                <cfset OutputVar = ListAppend(OutputVar,Trim(PersonInfo.DisplayName),", ")>
            </cfloop>
            
            <!--- ADD HISTORY ITEM --->
            <cfset Application.History.Add(
                        HistoryStyleID=54,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID,
                        ToContent=OutputVar)>
        </cfif>
        
		<cfreturn status />
	</cffunction>
    
    <cffunction name="resetAttendee" access="public" output="false" returntype="struct">
        <cfargument name="attendeeId" required="yes" type="numeric">
        <cfargument name="PaymentFlag" hint="Determines in payment info is reset." required="yes" type="string">
        
        <cfset var Assessments = "">
        <cfset var Results = "">
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot reset attendee record due to unknown reasons.")>
        
        <!--- GET ATTENDEEID --->
        <cfset AttendeeBean = CreateObject("component", "#Application.Settings.Com#Attendee.Attendee").Init()>
        
		<cfif arguments.attendeeId GT 0>
        	<cfset attendeeBean.setAttendeeId(arguments.attendeeId)>
        <cfelse>
        	<cfset attendeeBean.setActivityId(Arguments.ActivityID)>
			<cfset attendeeBean.setPersonId(Arguments.PersonID)>
        </cfif>
        
        <cfset AttendeeExists = Application.Com.AttendeeDAO.Exists(AttendeeBean)>
        
        <cfif AttendeeExists>
        	<cfset AttendeeBean = Application.Com.AttendeeDAO.Read(AttendeeBean)>
            
            <!--- GET ASSESSMENTS --->
            <cfquery name="AssessmentList" datasource="#Application.Settings.DSN#">
            	SELECT 
                	AssessmentID
                FROM
                	ce_Assessment
                WHERE 
                	ActivityID = <cfqueryparam value="#attendeeBean.getActivityID()#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfif AssessmentList.RecordCount GT 0>
            	<!--- SET UP ASSESSMENT VARIABLE FOR GETTING RESULTS --->
                <cfloop query="AssessmentList">
                <cfset Assessments = ListAppend(Assessments, AssessmentList.AssessmentID, ",")>
                </cfloop>
                
                <!--- GET RESULTS --->
	            <cfquery name="ResultsList" datasource="#Application.Settings.DSN#">
                	SELECT
                    	ResultID
                    FROM
                    	ce_AssessResult
                    WHERE
                    	PersonID = <cfqueryparam value="#attendeeBean.getPersonId()#" cfsqltype="cf_sql_integer" /> AND
                    	AssessmentID IN (<cfoutput>#Assessments#</cfoutput>)
                </cfquery>
                
                <cfif ResultsList.RecordCount GT 0>
                	<!--- SET UP RESULT VARIABLE FOR GETTING ANSWERS --->
                    <cfloop query="ResultsList">
                    <cfset Results = ListAppend(Results, ResultsList.ResultID, ",")>
                    </cfloop>
                    
                    <!--- DELETE ANSWERS RELATED TO RESULTS VARIABLE --->
                    <cfquery name="clearAnswers" datasource="#Application.Settings.DSN#">
                    	DELETE FROM 
                        	ce_AssessAnswer
                        WHERE 
                        	ResultID IN (<cfoutput>#Results#</cfoutput>)
                    </cfquery>
                
					<!--- DELETE RESULTS FROM RESULT VARIABLE --->
                    <cfquery name="cleanResults" datasource="#Application.Settings.DSN#">
                        DELETE FROM 
                            ce_AssessResult
                        WHERE
                            ResultID IN (<cfoutput>#Results#</cfoutput>)
                    </cfquery>
                </cfif>
            </cfif>
            
            <!--- RESET ATTENDEE VALUES --->
            <cfset AttendeeBean.setStatusID(3)>
            <cfset AttendeeBean.setCompleteDate("")>
            <cfset AttendeeBean.setTermDate("")>
            <cfset AttendeeBean.setTermsFlag("N")>
            <cfset AttendeeBean.setUpdated(Now())>
            <cfset AttendeeBean.setUpdatedBy(session.currentuser.id)>
            
            <!--- CHECK IF PAYMENT INFO NEEDS RESET --->
            <cfif Arguments.PaymentFlag EQ "Y">
            	<cfset AttendeeBean.setPaymentFlag("N")>
                <cfset AttendeeBean.setPayAmount("")>
                <cfset AttendeeBean.setPayOrderNo("")>
                <cfset AttendeeBean.setPaymentDate("")>
            </cfif>
            
            <!--- UPDATE ATTENDEE RECORD --->
            <cfset AttendeeSaved = Application.Com.AttendeeDAO.Update(AttendeeBean)>
            
            <cfif AttendeeSaved>
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Attendee has been reset.")>
            </cfif>
        <cfelse>
        	<cfset status.setStatusMsg("Attendee does not exist.")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
	
    <cffunction name="saveAttendee" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="PersonID" required="no" type="string" default="0">
		
		<cfargument name="firstName" type="string" required="no" default="">
		<cfargument name="middleName" type="string" required="no" default="">
		<cfargument name="lastName" type="string" required="no" default="">
		<cfargument name="email" type="string" required="no" default="">
		<cfargument name="certName" type="string" required="no" default="">
		<cfargument name="Address1" type="string" required="no" default="">
        <cfargument name="Address2" type="string" required="no" default="">
        <cfargument name="City" type="string" required="no" default="">
        <cfargument name="stateId" type="string" required="no" default="0">
        <cfargument name="stateProvince" type="string" required="no" default="">
        <cfargument name="countryId" type="string" required="no" default="0">
        <cfargument name="postalCode" type="string" required="no" default="">
        <cfargument name="Phone1" type="string" required="no" default="">
        <cfargument name="Phone1ext" type="string" required="no" default="">
        <cfargument name="Phone2" type="string" required="no" default="">
        <cfargument name="Phone2ext" type="string" required="no" default="">
        <cfargument name="Fax" type="string" required="no" default="">
        <cfargument name="FaxExt" type="string" required="no" default="">
        <cfargument name="RegisterDate" type="string" required="no" default="#now()#">
        <cfargument name="CompleteDate" type="string" required="no" default="">
		<cfargument name="MDFlag" required="no" type="string" default="N" />
		<cfargument name="hours" required="no" type="string" default="0" />
		<cfargument name="statusId" required="no" type="string" default="3" />
		<cfargument name="sendEmail" required="no" type="string" default="1" />
		<cfargument name="entryMethod" required="no" type="string" default="" />
        
		<cfset var Status = "">
		
		<cfif Arguments.ActivityID EQ "">
			<cfset Status = "Fail|More information is required to add this attendee.">
		</cfif>
		
		<cfif Status EQ "">
            
				<!--- CREATE ATTENDEE BEAN --->
				<cfset AttendeeBean = CreateObject("component","#Application.Settings.Com#Attendee.Attendee").Init(PersonID=Arguments.PersonID,ActivityID=Arguments.ActivityID)>
					
				<!--- CHECK IF ATTENDEE EXISTS --->
				<cfif arguments.personId GT 0>
					<cfset AttendeeExists = Application.Com.AttendeeDAO.Exists(AttendeeBean)>
					<cfif AttendeeExists>
						<cfset AttendeeBean = Application.Com.AttendeeDAO.Read(AttendeeBean)>
						
						<cfif AttendeeBean.getDeletedFlag() EQ "N">
							<cfset Status = "Fail|Attendee already exists.">
							<cfreturn Status />
							<cfabort>
						</cfif>
					</cfif>
				<cfelse>
					 <cfif arguments.personId EQ 0 AND len(arguments.email) GT 0>
					 	<cfquery name="qCheckByEmail" datasource="#application.settings.dsn#">
							SELECT count(attendeeId) As foundCount FROM ce_attendee
							WHERE email=<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" /> AND deletedFlag='N'
						</cfquery>
						
						<cfif qCheckByEmail.foundCount GT 0>
							<cfset Status = "Fail|Attendee already exists.">
							<cfreturn Status />
							<cfabort>
						</cfif>
					 </cfif>
				</cfif>
                
				<!--- SET MDFLAG --->
                <!--- CHECK IF PERSON HAS A RECORD --->
                <cfif arguments.personId GT 0>
                	<!--- CHECK PERSONS DEGREE --->
                    <cfif isMD(personId=Arguments.PersonID)>
                        <cfset MDFlag = "Y">
                    <cfelse>
                        <cfset MDFlag = "N">
                    </cfif>
                <!--- CHECK IF MDFlag EXISTS --->
                <cfelseif isDefined("Arguments.MDFlag")>
					<cfif Arguments.MDFlag EQ "Y">
						<cfset MDFlag = "Y">
					<cfelse>
	                    <cfset MDFlag = "N">
					</cfif>
                <cfelse>
                    <cfset MDFlag = "N">
                </cfif>
                
                <!--- CREATE ATTENDEE RECORD --->
                <cfset AttendeeBean.setStatusID(arguments.StatusId)>
                <cfset AttendeeBean.setMDFlag(MDFlag)>
                <cfset AttendeeBean.setTermsFlag("Y")>
                <cfset AttendeeBean.setPaymentFlag("Y")>
                <cfset AttendeeBean.setCheckIn(arguments.registerDate)>
                <cfset AttendeeBean.setRegisterDate(arguments.registerDate)>
                <cfset AttendeeBean.setDeleted("")>
                <cfset AttendeeBean.setDeletedFlag("N")>
                <cfset AttendeeBean.setFirstName(Arguments.firstname)>
                <cfset AttendeeBean.setMiddleName(Arguments.middlename)>
                <cfset AttendeeBean.setLastName(Arguments.lastname)>
                <cfset AttendeeBean.setEmail(Arguments.email)>
                <cfset AttendeeBean.setCertName(Arguments.certName)>
                <cfset AttendeeBean.setAddress1(Arguments.Address1)>
				<cfset AttendeeBean.setAddress2(Arguments.Address2)>
				<cfset AttendeeBean.setCity(Arguments.City)>
				<cfset AttendeeBean.setCountryId(Arguments.CountryId)>
				<cfset AttendeeBean.setStateId(Arguments.StateId)>
				<cfset AttendeeBean.setStateProvince(Arguments.StateProvince)>
				<cfset AttendeeBean.setPostalCode(Arguments.postalCode)>
				<cfset AttendeeBean.setPhone1(Application.UDF.stripAllBut(Arguments.Phone1,"1234567890"))>
				<cfset AttendeeBean.setPhone1ext(arguments.Phone1ext)>
				<cfset AttendeeBean.setPhone2(Application.UDF.stripAllBut(Arguments.Phone2,"1234567890"))>
				<cfset AttendeeBean.setPhone2ext(arguments.Phone2ext)>
				<cfset AttendeeBean.setFax(Application.UDF.stripAllBut(Arguments.Fax,"1234567890"))>
				<cfset AttendeeBean.setFaxext(arguments.FaxExt)>
				<cfset AttendeeBean.setEntryMethod(arguments.EntryMethod)>
				<cfif isDate(arguments.completeDate)>
				<cfset AttendeeBean.setCompleteDate(arguments.completeDate)>
				</cfif>
				
                <cfset AttendeeBean.setCreatedBy(session.currentuser.id)>
                
                <!--- CHECK IF NUMERIC --->
                <cfset AttendeeSaved = Application.Com.AttendeeDAO.Save(AttendeeBean)>
                
                <cfif isNumeric(AttendeeSaved)>
                	<cfset AttendeeBean.setAttendeeID(AttendeeSaved)>
                </cfif>
                
                <!--- GET CREDITS FOR ACTIVITY --->
                <cfset qCredits = Application.Com.ActivityCreditGateway.getByAttributes(ActivityID=Arguments.ActivityID)>
                
                <!--- ACTIVITYCREDIT DETAIL --->
                <cfloop query="qCredits">
                    <!--- CREATE ACTIVITYCREDIT BEAN --->
                    <cfset ActivityCreditBean = CreateObject("component","#Application.Settings.Com#ActivityCredit.ActivityCredit").Init(
						ActivityID=Arguments.ActivityID,
						CreditID=qCredits.CreditID)>
                    <cfset ActivityCreditBean = Application.Com.ActivityCreditDAO.Read(ActivityCreditBean)>
                    
					<cfset creditAmount = ActivityCreditBean.getAmount() />
					
					<cfif isNumeric(arguments.hours) AND arguments.hours GT 0>
						<cfset creditAmount = arguments.hours />
					</cfif>
					
                    <!--- CREATE ATTENDEECREDIT RECORD --->
                    <cfset AttendeeCreditBean = CreateObject("component","#Application.Settings.Com#AttendeeCredit.AttendeeCredit").Init(
						AttendeeID=AttendeeBean.getAttendeeID(),
						CreditID=ActivityCreditBean.getCreditID(),
						Amount=creditAmount,
						ReferenceNo=ActivityCreditBean.getReferenceNo(),CreatedBy=session.currentuser.id)>
                    <cfset AttendeeCreditBean = Application.Com.AttendeeCreditDAO.Create(AttendeeCreditBean)>
                </cfloop>
                
                <!--- PERSON DETAIL --->
				<cfif arguments.personId GT 0>
					<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=Arguments.PersonID)>
					<cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
					<cfset Status = "Success|#PersonBean.getFirstName()# #PersonBean.getLastName()# has been added.">
				<cfelse>
					<cfif isNumeric(AttendeeSaved)>
						<cfset Status = "Success|Attendee has been added.">
					<cfelse>
						<cfset Status = "Fail|Attendee NOT saved.">
					</cfif>
                </cfif>
				
               
				<cfset application.activity.refresh(arguments.activityId) />
				
				
				<cfset Application.History.Add(
                            HistoryStyleID=1,
                            FromPersonID=session.currentuser.id,
                            ToPersonID=Arguments.PersonID,
                            ToActivityID=Arguments.ActivityID)>
							
                <cfreturn Status />
       <cftry>
				<cfcatch type="any">
					<cfset Status = "Fail|Error: #cfcatch.message#">
					<cfreturn Status />
                    <cfabort>
				</cfcatch>
			</cftry>
		</cfif>
		
		<cfreturn Status />
	</cffunction>
    
    <cffunction name="saveAttendeeCDC" hint="Saves attendeeCDC information for provided attendee." access="public" returntype="struct">
    	<cfargument name="AttendeeID" type="numeric" required="yes">
        <cfargument name="EthnicityId" type="numeric" required="yes">
        <cfargument name="OMBEthnicityId" type="numeric" required="yes">
        <cfargument name="CBAFundID" type="string" required="yes">
        <cfargument name="CBACDC" type="string" required="yes">
        <cfargument name="CBAOth" type="string" required="yes">
        <cfargument name="CBOFundID" type="string" required="yes">
        <cfargument name="CBOCDC" type="string" required="yes">
        <cfargument name="CBOOth" type="string" required="yes">
        <cfargument name="ProfCId" type="numeric" required="yes">
        <cfargument name="ProfCOther" type="string" required="yes">
        <cfargument name="ProfNId" type="numeric" required="yes">
        <cfargument name="ProfNOther" type="string" required="yes">
        <cfargument name="FunRCId" type="numeric" required="yes">
        <cfargument name="FunRCOther" type="string" required="yes">
        <cfargument name="FunRNId" type="numeric" required="yes">
        <cfargument name="FunRNOther" type="string" required="yes">
        <cfargument name="OccClassID" type="numeric" required="yes">
        <cfargument name="OrgTypeID" type="numeric" required="yes">
        <cfargument name="OrgTypeOther" type="string" required="yes">
        <cfargument name="PrinEmpID" type="numeric" required="yes">
        <cfargument name="PrinEmpOther" type="string" required="yes">
        <cfargument name="WorkState" type="string" required="yes">
        <cfargument name="WorkZip" type="numeric" required="yes">
        <cfargument name="Focus1" type="string" required="no" default="">
        <cfargument name="Focus2" type="string" required="no" default="">
        <cfargument name="Focus3" type="string" required="no" default="">
        <cfargument name="Focus4" type="string" required="no" default="">
        <cfargument name="Focus5" type="string" required="no" default="">
        <cfargument name="Focus6" type="string" required="no" default="">
        <cfargument name="Focus7" type="string" required="no" default="">
        <cfargument name="Focus8" type="string" required="no" default="">
        <cfargument name="Focus9" type="string" required="no" default="">
        <cfargument name="Focus10" type="string" required="no" default="">
        <cfargument name="FocusOther" type="string" required="no" default="">
        <cfargument name="SpecialPop1" type="string" required="no" default="">
        <cfargument name="SpecialPop2" type="string" required="no" default="">
        <cfargument name="SpecialPop3" type="string" required="no" default="">
        <cfargument name="SpecialPop4" type="string" required="no" default="">
        <cfargument name="SpecialPop5" type="string" required="no" default="">
        <cfargument name="SpecialPop6" type="string" required="no" default="">
        <cfargument name="SpecialPop7" type="string" required="no" default="">
        <cfargument name="SpecialPop8" type="string" required="no" default="">
        <cfargument name="SpecialPop9" type="string" required="no" default="">
        <cfargument name="SpecialPop10" type="string" required="no" default="">
        <cfargument name="SpecialPop11" type="string" required="no" default="">
        <cfargument name="SpecialPop12" type="string" required="no" default="">
        <cfargument name="SpecialPop13" type="string" required="no" default="">
        <cfargument name="SpecialPop14" type="string" required="no" default="">
        <cfargument name="SpecialPop15" type="string" required="no" default="">
        <cfargument name="SpecialPop16" type="string" required="no" default="">
        <cfargument name="SpecialPop17" type="string" required="no" default="">
        <cfargument name="SpecialPop18" type="string" required="no" default="">
        <cfargument name="SpecialPopOther" type="string" required="no" default="">
        <cfargument name="MarketID" type="string" required="yes">
        <cfargument name="MarketOther" type="string" required="yes">
        <cfargument name="ContactUpdates" type="string" required="yes">
        <cfargument name="ContactEval" type="string" required="yes">
        <cfargument name="PTCAlert" type="string" required="yes">
        <cfargument name="CurrentlyEnrolled" type="string" required="yes">
        
        <cfset var CDCBean = CreateObject("component","#Application.Settings.Com#Attendee.AttendeeCDC").init(AttendeeID=arguments.AttendeeID)>
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot PIF information due to unknown reasons.")>
        
		<cfif Application.Com.AttendeeCDCDAO.exists(CDCBean)>
        	<cfset CDCBean = Application.Com.AttendeeCDCDAO.read(CDCBean)>
        </cfif>
        
		<cfset CDCBean.setCBAFundID(arguments.CBAFundID)>
        <cfset CDCBean.setCBACDC(arguments.CBACDC)>
        <cfset CDCBean.setCBAOth(arguments.CBAOth)>
        
        <cfset CDCBean.setCBOFundID(arguments.CBOFundID)>
        <cfset CDCBean.setCBOCDC(arguments.CBOCDC)>
        <cfset CDCBean.setCBOOth(arguments.CBOOth)>
        
        <cfset CDCBean.setProfCId(arguments.ProfCId)>
        <cfset CDCBean.setProfCSp(arguments.ProfCOther)>
        <cfset CDCBean.setProfNId(arguments.ProfNId)>
        <cfset CDCBean.setProfNSp(arguments.ProfNOther)>
        
        <cfset CDCBean.setFunRCId(arguments.FunRCId)>
        <cfset CDCBean.setFunRCSp(arguments.FunRCOther)>
        <cfset CDCBean.setFunRNId(arguments.FunRNId)>
        <cfset CDCBean.setFunRNSp(arguments.FunRNOther)>
        
        <cfset CDCBean.setOccClassID(arguments.OccClassID)>
        <cfset CDCBean.setOrgTypeID(arguments.OrgTypeID)>
        <cfset CDCBean.setTspecify(arguments.OrgTypeOther)>
        
        <cfset CDCBean.setPrinEmpID(arguments.PrinEmpID)>
        <cfset CDCBean.setPrinEmpSp(arguments.PrinEmpOther)>
        
        <cfset CDCBean.setWorkState(arguments.WorkState)>
        <cfset CDCBean.setWorkZip(arguments.WorkZip)>
        
        <cfset CDCBean.setFocSTD(arguments.Focus1)>
        <cfset CDCBean.setFocHIV(arguments.Focus2)>
        <cfset CDCBean.setFocWRH(arguments.Focus3)>
        <cfset CDCBean.setFocGen(arguments.Focus4)>
        <cfset CDCBean.setFocAdol(arguments.Focus5)>
        <cfset CDCBean.setFocMH(arguments.Focus6)>
        <cfset CDCBean.setFocSub(arguments.Focus7)>
        <cfset CDCBean.setFocEm(arguments.Focus8)>
        <cfset CDCBean.setFocCor(arguments.Focus9)>
        <cfset CDCBean.setFocOth(arguments.Focus10)>
        <cfset CDCBean.setFocSpec(arguments.FocusOther)>
        
        <cfset CDCBean.setPopGen(arguments.SpecialPop1)>
        <cfset CDCBean.setPopAdol(arguments.SpecialPop2)>
        <cfset CDCBean.setPopGLB(arguments.SpecialPop3)>
        <cfset CDCBean.setPopTran(arguments.SpecialPop4)>
        <cfset CDCBean.setPopHome(arguments.SpecialPop5)>
        <cfset CDCBean.setPopCorr(arguments.SpecialPop6)>
        <cfset CDCBean.setPopPreg(arguments.SpecialPop7)>
        <cfset CDCBean.setPopSW(arguments.SpecialPop8)>
        <cfset CDCBean.setPopAA(arguments.SpecialPop9)>
        <cfset CDCBean.setPopAs(arguments.SpecialPop10)>
        <cfset CDCBean.setPopNH(arguments.SpecialPop11)>
        <cfset CDCBean.setPopAIAN(arguments.SpecialPop12)>
        <cfset CDCBean.setPopHisp(arguments.SpecialPop13)>
        <cfset CDCBean.setPopImm(arguments.SpecialPop14)>
        <cfset CDCBean.setPopSub(arguments.SpecialPop15)>
        <cfset CDCBean.setPopIDU(arguments.SpecialPop16)>
        <cfset CDCBean.setPopHIV(arguments.SpecialPop17)>
        <cfset CDCBean.setPopOth(arguments.SpecialPop18)>
        <cfset CDCBean.setPopSpec(arguments.SpecialPopOther)>
        
        <cfset CDCBean.setMarketId(arguments.MarketID)>
        <cfset CDCBean.setMspecify(arguments.MarketOther)>
        <cfset CDCBean.setUpdates(arguments.ContactUpdates)>
        <cfset CDCBean.setEval(arguments.ContactEval)>
        <cfset CDCBean.setTrainingAlert(arguments.PTCAlert)>
        <cfset CDCBean.setCurrentlyEnrolled(arguments.CurrentlyEnrolled)>
        <cfset CDCBean.setRelevantTraining(arguments.PTCTraining)>
        <cfset CDCBean.setMotivationTraining(arguments.PrimaryMotivation)>
            
        <!--- Set who updated the info --->
        <cfif NOT Application.Com.AttendeeCDCDAO.exists(CDCBean)>
            <cfset CDCBean.setCreatedBy(session.currentuser.id)>
        <cfelse>
            <cfset CDCBean.setUpdatedBy(session.currentuser.id)>
        </cfif>
        
        <cfset aErrors = CDCBean.validate()>
		
		<cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
        	<cfset status.addError(aErrors[i].Field,aErrors[i].Message)>
		</cfloop>
        
        <!--- Submits the Bean for data saving --->
        <cfset cdcSaved = Application.Com.AttendeeCDCDAO.Save(CDCBean)>
        
        <!--- UPDATE ETHNICITY INFO --->
        <cfquery name="qGetAttendeeInfo" datasource="#application.settings.dsn#">
        	SELECT PersonID
            FROM ce_Attendee
            WHERE attendeeId = <cfqueryparam value="#arguments.AttendeeID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfif qGetAttendeeInfo.recordCount GT 0>
            <cfquery name="qUpdateEthnicityInfo" datasource="#application.settings.dsn#">
                UPDATE 
                	ce_person
                SET 
                	ethnicityId = <cfqueryparam value="#arguments.ethnicityId#" cfsqltype="cf_sql_integer" />,
                	ombEthnicityId = <cfqueryparam value="#arguments.ombEthnicityid#" cfsqltype="cf_sql_integer" />
                WHERE
                	personId = <cfqueryparam value="#qGetAttendeeInfo.personId#" cfsqltype="cf_sql_integer" />
            </cfquery>
        </cfif>
        
        <cfif isNumeric(cdcSaved) OR cdcSaved>
        	<!--- CHECK IF THE PERSON HAS ANY MISSING PIF RECORDS --->
        	<cfquery name="qGetOldActivities" datasource="#application.settings.dsn#">
            	SELECT 
                	ACT.ActivityID, ATT.AttendeeID
                FROM
                	ce_Activity AS ACT
                INNER JOIN
                	ce_Activity_Category AS AC ON AC.ActivityId = ACT.ActivityId
                INNER JOIN
                	ce_Attendee AS ATT ON ATT.ActivityId = ACT.ActivityId
                WHERE 
                	ATT.AttendeeId <> <cfqueryparam value="#arguments.AttendeeId#" cfsqltype="cf_sql_integer" /> AND
                	ATT.PersonId = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" /> AND
                    AC.CategoryId IN (31,162,196) AND
                    ACT.StatusId IN (1,2,3) AND
                    (SELECT COUNT(ACDC.AttendeeCDCId)
                     FROM ce_AttendeeCDC AS ACDC
                     WHERE ACDC.AttendeeID = ATT.AttendeeId) = 0
            </cfquery>
            
            <cfset PIFCount = 0>
            
            <cfif qGetOldActivities.recordCount GT 0>
                
            	<cfloop query="qGetOldActivities">
					<cfset cdcBean.setAttendeeId(qGetOldActivities.attendeeId)>
                    
                    <cfset cdcSaved = Application.Com.AttendeeCDCDAO.Save(CDCBean)>
					
                    <cfif isNumeric(cdcSaved) OR cdcSaved>
                    	<cfset PIFCount++>
                    </cfif>
                </cfloop>
            
            </cfif>
            
			<cfset aPifInfo = [{ TotalUpdatedPIFs = PIFCount }] />
            <cfset status.setData(aPifInfo)>
            
        	<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("PIF Information has been saved successfully")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="saveAttendeeDate" hint="Saves date info for attendee to provided attendee db field." access="Public">
    	<cfargument name="AttendeeID" type="numeric" required="yes">
        <cfargument name="DateValue" type="string" required="yes">
        <cfargument name="Type" type="numeric" required="yes">
        
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save date information for unknown reasons.")>
        
        <cfswitch expression="#Arguments.Type#">
        	<cfcase value="1">
            	<cfquery name="UpdateAttendee" datasource="#Application.Settings.DSN#">
                	UPDATE ce_Attendee
                    SET CompleteDate = <cfqueryparam value="#Arguments.DateValue#" cfsqltype="cf_sql_timestamp" />
                    WHERE AttendeeID = <cfqueryparam value="#arguments.attendeeId#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
                </cfquery>
            </cfcase>
        	<cfcase value="2">
            	<cfquery name="UpdateAttendee" datasource="#Application.Settings.DSN#">
                	UPDATE ce_Attendee
                    SET RegisterDate = <cfqueryparam value="#Arguments.DateValue#" cfsqltype="cf_sql_timestamp" />
                    WHERE AttendeeID = <cfqueryparam value="#arguments.attendeeId#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
                </cfquery>
            </cfcase>
        	<cfcase value="3">
            	<cfquery name="UpdateAttendee" datasource="#Application.Settings.DSN#">
                	UPDATE ce_Attendee
                    SET RegisterDate = <cfqueryparam value="#Arguments.DateValue#" cfsqltype="cf_sql_timestamp" />
                    WHERE AttendeeID = <cfqueryparam value="#arguments.attendeeId#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
                </cfquery>
            </cfcase>
        	<cfcase value="4">
            	<cfquery name="UpdateAttendee" datasource="#Application.Settings.DSN#">
                	UPDATE ce_Attendee
                    SET TermDate = <cfqueryparam value="#Arguments.DateValue#" cfsqltype="cf_sql_timestamp" />
                    WHERE AttendeeID = <cfqueryparam value="#arguments.attendeeId#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
                </cfquery>
            </cfcase>
            <cfdefaultcase>
                <cfset status.setStatusMsg("You must provide valid information to perform this action.")>
                <cfreturn status />
                <cfabort>
            </cfdefaultcase>
        </cfswitch>
                
		<cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Status date has been updated.")>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="sendCertificate" hint="Sends a copy of the attendee's certificate." access="public" output="false" returntype="struct">
        <cfargument name="activityId" type="numeric" required="yes">
    	<cfargument name="personId" type="numeric" required="yes">
        <cfargument name="creditid" type="numeric" required="no" default="1">
        
        <cfset var status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Email could not be sent due to unknown reasons.")>
        
        <cfif arguments.activityId EQ 0>
        	<cfset status.addError("activityId","Activity Information is required.")>
        </cfif>
        
        <cfif arguments.personId EQ 0>
        	<cfset status.addError("personId","Person Information is required.")>
        </cfif>
        
        <cfif len(trim(arguments.creditid)) EQ 0>
        	<cfset status.addError("creditid","Credit Information is required.")>
        </cfif>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
        	<cftry>
				<cfset application.email.send(EmailStyleID=5,ToActivityID=arguments.activityId,ToPersonID=arguments.personId,ToCreditID=arguments.creditId,fromEmail=session.currentuser.Email) />
                
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Email has been sent.")>
                
                <cfcatch type="any">
                	<cfset status.addError("General", "Error: " & cfcatch.Message)>
                </cfcatch>
            </cftry>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
	<cffunction name="setAttendeeCredit" hint="LMS Function" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="AttendeeID" type="string" required="true" />
		<cfargument name="PersonID" type="string" required="true" />
        
        <cfset var Status = "">
        
        <!--- CREATE ATTENDEECREDIT BEAN --->
        <cfset AttendeeCreditBean = CreateObject("component","#Application.Settings.Com#AttendeeCredit.AttendeeCredit").Init(AttendeeID=Arguments.AttendeeID)>
        <cfset AttendeeCreditExists = Application.Com.AttendeeCreditDAO.Exists(AttendeeCreditBean)>
        
        <cfif NOT AttendeeCreditExists>
			<!--- FIND OUT WHAT TYPE OF CREDIT TO APPLY TO THE ATTENDEE --->
            <cfset AttendeeCreditType = CreateObject("component","#Application.Settings.Com#CertificateData").getCertificateType(ActivityID=Arguments.ActivityID,PersonID=Arguments.PersonID)>
            
            <cfswitch expression="#AttendeeCreditType#">
                <cfcase value="CME">
                    <!--- GET ACTIVITY CREDIT RECORD FOR CME CREDIT --->
                    <cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=Arguments.ActivityID,CreditName="CME",DeletedFlag="N")>
                </cfcase>
                <cfcase value="CNE">
                    <!--- GET ACTIVITY CREDIT RECORD FOR CNE CREDIT --->
                    <cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=Arguments.ActivityID,CreditName="CNE",DeletedFlag="N")>
                </cfcase>
            </cfswitch>
            
			<cfif isDefined("qActivityCredits")>
                <!--- FILL AttendeeCreditBean --->
                <cfset AttendeeCreditBean.setCreditID(qActivityCredits.CreditID)>
                <cfset AttendeeCreditBean.setAmount(qActivityCredits.Amount)>
                <cfset AttendeeCreditBean.setReferenceNo(qActivityCredits.ReferenceNo)>
                <cfset AttendeeCreditBean.setCreatedBy(Arguments.PersonID)>
                <cfset AttendeeCreditBean = Application.Com.AttendeeCreditDAO.Save(AttendeeCreditBean)>
                
                <cfset Status = AttendeeCreditBean>
            <cfelse>
            	<cfset Status = "No Credit Applied.">
        	</cfif>
        </cfif>
        
        <cfreturn Status />
	</cffunction>
    
    <cffunction name="updateMDStatus" access="Public" output="true" returntype="struct">
		<cfargument name="attendeeId" required="true" type="string">
		<cfargument name="MDNonMD" required="true" type="string">
		
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
		
		<!--- Check to make sure the Argument var is not blank --->
		<cfif Arguments.attendeeId EQ "" OR MDNonMD EQ "">
			<cfset status.setStatus(false)>
            <cfset status.setStatusMsg("More information is required to adjust this setting.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
		<!--- UPDATE ATTENDEE RECORD --->
        <cfset attendeeBean = createObject("component","#application.settings.com#attendee.attendee").init(attendeeId=arguments.attendeeId)>
        <cfset attendeeBean = application.com.attendeeDAO.Read(attendeeBean)>
        <cfset attendeeBean.setMDFlag(Arguments.MDNonMD)>
        <cfset attendeeSaved = application.com.attendeeDAO.update(attendeeBean)>
        
        <!--- ACTIVITY DETAIL --->
        <cfset activityBean = createObject("component","#application.settings.com#activity.activity").init(activityId=attendeeBean.getActivityId())>
        <cfset activityBean = application.com.activityDAO.read(activityBean)>
                
        <!--- Check if activity is a Parent Activity --->
        <cfif activityBean.getParentActivityID() NEQ "">
            <!--- Update ParentActivity StatAttendees --->
            <cfset parentActivityBean = createObject("component","#application.settings.com#activity.activity").init(activityID=activityBean.getParentActivityId())>
            <cfset parentActivityBean = application.com.activityDAO.read(ParentActivityBean)>
            
            <cfif MDNonMD EQ "Y">
                <cfset parentActivityBean.setStatMD(parentActivityBean.getStatMD()+1)>
                <cfset parentActivityBean.setStatNonMD(parentActivityBean.getStatNonMD()-1)>
            <cfelse>
                <cfset parentActivityBean.setStatMD(parentActivityBean.getStatMD()-1)>
                <cfset parentActivityBean.setStatNonMD(parentActivityBean.getStatNonMD()+1)>
            </cfif>
            
            <cfset parentActivityBean = application.com.activityDAO.update(ParentActivityBean)>
        </cfif>
        
        <!--- ACTIVITY STATS --->
        <cfif MDNonMD EQ "Y">
            <cfset activityBean.setStatMD(activityBean.getStatMD()+1)>
            <cfset activityBean.setStatNonMD(activityBean.getStatNonMD()-1)>
        <cfelse>
            <cfset activityBean.setStatMD(activityBean.getStatMD()-1)>
            <cfset activityBean.setStatNonMD(activityBean.getStatNonMD()+1)>
        </cfif>
        
        <cfset application.com.activityDAO.update(activityBean)>
        
        <!--- PERSON DETAIL --->
        <cfset personBean = createObject("component","#application.settings.com#person.person").init(personId=attendeeBean.getPersonId())>
        <cfset personBean = application.com.personDAO.read(personBean)>
        
        <cfset application.history.add(
                    historyStyleID=69,
                    fromPersonID=session.currentuser.id,
                    toPersonID=attendeeBean.getPersonId(),
                    toActivityID=attendeeBean.getActivityId())>
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("MD status for " & personBean.getFirstName() & " " & personBean.getLastName() & " has been updated.")>
        
        <cfset application.activity.refresh(attendeebean.getActivityId()) />
		
		<cfreturn status />
	</cffunction>

	<cffunction name="updateStatuses" access="Public" output="true" returntype="struct">
		<cfargument name="AttendeeList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="StatusID" required="true" type="string">
		<cfargument name="completeDate" required="false" type="string" default="">
		<cfargument name="sendEmail" required="false" type="string" default="1">
        
        <cfset var status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
		
		<cfset status.setStatus(false)>
        
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.AttendeeList EQ "" OR Arguments.ActivityID EQ "" OR StatusID EQ "">
	       	<cfset status.setStatusMsg("More information is required to update the registrant status.")>
		</cfif>
		
		<cfif len(Status.getStatusMsg()) EQ 0>
				<cfset ChangeCount = 0>
                
				<!--- ACTIVITY DETAIL --->
				<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
				<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                
                <cfset personList = "">
                
				<cfloop list="#Arguments.AttendeeList#" index="AttendeeId">
                	<!--- GET ATTENDEE STATUS --->
                    <cfquery name="AttendeeInfo" datasource="#Application.Settings.DSN#">
                    	SELECT AttendeeID,StatusID,personId
                        FROM ce_Attendee
						WHERE 
                        	attendeeId = <cfqueryparam value="#AttendeeId#" cfsqltype="cf_sql_integer" />
                    </cfquery>
                    
                    <!--- UPDATE PERSONLIST --->
                    <cfset personList = listAppend(personList, attendeeInfo.personId,",")>
                    
					<!--- Delete each record --->
					<cfquery name="qUpdateStatus" datasource="#Application.Settings.DSN#" result="qUpdatedStatuses">
						UPDATE ce_Attendee
						SET StatusID = <cfif Arguments.StatusID NEQ 0><cfqueryparam value="#Arguments.StatusID#" cfsqltype="cf_sql_integer" /><cfelse><cfqueryparam null="true" cfsqltype="cf_sql_integer" /></cfif>
                        <cfswitch expression="#Arguments.StatusID#">
                        	<cfcase value="1">
							<cfif structKeyExists(arguments,'completeDate') AND isDate(arguments.completeDate)>
								,CompleteDate = <cfqueryparam value="#arguments.completeDate#" cfsqltype="cf_sql_timestamp" />
							<cfelseif ActivityBean.getActivityTypeID() NEQ 2>
                                ,CompleteDate = <cfqueryparam value="#ActivityBean.getEndDate()#" cfsqltype="cf_sql_timestamp" />
                            <cfelse>
                                ,CompleteDate = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp" />
                            </cfif>
                            ,TermDate = NULL
                            </cfcase>
                            <cfcase value="3">
                            ,CompleteDate = NULL
                            ,TermDate = NULL
                            ,RegisterDate = <cfqueryparam value="#Now()#" cfsqltype="cf_sql_timestamp" />
                            </cfcase>
                            <cfcase value="4">
                            ,CompleteDate = NULL
                            ,TermDate = <cfqueryparam value="#Now()#" cfsqltype="cf_sql_timestamp" />
                            </cfcase>
                        </cfswitch>
						WHERE attendeeId = <cfqueryparam value="#attendeeId#" cfsqltype="cf_sql_integer" />
					</cfquery>
                    
					<cfif arguments.statusId EQ 1>
						<cfif arguments.StatusID EQ 1>
							<cftry>
								<cfif arguments.sendEmail>
								<cfset application.email.send(EmailStyleID=5,ToAttendeeID=AttendeeInfo.AttendeeID,ToActivityID=arguments.activityId,ToPersonID=PersonID,ToCreditID=1) />
								</cfif>
								<cfcatch type="any">
								
								</cfcatch>
							</cftry>
						</cfif>
					</cfif>
					
					<!--- Count the total records being deleted --->
					<cfset ChangeCount++>
					
					<!--- PERSON DETAIL --->
					<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=attendeeInfo.PersonID)>
					<cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
            	</cfloop>
                
				<cfset createObject("component", "admin._com.scripts.statFixer").run(activityId=arguments.activityId,mode='manual')>
                
                <cfset OutputVar = "">
                <cfswitch expression="#Arguments.StatusID#">
                    <cfcase value="1">
                        <cfset OutputVar = "<strong>Status:</strong> Complete"> 
                    </cfcase>
                    <cfcase value="2">
                        <cfset OutputVar = "<strong>Status:</strong> In Progress">
                    </cfcase>
                    <cfcase value="3">
                        <cfset OutputVar = "<strong>Status:</strong> Pending">
                    </cfcase>
                    <cfcase value="4">
                        <cfset OutputVar = "<strong>Status:</strong> Registered">
                    </cfcase>
                    <cfcase value="5">
                        <cfset OutputVar = "<strong>Status:</strong> Terminated">
                    </cfcase>
                </cfswitch>
				
				<!--- ACTIVITY ACTION UPDATER --->
				<cfif ChangeCount EQ 1>
                	<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("1 status has been changed.")>
				
					<cfset Application.History.Add(
                                HistoryStyleID=28,
                                FromPersonID=session.currentuser.id,
                                ToPersonID=PersonList,
                                ToActivityID=Arguments.ActivityID,
								ToContent=OutputVar)>
					
					
				<cfelse>
                	<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("#ChangeCount# statuses have been changed.")>
                    
                    <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
                    	SELECT DisplayName
                        FROM ce_Person
                        WHERE PersonID IN (#PersonList#)
                    </cfquery>
                    
                    <cfset NameList = "">
                    <cfloop query="PersonInfo">
                    	<cfset NameList = ListAppend(NameList,Trim(PersonInfo.DisplayName),", ")>
                    </cfloop>
                    
                    <cfset OutputVar = OutputVar & "<br /><strong>Attendees:</strong> " & NameList>
				
					<cfset Application.History.Add(
                                HistoryStyleID=30,
                                FromPersonID=session.currentuser.id,
                                ToActivityID=Arguments.ActivityID,
								ToContent=OutputVar)>
				</cfif>
				
				<cfset application.activity.refresh(arguments.activityId) />
				
			<cftry>
				<cfcatch type="any">
                    <cfset status.setStatusMsg("Error: #cfcatch.message#")>
				</cfcatch>
			</cftry>
		</cfif>
		
		<cfreturn status />
	</cffunction>
</cfcomponent>