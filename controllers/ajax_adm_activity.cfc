<cfcomponent extends="controller">
	<cffunction name="fixAttendees" hint="Used to fix activity dates for attendees." >
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
    
	<cffunction name="updateAttendeeDates" >
    	<cfquery name="qGetAttendees" datasource="#application.settings.dsn#">
        	SELECT AttendeeId, CheckIn
            FROM ce_attendee
            WHERE RegisterDate IS NULL
        </cfquery>
        
        <cfdump var="#qGetAttendees#"><cfabort>
    </cffunction>
    
	<cffunction name="approveComment"  returntype="string">
		<cfparam name="params.CommentID" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access comment approval functionality.")>
        
        <cfset status = Application.ActivityPublish.approveComment(Arguments.CommentID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="approveFacultyFile"  output="false" returntype="String">
		<cfparam name="params.PersonID" type="string">
		<cfparam name="params.ActivityID" type="string">
        <cfparam name="params.FileType" type="string">
        <cfparam name="params.Mode" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access file approval functionality for activity faculty.")>
        
        <cfset status = Application.ActivityPeople.approveFacultyFile(Arguments.PersonID,Arguments.ActivityID,Arguments.FileType,Arguments.Mode)>
        
        <cfreturn status.getJSON() />
    </cffunction>
        
	<cffunction name="AutoComplete"  output="no" returntype="string">
		<cfparam name="params.q" type="string" required="yes">
		<cfparam name="params.limit" type="string" required="yes">
        
        <cfset var Status = Application.Activity.AutoComplete(Arguments.Q,Arguments.Limit)>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="changeCommitteeRoles"  output="false" returntype="string">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.RoleID" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access role changing functionality for committee members.")>
        
        <cfset status = Application.ActivityPeople.changeCommitteeRoles(Arguments.PersonList,Arguments.ActivityID,Arguments.RoleID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="changeFacultyRoles"  output="false" returntype="string">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.RoleID" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access role changing functionality for faculty.")>
      	
        <cfset status = Application.ActivityPeople.changeFacultyRoles(Arguments.PersonList,Arguments.ActivityID,Arguments.RoleID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="CopyPaste" displayname="Copy and Paste Activity"  output="no" returntype="string">
		<cfparam name="params.Mode" type="numeric" required="yes">
		<cfparam name="params.ActivityID" type="numeric" required="yes">
        <cfparam name="params.NewActivityTitle" type="string" required="yes">
        <cfparam name="params.NewActivityTypeID" type="numeric" required="yes">
        <cfparam name="params.NewGroupingID" type="numeric" required="yes">
        
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
    
	<cffunction name="createCategory"  output="false" returntype="string">
		<cfparam name="params.Name" required="yes" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access category create functionality for activities.")>
        
        <cfset status = Application.Activity.createCategory(Arguments.Name)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteActivity"  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="numeric">
        <cfparam name="params.Reason" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access delete function for activities.")>
        
        <cfset status = Application.Activity.deleteActivity(Arguments.ActivityID,Arguments.Reason)>
    
    	<cfreturn status.getJSON() />
    </cffunction>
	
	<cffunction name="deleteAgendaItem"  output="false" returntype="string">
		<cfparam name="params.AgendaID" required="yes" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access agenda delete functionality.")>
        
        <cfset status = Application.Activity.deleteAgendaItem(Arguments.AgendaID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteBudget"  output="false" returntype="string">
	<cfparam name="params.ActivityID" type="numeric">
	<cfparam name="params.BudgetID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access budget delete functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.deleteBudget(Arguments.ActivityID,Arguments.BudgetID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteCategory"  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="numeric">
		<cfparam name="params.CategoryID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access category delete functionality for activities.")>
        
        <cfset Status = Application.Activity.deleteCategory(Arguments.ActivityID,Arguments.CategoryID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="denyComment"  returntype="string">
		<cfparam name="params.CommentID" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access comment denial functionality.")>
        
        <cfset status = Application.ActivityPublish.denyComment(Arguments.CommentID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteFee"  output="false" returntype="string">
        <cfparam name="params.ActivityID" type="String">
        <cfparam name="params.FeeID" type="String">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access fee delete functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.deleteFee(Arguments.ActivityID,Arguments.FeeID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteLedger"  output="false" returntype="string">
	<cfparam name="params.ActivityID" type="String">
	<cfparam name="params.EntryID" type="String">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access ledger delete functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.deleteLedger(Arguments.ActivityID,Arguments.EntryID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteNote"  output="false" returntype="string">
		<cfparam name="params.NoteID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access note delete functionality for activities.")>
        
        <cfset status = Application.Activity.deleteNote(Arguments.NoteID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="deleteSupport"  output="false" returntype="string">
        <cfparam name="params.ActivityID" type="String">
        <cfparam name="params.SupportID" type="String">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access support delete functionality for activity finances.")>
        
        <cfset Status = Application.ActivityFinance.deleteSupport(Arguments.ActivityID,Arguments.SupportID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="emailCertificate"  output="false" returntype="string" returnFormat="plain">
        <cfparam name="params.activityId" type="numeric" required="yes">
    	<cfparam name="params.personId" type="numeric" required="yes">
        <cfparam name="params.subject" type="string" required="yes">
        <cfparam name="params.body" type="string" required="yes">
        
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
    
	<cffunction name="fixStats" output="no"  returntype="string" returnformat="plain">
		<cfparam name="params.RunDate" type="string" required="no" default="#DateFormat(DateAdd('d',-100,now()),'mm/dd/yyyy')#" />
		<cfparam name="params.ActivityID" type="numeric" required="no" default="0" />
        
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
    
    <cffunction name="getActivitySpecialties"  output="false" returntype="string">
    	<cfparam name="params.activityId" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Specialties okay.")>
        
        <cfset status.setData(application.activity.getActivitySpecialties(activityId=arguments.activityId))>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="getAttendeeDate" hint="Returns requested date information for provided attendee."  output="false" returntype="string">
    	<cfparam name="params.attendeeId" type="numeric" required="no" default="0">
    	<cfparam name="params.PersonID" type="numeric" required="no" default="0">
        <cfparam name="params.ActivityID" type="numeric" required="no" default="0">
        <cfparam name="params.Type" type="numeric" required="yes">
        
        <cfset var Status = "">
        
        <cfset Status = Application.ActivityAttendee.getAttendeeDate(arguments.attendeeId,Arguments.PersonID,Arguments.ActivityID,Arguments.Type)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="getGroupings" hint="Returns JSON data for groupings."  output="false" returntype="string">
    	<cfparam name="params.ATID" type="numeric" required="yes">
        
        <cfset Status = Application.Activity.getGroupings(Arguments.ATID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="getNoteCount" hint="Returns the total number of notes for provided activity."  output="false" returntype="numeric">
    	<cfparam name="params.ActivityID" type="numeric" required="yes">
        
        <cfset Status = Application.Activity.getNoteCount(Arguments.ActivityID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="getSpecialties"  output="false" returntype="string">
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Specialties okay.")>
        
        <cfset status.setData(application.activityPublish.getSpecialties())>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="JointlyAutoComplete"  output="no" returntype="string">
		<cfparam name="params.q" type="string" required="yes">
		<cfparam name="params.limit" type="string" required="yes">
        
        <cfset var Status = Application.Activity.JointlyAutoComplete(Arguments.Q,Arguments.Limit)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="markComplete"  output="false" returntype="string">
		<cfparam name="params.PersonID" type="string" required="yes">
        <cfparam name="params.ActivityID" type="string" required="yes">
        
        <cfset var Status = "false|Cannot access functionality to mark activity complete.">
		
		<cfset Status = Application.ActivityAttendee.markComplete(Arguments.PersonID,Arguments.ActivityID)>
     	
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="Move" displayname="Move Activity"  output="no">
		<cfparam name="params.FromActivityID" type="numeric" required="yes">
		<cfparam name="params.ToActivityID" type="numeric" required="yes">
        
        <cfset Application.Activity.Move(Arguments.FromActivityID,Arguments.ToActivityID)>
        
    </cffunction>
	
    <cffunction name="publishActivity" hint="Publishes Activity to the web"  output="false" returntype="string">
    	<cfparam name="params.ActivityID" type="string" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access publish function for activities.")>
        
        <cfset status = Application.ActivityPublish.publishActivity(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="publishActivityToSite" hint="Either Adds or Deletes a record for the Site Publishing"  output="false" returntype="string">
    	<cfparam name="params.ActivityID" type="string" />
        <cfparam name="params.SiteID" type="string" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access publish function for activities.")>
        
        <cfset status = Application.ActivityPublish.publishActivityToSite(Arguments.ActivityID,Arguments.SiteID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="publishFile" hint="Adds a publishing component for current file as a file download."  output="false" returntype="string">
    	<cfparam name="params.ActivityID" type="numeric" required="yes">
        <cfparam name="params.FileID" type="numeric" required="yes">
        <cfparam name="params.FileName" type="string" required="yes">
        <cfparam name="params.ComponentID" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot publish function for activity documents.")>
        
        <cfset status = Application.ActivityPublish.publishFile(Arguments.ActivityID,Arguments.FileID,Arguments.FileName,Arguments.ComponentID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeAllAttendees"  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cfset status = Application.ActivityAttendee.removeAll(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeAllCommittee"  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for committee members.")>
		
		<cfset status = Application.ActivityPeople.removeAllCommittee(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeAllFaculty"  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for faculty.")>
		
		<cfset status = Application.ActivityPeople.removeAllFaculty(Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
	
	<cffunction name="removeAttendeeByID"  output="false" returntype="string" returnformat="plain">
		<cfparam name="params.attendeeId" type="string">
        
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
	
	<cffunction name="removeCheckedAttendees"  output="false" returntype="string">
		<cfparam name="params.AttendeeList" required="false" type="string" default="">
		<cfparam name="params.ActivityID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cfset status = Application.ActivityAttendee.removeChecked(Arguments.AttendeeList,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeCheckedCommittee"  output="false" returntype="string">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for committee members.")>
		
		<cfset status = Application.ActivityPeople.removeCheckedCommittee(Arguments.PersonList,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="removeCheckedFaculty"  output="false" returntype="string">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="numeric">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access remove functionality for faculty")>
		
		<cfset status = Application.ActivityPeople.removeCheckedFaculty(Arguments.PersonList,Arguments.ActivityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="resetAttendee"  output="false" returntype="string">
        <cfparam name="params.attendeeId" type="numeric" required="false" default="0">
        <cfparam name="params.PaymentFlag" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access attendee reset functionality.")>
        
        <cfset status = Application.ActivityAttendee.resetAttendee(arguments.attendeeId,Arguments.PaymentFlag)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="saveACCMEInfo"  output="false" returntype="string">
    	<cfparam name="params.ActivityID" type="numeric" required="yes">
		<cfparam name="params.competenceDesign" type="numeric" required="no" default="0">
		<cfparam name="params.performanceDesign" type="numeric" required="no" default="0">
		<cfparam name="params.outcomesDesign" type="numeric" required="no" default="0">
		<cfparam name="params.competenceEval" type="numeric" required="no" default="0">
		<cfparam name="params.performanceEval" type="numeric" required="no" default="0">
		<cfparam name="params.outcomesEval" type="numeric" required="no" default="0">
        
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
    
	<cffunction name="saveActivity"  output="no" returntype="string">
		<cfparam name="params.ActivityID" default="" type="string" required="yes">
		<cfparam name="params.Title" default="" type="string" required="yes">
		<cfparam name="params.StartDate" default="" type="string">
		<cfparam name="params.EndDate" default="" type="string">
		<cfparam name="params.Description" default="" type="string">
		<cfparam name="params.Location" default="" type="string">
		<cfparam name="params.Address1" default="" type="string">
		<cfparam name="params.Address2" default="" type="string">
		<cfparam name="params.City" default="" type="string">
		<cfparam name="params.State" default="" type="string">
		<cfparam name="params.Province" default="" type="string">
		<cfparam name="params.Country" default="" type="string">
		<cfparam name="params.PostalCode" default="" type="string">
		<cfparam name="params.Sponsorship" default="" type="string">
		<cfparam name="params.Sponsor" default="" type="string">
		<cfparam name="params.ExternalID" default="" type="string">
		<cfparam name="params.ReleaseDate" type="string" default="#Now()#">
		<cfparam name="params.ChangedFields" type="string" required="no" default="" />
		<cfparam name="params.ChangedValues" type="string" required="no" default="" />
        
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
    
	<cffunction name="saveAgendaItem"  output="false" returntype="string">
		<cfparam name="params.ActivityID" required="yes" type="string">
		<cfparam name="params.AgendaID" required="no" type="string" default="">
		<cfparam name="params.Description" required="yes" type="string" default="">
		<cfparam name="params.EventDate" required="yes" type="string" default="">
		<cfparam name="params.StartTime" required="yes" type="string" default="">
		<cfparam name="params.EndTime" required="yes" type="string" default="">
        
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
	
    <cffunction name="saveAttendee"  output="false" returntype="string">
		<cfparam name="params.ActivityID" required="yes" type="string">
		<cfparam name="params.PersonID" required="yes" type="string">
		<cfparam name="params.MDFlag" required="no" type="string" default="N" />
        
        <cfset var Status = "Fail|Cannot access attendee save functionality.">
        
        <cfset Status = Application.ActivityAttendee.saveAttendee(Arguments.ActivityID,Arguments.PersonID,Arguments.MDFlag)>
        
        <cfreturn Status />
    </cffunction>
	
    <cffunction name="saveAttendeeCDC"  output="false" returntype="string" returnFormat="plain">
    	<cfparam name="params.AttendeeID" type="numeric" required="yes">
        <cfparam name="params.Ethnicity" type="numeric" required="yes">
        <cfparam name="params.OMBEthnicity" type="numeric" required="yes">
        <cfparam name="params.CBAFundID" type="string" required="yes">
        <cfparam name="params.CBACDC" type="string" required="yes">
        <cfparam name="params.CBAOth" type="string" required="yes">
        <cfparam name="params.CBOFundID" type="string" required="yes">
        <cfparam name="params.CBOCDC" type="string" required="yes">
        <cfparam name="params.CBOOth" type="string" required="yes">
        <cfparam name="params.ProfCId" type="numeric" required="yes">
        <cfparam name="params.ProfCOther" type="string" required="yes">
        <cfparam name="params.ProfNId" type="numeric" required="yes">
        <cfparam name="params.ProfNOther" type="string" required="yes">
        <cfparam name="params.FunRCId" type="numeric" required="yes">
        <cfparam name="params.FunRCOther" type="string" required="yes">
        <cfparam name="params.FunRNId" type="numeric" required="yes">
        <cfparam name="params.FunRNOther" type="string" required="yes">
        <cfparam name="params.OccClassID" type="numeric" required="yes">
        <cfparam name="params.OrgTypeID" type="numeric" required="no" default="">
        <cfparam name="params.OrgTypeOther" type="string" required="yes">
        <cfparam name="params.PrinEmpID" type="numeric" required="yes">
        <cfparam name="params.PrinEmpOther" type="string" required="yes">
        <cfparam name="params.WorkState" type="string" required="yes">
        <cfparam name="params.WorkZip" type="numeric" required="yes">
        <cfparam name="params.Focus1" type="string" required="no" default="">
        <cfparam name="params.Focus2" type="string" required="no" default="">
        <cfparam name="params.Focus3" type="string" required="no" default="">
        <cfparam name="params.Focus4" type="string" required="no" default="">
        <cfparam name="params.Focus5" type="string" required="no" default="">
        <cfparam name="params.Focus6" type="string" required="no" default="">
        <cfparam name="params.Focus7" type="string" required="no" default="">
        <cfparam name="params.Focus8" type="string" required="no" default="">
        <cfparam name="params.Focus9" type="string" required="no" default="">
        <cfparam name="params.Focus10" type="string" required="no" default="">
        <cfparam name="params.FocusOther" type="string" required="no" default="">
        <cfparam name="params.SpecialPop1" type="string" required="no" default="">
        <cfparam name="params.SpecialPop2" type="string" required="no" default="">
        <cfparam name="params.SpecialPop3" type="string" required="no" default="">
        <cfparam name="params.SpecialPop4" type="string" required="no" default="">
        <cfparam name="params.SpecialPop5" type="string" required="no" default="">
        <cfparam name="params.SpecialPop6" type="string" required="no" default="">
        <cfparam name="params.SpecialPop7" type="string" required="no" default="">
        <cfparam name="params.SpecialPop8" type="string" required="no" default="">
        <cfparam name="params.SpecialPop9" type="string" required="no" default="">
        <cfparam name="params.SpecialPop10" type="string" required="no" default="">
        <cfparam name="params.SpecialPop11" type="string" required="no" default="">
        <cfparam name="params.SpecialPop12" type="string" required="no" default="">
        <cfparam name="params.SpecialPop13" type="string" required="no" default="">
        <cfparam name="params.SpecialPop14" type="string" required="no" default="">
        <cfparam name="params.SpecialPop15" type="string" required="no" default="">
        <cfparam name="params.SpecialPop16" type="string" required="no" default="">
        <cfparam name="params.SpecialPop17" type="string" required="no" default="">
        <cfparam name="params.SpecialPop18" type="string" required="no" default="">
        <cfparam name="params.SpecialPopOther" type="string" required="no" default="">
        <cfparam name="params.MarketID" type="string" required="yes">
        <cfparam name="params.MarketOther" type="string" required="yes">
        <cfparam name="params.ContactUpdates" type="string" required="yes">
        <cfparam name="params.ContactEval" type="string" required="yes">
        <cfparam name="params.PTCAlert" type="string" required="yes">
        <cfparam name="params.CurrentlyEnrolled" type="string" required="yes">
        
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
    
    <cffunction name="saveAttendeeDate" hint="Saves date info for attendee to provided attendee db field."  returntype="string">
    	<cfparam name="params.AttendeeID" type="numeric" required="yes">
        <cfparam name="params.DateValue" type="string" required="yes">
        <cfparam name="params.Type" type="numeric" required="yes">
        
        <cfset var Status = "Fail|Cannot access update function for attendee dates.">
        
        <cfset Status = Application.ActivityAttendee.saveAttendeeDate(Arguments.AttendeeID,Arguments.DateValue,Arguments.Type)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="saveBudget" hint="Saves provided information as a budget entry."  output="false" returntype="string">
    	<cfparam name="params.ActivityID" type="numeric" required="yes">
    	<cfparam name="params.BudgetID" type="numeric" required="yes">
        <cfparam name="params.Description" type="string" required="yes">
        <cfparam name="params.EntryType" type="numeric" required="yes">
        <cfparam name="params.Amount" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access budget save functionality for activity finances.")>
        
        <cfset status = Application.ActivityFinance.saveBudget(Arguments.ActivityID,Arguments.BudgetID,Arguments.Description,Arguments.EntryType,Arguments.Amount)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="saveCategory"  output="false" returntype="string">
		<cfparam name="params.ActivityID" required="yes" type="string">
		<cfparam name="params.CategoryID" required="yes" type="string">
      	
        <cfset var Status = "Fail|Cannot access category save functionality for activities.">
        
        <cfset Status = Application.Activity.saveCategory(Arguments.ActivityID,Arguments.CategoryID)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveCategoriesLMS"  output="false" returntype="string">
		<cfparam name="params.ActivityID" default="" type="string" required="yes">
        <cfparam name="params.Site" default="" type="string" required="yes">
      	
        <cfset var Status = "fail">
        
        <cfset Status = Application.ActivityPublish.saveCategoriesLMS(Arguments.ActivityID,Arguments.Site)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveCommitteeMember"  output="false" returntype="string">
		<cfparam name="params.ActivityID" required="yes" type="string">
		<cfparam name="params.PersonID" required="yes" type="string">
      	
        <cfset var Status = "Fail|Cannot access faculty saving functionality.">
        
        <cfset Status = Application.ActivityPeople.saveCommitteeMember(Arguments.ActivityID,Arguments.PersonID)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="saveFacultyMember"  output="false" returntype="string">
		<cfparam name="params.ActivityID" required="yes" type="string">
		<cfparam name="params.PersonID" required="yes" type="string">
      	
        <cfset var Status = "Fail|Cannot access faculty saving functionality.">
        
        <cfset Status = Application.ActivityPeople.saveFacultyMember(Arguments.ActivityID,Arguments.PersonID)>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="saveFee"  ouput="true" returntype="string">
    	<cfparam name="params.FeeID" required="yes" default="0">
    	<cfparam name="params.ActivityID" required="yes">
        <cfparam name="params.Name" required="yes">
        <cfparam name="params.StartDate" required="yes">
        <cfparam name="params.StartTime" required="yes">
        <cfparam name="params.EndDate" required="yes">
        <cfparam name="params.EndTime" required="yes">
        <cfparam name="params.Amount" required="yes">
      	
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
    
    <cffunction name="saveLedger" hint="Saves ledger information."  output="false" returntype="string">
    	<cfparam name="params.ActivityID" type="numeric" required="yes">
        <cfparam name="params.EntryID" type="numeric" required="yes">
        <cfparam name="params.Description" type="string" required="yes">
        <cfparam name="params.Memo" type="string" required="yes">
        <cfparam name="params.EntryDate" type="date" required="yes">
        <cfparam name="params.EntryType" type="numeric" required="yes">
        <cfparam name="params.Amount" type="numeric" required="yes">
      	
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

	<cffunction name="saveNote"  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.NoteBody" type="string">
		<cfparam name="params.NoteID" required="false" default="0">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access note saving functionality for activities.")>
        
        <cfset status = Application.Activity.saveNote(Arguments.ActivityID,Arguments.NoteBody,Arguments.NoteID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="savePubGeneral" displayname="Save Form"  output="no">
		<cfparam name="params.ActivityID" type="string" required="yes" />
		<cfparam name="params.Overview" type="string" required="no" />
		<cfparam name="params.Objectives" type="string" required="no" />
		<cfparam name="params.Keywords" type="string" required="no" />
		<cfparam name="params.PublishDate" type="string" required="no" />
		<cfparam name="params.RemoveDate" type="string" required="no" />
		<cfparam name="params.PaymentFlag" type="string" required="no" />
		<cfparam name="params.PaymentFee" type="string" required="no" />
		<cfparam name="params.FeaturedFlag" type="string" required="no" default="N" />
		<cfparam name="params.ExtHostFlag" type="string" required="no" default="N" />
		<cfparam name="params.ExtHostLink" type="string" required="no" default="" />
		<cfparam name="params.AllowCommentFlag" type="string" required="no" />
		<cfparam name="params.CommentApproveFlag" type="string" required="no" />
		<cfparam name="params.NotifyEmails" type="string" required="no" />
		<cfparam name="params.TermsFlag" type="string" required="no" />
		<cfparam name="params.TermsText" type="string" required="no" />
		<cfparam name="params.RestrictedFlag" type="string" required="no" />
      	
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
    
	<cffunction name="saveSpecialties"  output="false" returntype="string">
		<cfparam name="params.ActivityID" default="" type="string" required="yes">
        <cfparam name="params.Specialties" default="" type="string" required="yes">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access specialty saving functionality for activities.")>
        
        <cfset Status = Application.ActivityPublish.saveSpecialties(Arguments.ActivityID,Arguments.Specialties)>
        
        <cfreturn Status.getJSON() />
    </cffunction>
    
	<cffunction name="saveSupport"  output="false" returntype="string">
    	<cfparam name="params.SupportID" required="false" default="-1" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.Supporter" type="string">
		<cfparam name="params.SupportType" type="string">
		<cfparam name="params.Amount" type="string">
		<cfparam name="params.ContractNum" required="false" type="string" default="">
		<cfparam name="params.BudgetRequested" required="false" type="string" default="">
		<cfparam name="params.BudgetDueDate" required="false" type="string" default="">
		<cfparam name="params.BudgetSentDate" required="false" type="string" default="">
		<cfparam name="params.SentDate" required="false" type="string" default="">
		<cfparam name="params.FundsReturned" required="false" type="string" default="">
      	
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
    
    <cffunction name="sendCertificate" hint="Sends a copy of the attendee's certificate to the person attached to the attendee."  output="false" returntype="string">
        <cfparam name="params.activityId" type="numeric" required="no" default="0">
    	<cfparam name="params.personId" type="numeric" required="no" default="0">
        <cfparam name="params.creditid" type="numeric" required="no" default="1">
      	
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
    
    <cffunction name="UnpublishFile" hint="Unpublishes provided file."  output="false" returntype="string">
    	<cfparam name="params.ActivityID" type="numeric" required="yes">
        <cfparam name="params.FileID" type="numeric" required="yes">
        
        <cfset Status = "Fail|Cannot access the unpublish function for activity documents.">
        
        <cfset Status = Application.ActivityPublish.UnpublishFile(Arguments.ActivityID,Arguments.FileID)>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="updateActivityStatus"  output="no" displayname="Set Activity Status">
		<cfparam name="params.ActivityID" type="numeric" required="yes" />
		<cfparam name="params.StatusID" type="numeric" required="yes" />
        
        <cfset Status = "Fail">
        
        <cfset Status = Application.Activity.updateStatus(Arguments.ActivityID,Arguments.StatusID)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="updateAddlAttendees"  output="false" returntype="any">
    	<cfparam name="params.ActivityID" type="string" />
        <cfparam name="params.AddlAttendees" type="string" />
        
        <cfset var Status = "Fail|Cannot access the update function for additional attendees.">
        
        <cfset Status = Application.Activity.updateAddlAttendees(Arguments.ActivityID,Arguments.AddlAttendees)>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="updateApplicationValue"  output="false" returntype="string">
		<cfparam name="params.ActivityID" required="yes" type="string">
		<cfparam name="params.Field" required="yes" type="string"> <!--- "Received, Sent, Approved, etc." --->
		<cfparam name="params.Flag" required="yes" type="string">
		<cfparam name="params.AppDate" required="yes" type="string">
		
		<cfset var Status = "Fail|Cannot access update functionality for activity applications.">
        
        <cfset Status = Application.Activity.updateApplicationValue(Arguments.ActivityID,Arguments.Field,Arguments.Flag,Arguments.AppDate)>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="updateAttendeeStatuses"  output="false" returntype="string">
		<cfparam name="params.AttendeeList" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.StatusID" type="string">
        
        <cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the status update functionality for attendees.")>
        
        <cfset status = Application.ActivityAttendee.updateStatuses(Arguments.AttendeeList,Arguments.ActivityID,Arguments.StatusID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="updateMaxRegistrants"  output="false" returntype="any">
    	<cfparam name="params.ActivityID" type="string" />
        <cfparam name="params.MaxRegistrants" type="string" />
        
        <cfset var Status = "Fail|Cannot access the update function for max registrants.">
        
        <cfset Status = Application.Activity.updateMaxRegistrants(Arguments.ActivityID,Arguments.MaxRegistrants)>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="updateMDStatus"  output="false" returntype="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.PersonID" type="string">
		<cfparam name="params.MDNonMD" type="string">
        
        <cfset var Status = "Fail|Cannot access the update function for attendee MD status.">
        
        <cfset Status = Application.ActivityAttendee.updateMDStatus(Arguments.ActivityID,Arguments.PersonID,Arguments.MDNonMD)>
        
        <cfreturn Status />
    </cffunction>
</cfcomponent>