<cfcomponent>
	<cffunction name="fixAttendees" hint="Used to fix activity dates for attendees." access="remote">
    	<cfquery name="qAttendees" datasource="#application.settings.dsn#">
        	SELECT *
            FROM
            	ce_attendee
            WHERE
            	PersonID = 0 AND registerDate IS NULL
            ORDER BY
            	activityId
        </cfquery>
        
       	<cfset attendeeBean = createObject("component","_com.attendee.attendee").init()>
		<cfset activityBean = createObject("component","_com.activity.activity").init()>
        <cfloop query="qAttendees">
        	<cfif activityBean.getActivityId() NEQ qAttendees.activityId>
            	<cfset activityBean.setActivityId(qAttendees.activityId)>
            	<cfset activityBean = application.com.activityDAO.read(activityBean)>
            </cfif>
            
        	<cfset attendeeBean.setAttendeeID(qAttendees.attendeeId)>
            <cfset attendeeBean = application.com.attendeeDAO.read(attendeeBean)>
            
            <cfif len(attendeeBean.getRegisterDate()) EQ 0>
	            <cfset attendeeBean.setRegisterDate(activityBean.getEndDate())>
            </cfif>
            
            <cfif len(attendeeBean.getCompleteDate()) EQ 0>
	            <cfset attendeeBean.setCompleteDate(activityBean.getEndDate())>
            </cfif>
            
            <cfset attendeeSaved = application.com.attendeeDAO.save(attendeeBean)>
        </cfloop>
    </cffunction>
    
	<cffunction name="updateAttendeeDates" access="remote">
    	<cfquery name="qGetAttendees" datasource="#application.settings.dsn#">
        	SELECT AttendeeId, CheckIn
            FROM ce_attendee
            WHERE RegisterDate IS NULL
        </cfquery>
        
        <cfdump var="#qGetAttendees#"><cfabort>
    </cffunction>
    
	<cffunction name="approveComment" access="Remote" returntype="string">
		<cfargument name="CommentID" type="string" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access comment approval functionality.")>
        
        <cfset status = Application.ActivityPublish.approveComment(Arguments.CommentID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="approveFacultyFile" access="Remote" output="false" returntype="String">
		<cfargument name="PersonID" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
        <cfargument name="FileType" required="true" type="string">
        <cfargument name="Mode" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access file approval functionality for activity faculty.")>
        
        <cfset status = Application.ActivityPeople.approveFacultyFile(Arguments.PersonID,Arguments.ActivityID,Arguments.FileType,Arguments.Mode)>
        
        <cfreturn status.getJSON() />
    </cffunction>
        
	<cffunction name="AutoComplete" access="Remote" output="no" returntype="string">
		<cfargument name="q" type="string" required="yes">
		<cfargument name="limit" type="string" required="yes">
        
        <cfset var Status = Application.Activity.AutoComplete(Arguments.Q,Arguments.Limit)>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="changeCommitteeRoles" access="Remote" output="false" returntype="string">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="RoleID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access role changing functionality for committee members.")>
        
        <cfset status = Application.ActivityPeople.changeCommitteeRoles(Arguments.PersonList,Arguments.ActivityID,Arguments.RoleID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="changeFacultyRoles" access="Remote" output="false" returntype="string">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="RoleID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access role changing functionality for faculty.")>
      	
        <cfset status = Application.ActivityPeople.changeFacultyRoles(Arguments.PersonList,Arguments.ActivityID,Arguments.RoleID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="CopyPaste" displayname="Copy and Paste Activity" access="Remote" output="no" returntype="string">
		<cfargument name="Mode" type="numeric" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="NewActivityTitle" type="string" required="yes">
        <cfargument name="NewActivityTypeID" type="numeric" required="yes">
        <cfargument name="NewGroupingID" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access activity copy functionality.")>
        
        <cfset Status = Application.Activity.CopyPaste(
							Arguments.Mode,
							Arguments.ActivityID,
							Arguments.NewActivityTitle,
							Arguments.NewActivityTypeID,
							Arguments.NewGroupingID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="createCategory" access="Remote" output="false" returntype="string">
		<cfargument name="Name" required="yes" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access category create functionality for activities.")>
        
        <cfset status = Application.Activity.createCategory(Arguments.Name)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteActivity" access="remote" output="false" returntype="string">
		<cfargument name="ActivityID" type="numeric" required="true">
        <cfargument name="Reason" type="string" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access delete function for activities.")>
        
        <cfset status = Application.Activity.deleteActivity(Arguments.ActivityID,Arguments.Reason)>
    
    	<cfreturn status.getJSON() />
    </cffunction>
	
	<cffunction name="deleteAgendaItem" access="Remote" output="false" returntype="string">
		<cfargument name="AgendaID" required="yes" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access agenda delete functionality.")>
        
        <cfset status = Application.Activity.deleteAgendaItem(Arguments.AgendaID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteBudget" access="Remote" output="false" returntype="string">
	<cfargument name="ActivityID" type="numeric" required="true">
	<cfargument name="BudgetID" type="numeric" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access budget delete functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.deleteBudget(Arguments.ActivityID,Arguments.BudgetID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteCategory" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="true" type="numeric">
		<cfargument name="CategoryID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access category delete functionality for activities.")>
        
        <cfset Status = Application.Activity.deleteCategory(Arguments.ActivityID,Arguments.CategoryID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="denyComment" access="Remote" returntype="string">
		<cfargument name="CommentID" type="string" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access comment denial functionality.")>
        
        <cfset status = Application.ActivityPublish.denyComment(Arguments.CommentID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteFee" access="Remote" output="false" returntype="string">
        <cfargument name="ActivityID" type="String" required="true">
        <cfargument name="FeeID" type="String" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access fee delete functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.deleteFee(Arguments.ActivityID,Arguments.FeeID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteLedger" access="remote" output="false" returntype="string">
	<cfargument name="ActivityID" type="String" required="true">
	<cfargument name="EntryID" type="String" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access ledger delete functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.deleteLedger(Arguments.ActivityID,Arguments.EntryID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteNote" access="Remote" output="false" returntype="string">
		<cfargument name="NoteID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access note delete functionality for activities.")>
        
        <cfset status = Application.Activity.deleteNote(Arguments.NoteID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteSupport" access="remote" output="false" returntype="string">
        <cfargument name="ActivityID" type="String" required="true">
        <cfargument name="SupportID" type="String" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access support delete functionality for activity finances.")>
        
        <cfset Status = Application.ActivityFinance.deleteSupport(Arguments.ActivityID,Arguments.SupportID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="emailCertificate" access="remote" output="false" returntype="string" returnFormat="plain">
        <cfargument name="activityId" type="numeric" required="yes">
    	<cfargument name="personId" type="numeric" required="yes">
        <cfargument name="subject" type="string" required="yes">
        <cfargument name="body" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access email certificate functionality.")>
        
        <Cfset status = application.activity.emailCertificate(
															activityId=arguments.activityId,
															personId=arguments.personId,
															subject=arguments.subject,
															body=arguments.body)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="fixStats" output="no" access="Remote" returntype="string" returnformat="plain">
		<cfargument name="RunDate" type="string" required="no" default="#DateFormat(DateAdd('d',-100,now()),'mm/dd/yyyy')#" />
		<cfargument name="ActivityID" type="numeric" required="no" default="0" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access statistics update functionality for activities.")>
        
		<!--- UPDATE STATS --->
        <cfset createObject("component", "admin._com.scripts.statFixer").run(activityId=arguments.activityId,mode='manual')>
                    
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Stats have been updated.")>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="getActivitySpecialties" access="remote" output="false" returntype="string">
    	<cfargument name="activityId" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Specialties okay.")>
        
        <cfset status.setData(application.activity.getActivitySpecialties(activityId=arguments.activityId))>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="getAttendeeDate" hint="Returns requested date information for provided attendee." access="Remote" output="false" returntype="string">
    	<cfargument name="attendeeId" type="numeric" required="no" default="0">
    	<cfargument name="PersonID" type="numeric" required="no" default="0">
        <cfargument name="ActivityID" type="numeric" required="no" default="0">
        <cfargument name="Type" type="numeric" required="yes">
        
        <cfset var Status = "">
        
        <cfset Status = Application.ActivityAttendee.getAttendeeDate(arguments.attendeeId,Arguments.PersonID,Arguments.ActivityID,Arguments.Type)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="getGroupings" hint="Returns JSON data for groupings." access="Remote" output="false" returntype="string">
    	<cfargument name="ATID" type="numeric" required="yes">
        
        <cfset Status = Application.Activity.getGroupings(Arguments.ATID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="getNoteCount" hint="Returns the total number of notes for provided activity." access="Remote" output="false" returntype="numeric">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        
        <cfset Status = Application.Activity.getNoteCount(Arguments.ActivityID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="getSpecialties" access="remote" output="false" returntype="string">
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Specialties okay.")>
        
        <cfset status.setData(application.activityPublish.getSpecialties())>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="JointlyAutoComplete" access="Remote" output="no" returntype="string">
		<cfargument name="q" type="string" required="yes">
		<cfargument name="limit" type="string" required="yes">
        
        <cfset var Status = Application.Activity.JointlyAutoComplete(Arguments.Q,Arguments.Limit)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="markComplete" access="Remote" output="false" returntype="string">
		<cfargument name="PersonID" type="string" required="yes">
        <cfargument name="ActivityID" type="string" required="yes">
        
        <cfset var Status = "false|Cannot access functionality to mark activity complete.">
		
		<cfset Status = Application.ActivityAttendee.markComplete(Arguments.PersonID,Arguments.ActivityID)>
     	
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="Move" displayname="Move Activity" access="Remote" output="no">
		<cfargument name="FromActivityID" type="numeric" required="yes">
		<cfargument name="ToActivityID" type="numeric" required="yes">
        
        <cfset Application.Activity.Move(Arguments.FromActivityID,Arguments.ToActivityID)>
        
    </cffunction>
	
    <cffunction name="publishActivity" hint="Publishes Activity to the web" access="Remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="string" required="true" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access publish function for activities.")>
        
        <cfset status = Application.ActivityPublish.publishActivity(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="publishActivityToSite" hint="Either Adds or Deletes a record for the Site Publishing" access="Remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="SiteID" type="string" required="true" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access publish function for activities.")>
        
        <cfset status = Application.ActivityPublish.publishActivityToSite(Arguments.ActivityID,Arguments.SiteID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="publishFile" hint="Adds a publishing component for current file as a file download." access="Remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="FileID" type="numeric" required="yes">
        <cfargument name="FileName" type="string" required="yes">
        <cfargument name="ComponentID" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot publish function for activity documents.")>
        
        <cfset status = Application.ActivityPublish.publishFile(Arguments.ActivityID,Arguments.FileID,Arguments.FileName,Arguments.ComponentID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeAllAttendees" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cfset status = Application.ActivityAttendee.removeAll(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeAllCommittee" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for committee members.")>
		
		<cfset status = Application.ActivityPeople.removeAllCommittee(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeAllFaculty" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for faculty.")>
		
		<cfset status = Application.ActivityPeople.removeAllFaculty(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
	
	<cffunction name="removeAttendeeByID" access="Remote" output="false" returntype="string" returnformat="plain">
		<cfargument name="attendeeId" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cftry>
			<cfquery name="qDeleteByID" datasource="#application.settings.dsn#">
				DELETE ce_attendee
				WHERE attendeeid=<cfqueryparam value="#arguments.attendeeId#" cfsqltype="cf_sql_integer" />
			</cfquery>
			
			<cfcatch>
			
			</cfcatch>
		</cftry>
        
		<cfset status.setStatus(true) />
		<cfset status.setStatusMsg('successful') />
		
        <cfreturn status.getJSON() />
    </cffunction>
	
	<cffunction name="removeCheckedAttendees" access="Remote" output="false" returntype="string">
		<cfargument name="AttendeeList" required="false" type="string" default="">
		<cfargument name="ActivityID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cfset status = Application.ActivityAttendee.removeChecked(Arguments.AttendeeList,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeCheckedCommittee" access="Remote" output="false" returntype="string">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for committee members.")>
		
		<cfset status = Application.ActivityPeople.removeCheckedCommittee(Arguments.PersonList,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeCheckedFaculty" access="Remote" output="false" returntype="string">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for faculty")>
		
		<cfset status = Application.ActivityPeople.removeCheckedFaculty(Arguments.PersonList,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="resetAttendee" access="Remote" output="false" returntype="string">
        <cfargument name="attendeeId" type="numeric" required="false" default="0">
        <cfargument name="PaymentFlag" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access attendee reset functionality.")>
        
        <cfset status = Application.ActivityAttendee.resetAttendee(arguments.attendeeId,Arguments.PaymentFlag)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="saveACCMEInfo" access="remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
		<cfargument name="competenceDesign" type="numeric" required="no" default="0">
		<cfargument name="performanceDesign" type="numeric" required="no" default="0">
		<cfargument name="outcomesDesign" type="numeric" required="no" default="0">
		<cfargument name="competenceEval" type="numeric" required="no" default="0">
		<cfargument name="performanceEval" type="numeric" required="no" default="0">
		<cfargument name="outcomesEval" type="numeric" required="no" default="0">
        
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <!---<cfcontent type="text/javascript" />--->
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save functionality for ACCME information.")>
        
        <cfset status = application.activity.saveACCMEInfo(
														activityId = arguments.activityId,
														competenceDesign = arguments.competenceDesign,
														performanceDesign = arguments.performanceDesign,
														outcomesDesign = arguments.outcomesDesign,
														competenceEval = arguments.competenceEval,
														performanceEval = arguments.performanceEval,
														outcomesEval = arguments.outcomesEval
														)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="saveActivity" access="Remote" output="no" returntype="string">
		<cfargument name="ActivityID" default="" type="string" required="yes">
		<cfargument name="Title" default="" type="string" required="yes">
		<cfargument name="StartDate" default="" type="string">
		<cfargument name="EndDate" default="" type="string">
		<cfargument name="Description" default="" type="string">
		<cfargument name="Location" default="" type="string">
		<cfargument name="Address1" default="" type="string">
		<cfargument name="Address2" default="" type="string">
		<cfargument name="City" default="" type="string">
		<cfargument name="State" default="" type="string">
		<cfargument name="Province" default="" type="string">
		<cfargument name="Country" default="" type="string">
		<cfargument name="PostalCode" default="" type="string">
		<cfargument name="Sponsorship" default="" type="string">
		<cfargument name="Sponsor" default="" type="string">
		<cfargument name="ExternalID" default="" type="string">
		<cfargument name="ReleaseDate" type="string" default="#Now()#">
		<cfargument name="ChangedFields" type="string" required="no" default="" />
		<cfargument name="ChangedValues" type="string" required="no" default="" />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access activity save functionality.")>
        
        <cfset Status = Application.Activity.saveActivity(
							activityId=Arguments.ActivityID,
							title=Arguments.Title,
							startDate=Arguments.StartDate,
							endDate=Arguments.EndDate,
							description=Arguments.Description,
							location=Arguments.Location,
							address1=Arguments.Address1,
							address2=Arguments.Address2,
							city=Arguments.City,
							state=Trim(Arguments.State),
							province=Arguments.Province,
							country=Arguments.Country,
							postalcode=Arguments.PostalCode,
							sponsorship=Arguments.Sponsorship,
							sponsor=Arguments.Sponsor,
							externalid=Arguments.ExternalID,
							releasedate=Arguments.ReleaseDate,
							changedfields=Arguments.ChangedFields,
							changedvalues=Arguments.ChangedValues)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="saveAgendaItem" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="AgendaID" required="no" type="string" default="">
		<cfargument name="Description" required="yes" type="string" default="">
		<cfargument name="EventDate" required="yes" type="string" default="">
		<cfargument name="StartTime" required="yes" type="string" default="">
		<cfargument name="EndTime" required="yes" type="string" default="">
        
        <cfset var Status = "Fail|Cannot access agenda save functionality.">
        
        <cfset Status = Application.Activity.saveAgendaItem(
							Arguments.ActivityID,
							Arguments.AgendaID,
							Arguments.Description,
							Arguments.EventDate,
							Arguments.StartTime,
							Arguments.EndTime)>
        
        <cfreturn Status />
    </cffunction>
	
    <cffunction name="saveAttendee" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="PersonID" required="yes" type="string">
		<cfargument name="MDFlag" required="no" type="string" default="N" />
        
        <cfset var Status = "Fail|Cannot access attendee save functionality.">
        
        <cfset Status = Application.ActivityAttendee.saveAttendee(Arguments.ActivityID,Arguments.PersonID,Arguments.MDFlag)>
        
        <cfreturn Status />
    </cffunction>
	
    <cffunction name="saveAttendeeCDC" access="Remote" output="false" returntype="string" returnFormat="plain">
    	<cfargument name="AttendeeID" type="numeric" required="yes">
        <cfargument name="Ethnicity" type="numeric" required="yes">
        <cfargument name="OMBEthnicity" type="numeric" required="yes">
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
        <cfargument name="OrgTypeID" type="numeric" required="no" default="">
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
        
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot PIF information due to unknown reasons.")>
        
        <cfset status = application.activityAttendee.saveAttendeeCDC(
														AttendeeId = Arguments.AttendeeID,
														EthnicityId = Arguments.Ethnicity,
														OMBEthnicityId = Arguments.OMBEthnicity,
														CBAFundID = Arguments.CBAFundID,
														CBACDC = Arguments.CBACDC,
														CBAOth = Arguments.CBAOth,
														CBOFundID = Arguments.CBOFundID,
														CBOCDC = Arguments.CBOCDC,
														CBOOth = Arguments.CBOOth,
														ProfCId = Arguments.ProfCId,
														ProfCOther = Arguments.ProfCOther,
														ProfNId = Arguments.ProfNId,
														ProfNOther = Arguments.ProfNOther,
														FunRCId = Arguments.FunRCId,
														FunRCOther = Arguments.FunRCOther,
														FunRNId = Arguments.FunRNId,
														OccClassID = Arguments.OccClassID,
														OrgTypeID = Arguments.OrgTypeID,
														FunRNOther = Arguments.FunRNOther,
														OccClassID = Arguments.OccClassID,
														OccClassID = Arguments.OccClassID,
														OrgTypeOther = Arguments.OrgTypeOther,
														PrinEmpID = Arguments.PrinEmpID,
														PrinEmpOther = Arguments.PrinEmpOther,
														WorkState = Arguments.WorkState,
														WorkZip = Arguments.WorkZip,
														Focus1 = Arguments.Focus1,
														Focus2 = Arguments.Focus2,
														Focus3 = Arguments.Focus3,
														Focus4 = Arguments.Focus4,
														Focus5 = Arguments.Focus5,
														Focus6 = Arguments.Focus6,
														Focus7 = Arguments.Focus7,
														Focus8 = Arguments.Focus8,
														Focus9 = Arguments.Focus9,
														Focus10 = Arguments.Focus10,
														FocusOther = Arguments.FocusOther,
														SpecialPop1 = Arguments.SpecialPop1,
														SpecialPop2 = Arguments.SpecialPop2,
														SpecialPop3 = Arguments.SpecialPop3,
														SpecialPop4 = Arguments.SpecialPop4,
														SpecialPop5 = Arguments.SpecialPop5,
														SpecialPop6 = Arguments.SpecialPop6,
														SpecialPop7 = Arguments.SpecialPop7,
														SpecialPop8 = Arguments.SpecialPop8,
														SpecialPop9 = Arguments.SpecialPop9,
														SpecialPop10 = Arguments.SpecialPop10,
														SpecialPop11 = Arguments.SpecialPop11,
														SpecialPop12 = Arguments.SpecialPop12,
														SpecialPop13 = Arguments.SpecialPop13,
														SpecialPop14 = Arguments.SpecialPop14,
														SpecialPop15 = Arguments.SpecialPop15,
														SpecialPop16 = Arguments.SpecialPop16,
														SpecialPop17 = Arguments.SpecialPop17,
														SpecialPop18 = Arguments.SpecialPop18,
														SpecialPopOther = Arguments.SpecialPopOther,
														MarketID = Arguments.MarketID,
														MarketOther = Arguments.MarketOther,
														ContactUpdates = Arguments.ContactUpdates,
														ContactEval = Arguments.ContactEval,
														PTCAlert = Arguments.PTCAlert,
														PTCTraining = Arguments.PTCTraining,
														CurrentlyEnrolled = Arguments.CurrentlyEnrolled,
														PrimaryMotivation = Arguments.PrimaryMotivation)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="saveAttendeeDate" hint="Saves date info for attendee to provided attendee db field." access="Remote" returntype="string">
    	<cfargument name="AttendeeID" type="numeric" required="yes">
        <cfargument name="DateValue" type="string" required="yes">
        <cfargument name="Type" type="numeric" required="yes">
        
        <cfset var Status = "Fail|Cannot access update function for attendee dates.">
        
        <cfset Status = Application.ActivityAttendee.saveAttendeeDate(Arguments.AttendeeID,Arguments.DateValue,Arguments.Type)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="saveBudget" hint="Saves provided information as a budget entry." access="remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
    	<cfargument name="BudgetID" type="numeric" required="yes">
        <cfargument name="Description" type="string" required="yes">
        <cfargument name="EntryType" type="numeric" required="yes">
        <cfargument name="Amount" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access budget save functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.saveBudget(Arguments.ActivityID,Arguments.BudgetID,Arguments.Description,Arguments.EntryType,Arguments.Amount)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="saveCategory" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="CategoryID" required="yes" type="string">
      	
        <cfset var Status = "Fail|Cannot access category save functionality for activities.">
        
        <cfset Status = Application.Activity.saveCategory(Arguments.ActivityID,Arguments.CategoryID)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveCategoriesLMS" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" default="" type="string" required="yes">
        <cfargument name="Site" default="" type="string" required="yes">
      	
        <cfset var Status = "fail">
        
        <cfset Status = Application.ActivityPublish.saveCategoriesLMS(Arguments.ActivityID,Arguments.Site)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveCommitteeMember" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="PersonID" required="yes" type="string">
      	
        <cfset var Status = "Fail|Cannot access faculty saving functionality.">
        
        <cfset Status = Application.ActivityPeople.saveCommitteeMember(Arguments.ActivityID,Arguments.PersonID)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveFacultyMember" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="PersonID" required="yes" type="string">
      	
        <cfset var Status = "Fail|Cannot access faculty saving functionality.">
        
        <cfset Status = Application.ActivityPeople.saveFacultyMember(Arguments.ActivityID,Arguments.PersonID)>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="saveFee" access="Remote" ouput="true" returntype="string">
    	<cfargument name="FeeID" required="yes" default="0">
    	<cfargument name="ActivityID" required="yes">
        <cfargument name="Name" required="yes">
        <cfargument name="StartDate" required="yes">
        <cfargument name="StartTime" required="yes">
        <cfargument name="EndDate" required="yes">
        <cfargument name="EndTime" required="yes">
        <cfargument name="Amount" required="yes">
      	
        <cfset var Status = "Fail|Cannot access fee saving functionality for activity finances.">
        
        <cfset Status = Application.ActivityFinance.saveFee(
							Arguments.FeeID,
							Arguments.ActivityID,
							Arguments.Name,
							Arguments.StartDate,
							Arguments.StartTime,
							Arguments.EndDate,
							Arguments.EndTime,
							Arguments.Amount)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="saveLedger" hint="Saves ledger information." access="Remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="EntryID" type="numeric" required="yes">
        <cfargument name="Description" type="string" required="yes">
        <cfargument name="Memo" type="string" required="yes">
        <cfargument name="EntryDate" type="date" required="yes">
        <cfargument name="EntryType" type="numeric" required="yes">
        <cfargument name="Amount" type="numeric" required="yes">
      	
        <cfset var Status = "Fail|Cannot access fee saving functionality for activity finances.">
        
        <cfset Status = Application.ActivityFinance.saveLedger(
							Arguments.ActivityID,
							Arguments.EntryID,
							Arguments.Description,
							Arguments.Memo,
							Arguments.EntryDate,
							Arguments.EntryType,
							Arguments.Amount)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="saveNote" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="NoteBody" required="true" type="string">
		<cfargument name="NoteID" required="false" default="0">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access note saving functionality for activities.")>
        
        <cfset status = Application.Activity.saveNote(Arguments.ActivityID,Arguments.NoteBody,Arguments.NoteID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="savePubGeneral" displayname="Save Form" access="Remote" output="no">
		<cfargument name="ActivityID" type="string" required="yes" />
		<cfargument name="Overview" type="string" required="no" />
		<cfargument name="Objectives" type="string" required="no" />
		<cfargument name="Keywords" type="string" required="no" />
		<cfargument name="PublishDate" type="string" required="no" />
		<cfargument name="RemoveDate" type="string" required="no" />
		<cfargument name="PaymentFlag" type="string" required="no" />
		<cfargument name="PaymentFee" type="string" required="no" />
		<cfargument name="FeaturedFlag" type="string" required="no" default="N" />
		<cfargument name="ExtHostFlag" type="string" required="no" default="N" />
		<cfargument name="ExtHostLink" type="string" required="no" default="" />
		<cfargument name="AllowCommentFlag" type="string" required="no" />
		<cfargument name="CommentApproveFlag" type="string" required="no" />
		<cfargument name="NotifyEmails" type="string" required="no" />
		<cfargument name="TermsFlag" type="string" required="no" />
		<cfargument name="TermsText" type="string" required="no" />
		<cfargument name="RestrictedFlag" type="string" required="no" />
      	
        <cfset var Status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access general publish save functionality currently.  Please contact technical support and try again later.")>
        
        <cfset status = Application.ActivityPublish.savePubGeneral(
							Arguments.ActivityID,
							Arguments.Overview,
							Arguments.Objectives,
							Arguments.Keywords,
							Arguments.PublishDate,
							Arguments.RemoveDate,
							Arguments.PaymentFlag,
							Arguments.PaymentFee,
							Arguments.FeaturedFlag,
							Arguments.ExtHostFlag,
							Arguments.ExtHostLink,
							Arguments.AllowCommentFlag,
							Arguments.CommentApproveFlag,
							Arguments.NotifyEmails,
							Arguments.TermsFlag,
							Arguments.TermsText,
							Arguments.RestrictedFlag)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="saveSpecialties" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" default="" type="string" required="yes">
        <cfargument name="Specialties" default="" type="string" required="yes">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access specialty saving functionality for activities.")>
        
        <cfset Status = Application.ActivityPublish.saveSpecialties(Arguments.ActivityID,Arguments.Specialties)>
        
        <cfreturn Status.getJSON() />
    </cffunction>
    
	<cffunction name="saveSupport" access="Remote" output="false" returntype="string">
    	<cfargument name="SupportID" required="false" default="-1" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="Supporter" required="true" type="string">
		<cfargument name="SupportType" required="true" type="string">
		<cfargument name="Amount" required="true" type="string">
		<cfargument name="ContractNum" required="false" type="string" default="">
		<cfargument name="BudgetRequested" required="false" type="string" default="">
		<cfargument name="BudgetDueDate" required="false" type="string" default="">
		<cfargument name="BudgetSentDate" required="false" type="string" default="">
		<cfargument name="SentDate" required="false" type="string" default="">
		<cfargument name="FundsReturned" required="false" type="string" default="">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the save function for activity finances.")>
        
        <cfset Status = Application.ActivityFinance.saveSupport(
							Arguments.SupportID,
							Arguments.ActivityID,
							Arguments.Supporter,
							Arguments.SupportType,
							Arguments.Amount,
							Arguments.ContractNum,
							Arguments.BudgetRequested,
							Arguments.BudgetDueDate,
							Arguments.BudgetSentDate,
							Arguments.SentDate,
							Arguments.FundsReturned)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="sendCertificate" hint="Sends a copy of the attendee's certificate to the person attached to the attendee." access="remote" output="false" returntype="string">
        <cfargument name="activityId" type="numeric" required="no" default="0">
    	<cfargument name="personId" type="numeric" required="no" default="0">
        <cfargument name="creditid" type="numeric" required="no" default="1">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the send certificate function.")>
		
        <cfset status = application.activityAttendee.sendCertificate(
							activityId=arguments.activityId,
							personId=arguments.personId,
							creditId=arguments.creditId)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="UnpublishFile" hint="Unpublishes provided file." access="Remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="FileID" type="numeric" required="yes">
        
        <cfset Status = "Fail|Cannot access the unpublish function for activity documents.">
        
        <cfset Status = Application.ActivityPublish.UnpublishFile(Arguments.ActivityID,Arguments.FileID)>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="updateActivityStatus" access="Remote" output="no" displayname="Set Activity Status">
		<cfargument name="ActivityID" type="numeric" required="yes" />
		<cfargument name="StatusID" type="numeric" required="yes" />
        
        <cfset Status = "Fail">
        
        <cfset Status = Application.Activity.updateStatus(Arguments.ActivityID,Arguments.StatusID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="updateAddlAttendees" access="Remote" output="false" returntype="any">
    	<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="AddlAttendees" type="string" required="true" />
        
        <cfset var Status = "Fail|Cannot access the update function for additional attendees.">
        
        <cfset Status = Application.Activity.updateAddlAttendees(Arguments.ActivityID,Arguments.AddlAttendees)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="updateApplicationValue" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="Field" required="yes" type="string"> <!--- "Received, Sent, Approved, etc." --->
		<cfargument name="Flag" required="yes" type="string">
		<cfargument name="AppDate" required="yes" type="string">
		
		<cfset var Status = "Fail|Cannot access update functionality for activity applications.">
        
        <cfset Status = Application.Activity.updateApplicationValue(Arguments.ActivityID,Arguments.Field,Arguments.Flag,Arguments.AppDate)>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="updateAttendeeStatuses" access="Remote" output="false" returntype="string">
		<cfargument name="AttendeeList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="StatusID" required="true" type="string">
        
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the status update functionality for attendees.")>
        
        <cfset status = Application.ActivityAttendee.updateStatuses(Arguments.AttendeeList,Arguments.ActivityID,Arguments.StatusID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="updateMaxRegistrants" access="Remote" output="false" returntype="any">
    	<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="MaxRegistrants" type="string" required="true" />
        
        <cfset var Status = "Fail|Cannot access the update function for max registrants.">
        
        <cfset Status = Application.Activity.updateMaxRegistrants(Arguments.ActivityID,Arguments.MaxRegistrants)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="updateMDStatus" access="Remote" output="false" returntype="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="PersonID" required="true" type="string">
		<cfargument name="MDNonMD" required="true" type="string">
        
        <cfset var Status = "Fail|Cannot access the update function for attendee MD status.">
        
        <cfset Status = Application.ActivityAttendee.updateMDStatus(Arguments.ActivityID,Arguments.PersonID,Arguments.MDNonMD)>
        
        <cfreturn Status />
    </cffunction>
</cfcomponent>