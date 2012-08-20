<cfcomponent extends="controller">
	<cffunction name="init">
		<cfset filters(through="ajaxLoginRequired")>
		<cfset filters(through="ajaxAdminRequired")>
	</cffunction>
	
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
	
	<cffunction name="updateAttendeeDates">
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(true)>
		<cfset status.setStatusMsg("Successfully updated shit.")>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="approveComment" >
		<cfparam name="params.CommentID" type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access comment approval functionality.")>
		
		<cfset status = Application.ActivityPublish.approveComment(params.CommentID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="approveFacultyFile"  output="false">
		<cfparam name="params.facultyId" type="string">
		<cfparam name="params.FileType" type="string">
		<cfparam name="params.Mode" type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access file approval functionality for activity faculty.")>
		
		<cfset status = Application.ActivityPeople.approveFacultyFile(params.facultyId,params.FileType,params.Mode)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
		
	<cffunction name="AutoComplete"  output="no">
		<cfparam name="params.q" type="string" >
		<cfparam name="params.limit" type="string" >
		
		<cfset var Status = Application.Activity.AutoComplete(params.Q,params.Limit)>
		
		<cfset renderText(Status) />
	</cffunction>

	<cffunction name="changeCommitteeRoles"  output="false">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.RoleID" type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access role changing functionality for committee members.")>
		
		<cfset status = Application.ActivityPeople.changeCommitteeRoles(params.PersonList,params.ActivityID,params.RoleID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="changeFacultyRoles"  output="false">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.RoleID" type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access role changing functionality for faculty.")>
		
		<cfset status = Application.ActivityPeople.changeFacultyRoles(params.PersonList,params.ActivityID,params.RoleID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="CopyPaste" displayname="Copy and Paste Activity"  output="no">
		<cfparam name="params.Mode" type="numeric" >
		<cfparam name="params.ActivityID" type="numeric" >
		<cfparam name="params.NewActivityTitle" type="string" >
		<cfparam name="params.NewActivityTypeID" type="numeric" >
		<cfparam name="params.NewGroupingID" type="numeric" >
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access activity copy functionality.")>
		
		<cfset Status = Application.Activity.CopyPaste(
							params.Mode,
							params.ActivityID,
							params.NewActivityTitle,
							params.NewActivityTypeID,
							params.NewGroupingID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="createCategory"  output="false">
		<cfparam name="params.Name"  type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access category create functionality for activities.")>
		
		<cfset status = Application.Activity.createCategory(params.Name)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="deleteActivity"  output="false">
		<cfparam name="params.ActivityID" type="numeric">
		<cfparam name="params.Reason" type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access delete function for activities.")>
		
		<cfset status = Application.Activity.deleteActivity(params.ActivityID,params.Reason)>
	
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="deleteAgendaItem"  output="false">
		<cfparam name="params.AgendaID"  type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access agenda delete functionality.")>
		
		<cfset status = Application.Activity.deleteAgendaItem(params.AgendaID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="deleteBudget"  output="false">
	<cfparam name="params.ActivityID" type="numeric">
	<cfparam name="params.BudgetID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access budget delete functionality for activity finances.")>
		
		<cfset status = Application.ActivityFinance.deleteBudget(params.ActivityID,params.BudgetID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="deleteCategory"  output="false">
		<cfparam name="params.ActivityID" type="numeric">
		<cfparam name="params.CategoryID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access category delete functionality for activities.")>
		
		<cfset Status = Application.Activity.deleteCategory(params.ActivityID,params.CategoryID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="denyComment" >
		<cfparam name="params.CommentID" type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access comment denial functionality.")>
		
		<cfset status = Application.ActivityPublish.denyComment(params.CommentID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="deleteFee"  output="false">
		<cfparam name="params.ActivityID" type="String">
		<cfparam name="params.FeeID" type="String">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access fee delete functionality for activity finances.")>
		
		<cfset status = Application.ActivityFinance.deleteFee(params.ActivityID,params.FeeID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="deleteLedger"  output="false">
	<cfparam name="params.ActivityID" type="String">
	<cfparam name="params.EntryID" type="String">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access ledger delete functionality for activity finances.")>
		
		<cfset status = Application.ActivityFinance.deleteLedger(params.ActivityID,params.EntryID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="deleteNote"  output="false">
		<cfparam name="params.NoteID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access note delete functionality for activities.")>
		
		<cfset status = Application.Activity.deleteNote(params.NoteID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="deleteSupport"  output="false">
		<cfparam name="params.ActivityID" type="String">
		<cfparam name="params.SupportID" type="String">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access support delete functionality for activity finances.")>
		
		<cfset Status = Application.ActivityFinance.deleteSupport(params.ActivityID,params.SupportID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="emailCertificate"  output="false" returnFormat="plain">
		<cfparam name="params.activityId" type="numeric" >
		<cfparam name="params.personId" type="numeric" >
		<cfparam name="params.subject" type="string" >
		<cfparam name="params.body" type="string" >
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access email certificate functionality.")>
		
		<Cfset status = application.activity.emailCertificate(
															activityId=params.activityId,
															personId=params.personId,
															subject=params.subject,
															body=params.body)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="fixStats" output="no"  returnformat="plain">
		<cfparam name="params.RunDate" type="string"  default="#DateFormat(DateAdd('d',-100,now()),'mm/dd/yyyy')#" />
		<cfparam name="params.ActivityID" type="numeric"  default="0" />
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access statistics update functionality for activities.")>
		
		<!--- UPDATE STATS --->
		<cfset createObject("component", "admin._com.scripts.statFixer").run(activityId=params.activityId,mode='manual')>
					
		<cfset status.setStatus(true)>
		<cfset status.setStatusMsg("Stats have been updated.")>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="getActivitySpecialties"  output="false">
		<cfparam name="params.activityId" type="numeric" >
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(true)>
		<cfset status.setStatusMsg("Specialties okay.")>
		
		<cfset status.setData(application.activity.getActivitySpecialties(activityId=params.activityId))>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="getAttendeeDate" hint="Returns requested date information for provided attendee."  output="false">
		<cfparam name="params.attendeeId" type="numeric"  default="0">
		<cfparam name="params.currStatusId" type="numeric" default="0">
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<!--- <cfcontent type="text/javascript" /> --->
		
		<cfset status.setStatus(true)>
		<cfset status.setStatusMsg("Attendee Date Info.")>
		
		<cfset Status = Application.ActivityAttendee.getAttendeeDate(params.attendeeId,params.currStatusId)>
		
		<cfset renderText(serializeJSON(status.getPayload())) />
	</cffunction>
	
	<cffunction name="getGroupings" hint="Returns JSON data for groupings."  output="false">
		<cfparam name="params.ATID" type="numeric" >
		
		<cfset Status = Application.Activity.getGroupings(params.ATID)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="getNoteCount" hint="Returns the total number of notes for provided activity."  output="false">
		<cfparam name="params.ActivityID" type="numeric" >
		
		<cfset Status = Application.Activity.getNoteCount(params.ActivityID)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="getSpecialties"  output="false">
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(true)>
		<cfset status.setStatusMsg("Specialties okay.")>
		
		<cfset status.setData(application.activityPublish.getSpecialties())>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="JointlyAutoComplete"  output="no">
		<cfparam name="params.q" type="string" >
		<cfparam name="params.limit" type="string" >
		
		<cfset var Status = Application.Activity.JointlyAutoComplete(params.Q,params.Limit)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="markComplete"  output="false">
		<cfparam name="params.PersonID" type="string" >
		<cfparam name="params.ActivityID" type="string" >
		
		<cfset var Status = "false|Cannot access functionality to mark activity complete.">
		
		<cfset Status = Application.ActivityAttendee.markComplete(params.PersonID,params.ActivityID)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="Move" displayname="Move Activity"  output="no">
		<cfparam name="params.FromActivityID" type="numeric" >
		<cfparam name="params.ToActivityID" type="numeric" >
		
		<cfset Application.Activity.Move(params.FromActivityID,params.ToActivityID)>
		
	</cffunction>
	
	<cffunction name="publishActivity" hint="Publishes Activity to the web"  output="false">
		<cfparam name="params.ActivityID" type="string" />
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access publish function for activities.")>
		
		<cfset status = Application.ActivityPublish.publishActivity(params.ActivityID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="publishActivityToSite" hint="Either Adds or Deletes a record for the Site Publishing"  output="false">
		<cfparam name="params.ActivityID" type="string" />
		<cfparam name="params.SiteID" type="string" />
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access publish function for activities.")>
		
		<cfset status = Application.ActivityPublish.publishActivityToSite(params.ActivityID,params.SiteID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="publishFile" hint="Adds a publishing component for current file as a file download."  output="false">
		<cfparam name="params.ActivityID" type="numeric" >
		<cfparam name="params.FileID" type="numeric" >
		<cfparam name="params.FileName" type="string" >
		<cfparam name="params.ComponentID" type="numeric" >
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot publish function for activity documents.")>
		
		<cfset status = Application.ActivityPublish.publishFile(params.ActivityID,params.FileID,params.FileName,params.ComponentID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="removeAllAttendees"  output="false">
		<cfparam name="params.ActivityID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cfset status = Application.ActivityAttendee.removeAll(params.ActivityID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="removeAllCommittee"  output="false">
		<cfparam name="params.ActivityID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access remove functionality for committee members.")>
		
		<cfset status = Application.ActivityPeople.removeAllCommittee(params.ActivityID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="removeAllFaculty"  output="false">
		<cfparam name="params.ActivityID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access remove functionality for faculty.")>
		
		<cfset status = Application.ActivityPeople.removeAllFaculty(params.ActivityID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="removeAttendeeByID"  output="false" returnformat="plain">
		<cfparam name="params.attendeeId" type="string">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cftry>
			<cfquery name="qDeleteByID" datasource="#application.settings.dsn#">
				DELETE ce_attendee
				WHERE attendeeid=<cfqueryparam value="#params.attendeeId#" cfsqltype="cf_sql_integer" />
			</cfquery>
			
			<cfcatch>
			
			</cfcatch>
		</cftry>
		
		<cfset status.setStatus(true) />
		<cfset status.setStatusMsg('successful') />
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="removeCheckedAttendees"  output="false">
		<cfparam name="params.AttendeeList"  type="string" default="">
		<cfparam name="params.ActivityID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access remove functionality for attendees.")>
		
		<cfset status = Application.ActivityAttendee.removeChecked(params.AttendeeList,params.ActivityID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="removeCheckedCommittee"  output="false">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access remove functionality for committee members.")>
		
		<cfset status = Application.ActivityPeople.removeCheckedCommittee(params.PersonList,params.ActivityID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="removeCheckedFaculty"  output="false">
		<cfparam name="params.PersonList" type="string">
		<cfparam name="params.ActivityID" type="numeric">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access remove functionality for faculty")>
		
		<cfset status = Application.ActivityPeople.removeCheckedFaculty(params.PersonList,params.ActivityID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="resetAttendee"  output="false">
		<cfparam name="params.attendeeId" type="numeric"  default="0">
		<cfparam name="params.PaymentFlag" type="string" >
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access attendee reset functionality.")>
		
		<cfset status = Application.ActivityAttendee.resetAttendee(params.attendeeId,params.PaymentFlag)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveACCMEInfo"  output="false">
		<cfparam name="params.ActivityID" type="numeric" >
		<cfparam name="params.competenceDesign" type="numeric"  default="0">
		<cfparam name="params.performanceDesign" type="numeric"  default="0">
		<cfparam name="params.outcomesDesign" type="numeric"  default="0">
		<cfparam name="params.competenceEval" type="numeric"  default="0">
		<cfparam name="params.performanceEval" type="numeric"  default="0">
		<cfparam name="params.outcomesEval" type="numeric"  default="0">
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<!---<cfcontent type="text/javascript" />--->
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access save functionality for ACCME information.")>
		
		<cfset status = application.activity.saveACCMEInfo(
														activityId = params.activityId,
														competenceDesign = params.competenceDesign,
														performanceDesign = params.performanceDesign,
														outcomesDesign = params.outcomesDesign,
														competenceEval = params.competenceEval,
														performanceEval = params.performanceEval,
														outcomesEval = params.outcomesEval
														)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveactivity"  output="no">
		<cfparam name="params.ActivityID" default="" type="string" >
		<cfparam name="params.Title" default="" type="string" >
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
		<cfparam name="params.ChangedFields" type="string"  default="" />
		<cfparam name="params.ChangedValues" type="string"  default="" />
		
		<cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access activity save functionality.")>
		
		<cfset Status = Application.Activity.saveActivity(
							activityId=params.ActivityID,
							title=params.Title,
							startDate=params.StartDate,
							endDate=params.EndDate,
							description=params.Description,
							location=params.Location,
							address1=params.Address1,
							address2=params.Address2,
							city=params.City,
							state=Trim(params.State),
							province=params.Province,
							country=params.Country,
							postalcode=params.PostalCode,
							sponsorship=params.Sponsorship,
							sponsor=params.Sponsor,
							externalid=params.ExternalID,
							releasedate=params.ReleaseDate,
							changedfields=params.ChangedFields,
							changedvalues=params.ChangedValues)>
		
		<cfset model("activity").findByKey(params.activityid).save() />
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveAgendaItem"  output="false">
		<cfparam name="params.ActivityID"  type="string">
		<cfparam name="params.AgendaID"  type="string" default="">
		<cfparam name="params.Description"  type="string" default="">
		<cfparam name="params.EventDate"  type="string" default="">
		<cfparam name="params.StartTime"  type="string" default="">
		<cfparam name="params.EndTime"  type="string" default="">
		
		<cfset var Status = "Fail|Cannot access agenda save functionality.">
		
		<cfset Status = Application.Activity.saveAgendaItem(
							params.ActivityID,
							params.AgendaID,
							params.Description,
							params.EventDate,
							params.StartTime,
							params.EndTime)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="saveAttendee"  output="false">
		<cfparam name="params.ActivityID"  type="string">
		<cfparam name="params.PersonID"  type="string">
		<cfparam name="params.MDFlag"  type="string" default="N" />
		
		<cfset var Status = "Fail|Cannot access attendee save functionality.">
		
		<cfset Status = Application.ActivityAttendee.saveAttendee(params.ActivityID,params.PersonID,params.MDFlag)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="saveAttendeeCDC"  output="false" returnFormat="plain">
		<cfparam name="params.AttendeeID" type="numeric" >
		<cfparam name="params.Ethnicity" type="numeric" >
		<cfparam name="params.OMBEthnicity" type="numeric" >
		<cfparam name="params.CBAFundID" type="string" >
		<cfparam name="params.CBACDC" type="string" >
		<cfparam name="params.CBAOth" type="string" >
		<cfparam name="params.CBOFundID" type="string" >
		<cfparam name="params.CBOCDC" type="string" >
		<cfparam name="params.CBOOth" type="string" >
		<cfparam name="params.ProfCId" type="numeric" >
		<cfparam name="params.ProfCOther" type="string" >
		<cfparam name="params.ProfNId" type="numeric" >
		<cfparam name="params.ProfNOther" type="string" >
		<cfparam name="params.FunRCId" type="numeric" >
		<cfparam name="params.FunRCOther" type="string" >
		<cfparam name="params.FunRNId" type="numeric" >
		<cfparam name="params.FunRNOther" type="string" >
		<cfparam name="params.OccClassID" type="numeric" >
		<cfparam name="params.OrgTypeID" type="numeric"  default="">
		<cfparam name="params.OrgTypeOther" type="string" >
		<cfparam name="params.PrinEmpID" type="numeric" >
		<cfparam name="params.PrinEmpOther" type="string" >
		<cfparam name="params.WorkState" type="string" >
		<cfparam name="params.WorkZip" type="numeric" >
		<cfparam name="params.Focus1" type="string"  default="">
		<cfparam name="params.Focus2" type="string"  default="">
		<cfparam name="params.Focus3" type="string"  default="">
		<cfparam name="params.Focus4" type="string"  default="">
		<cfparam name="params.Focus5" type="string"  default="">
		<cfparam name="params.Focus6" type="string"  default="">
		<cfparam name="params.Focus7" type="string"  default="">
		<cfparam name="params.Focus8" type="string"  default="">
		<cfparam name="params.Focus9" type="string"  default="">
		<cfparam name="params.Focus10" type="string"  default="">
		<cfparam name="params.FocusOther" type="string"  default="">
		<cfparam name="params.SpecialPop1" type="string"  default="">
		<cfparam name="params.SpecialPop2" type="string"  default="">
		<cfparam name="params.SpecialPop3" type="string"  default="">
		<cfparam name="params.SpecialPop4" type="string"  default="">
		<cfparam name="params.SpecialPop5" type="string"  default="">
		<cfparam name="params.SpecialPop6" type="string"  default="">
		<cfparam name="params.SpecialPop7" type="string"  default="">
		<cfparam name="params.SpecialPop8" type="string"  default="">
		<cfparam name="params.SpecialPop9" type="string"  default="">
		<cfparam name="params.SpecialPop10" type="string"  default="">
		<cfparam name="params.SpecialPop11" type="string"  default="">
		<cfparam name="params.SpecialPop12" type="string"  default="">
		<cfparam name="params.SpecialPop13" type="string"  default="">
		<cfparam name="params.SpecialPop14" type="string"  default="">
		<cfparam name="params.SpecialPop15" type="string"  default="">
		<cfparam name="params.SpecialPop16" type="string"  default="">
		<cfparam name="params.SpecialPop17" type="string"  default="">
		<cfparam name="params.SpecialPop18" type="string"  default="">
		<cfparam name="params.SpecialPopOther" type="string"  default="">
		<cfparam name="params.MarketID" type="string" >
		<cfparam name="params.MarketOther" type="string" >
		<cfparam name="params.ContactUpdates" type="string" >
		<cfparam name="params.ContactEval" type="string" >
		<cfparam name="params.PTCAlert" type="string" >
		<cfparam name="params.CurrentlyEnrolled" type="string" >
		
		<cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot PIF information due to unknown reasons.")>
		
		<cfset status = application.activityAttendee.saveAttendeeCDC(
														AttendeeId = params.AttendeeID,
														EthnicityId = params.Ethnicity,
														OMBEthnicityId = params.OMBEthnicity,
														CBAFundID = params.CBAFundID,
														CBACDC = params.CBACDC,
														CBAOth = params.CBAOth,
														CBOFundID = params.CBOFundID,
														CBOCDC = params.CBOCDC,
														CBOOth = params.CBOOth,
														ProfCId = params.ProfCId,
														ProfCOther = params.ProfCOther,
														ProfNId = params.ProfNId,
														ProfNOther = params.ProfNOther,
														FunRCId = params.FunRCId,
														FunRCOther = params.FunRCOther,
														FunRNId = params.FunRNId,
														OccClassID = params.OccClassID,
														OrgTypeID = params.OrgTypeID,
														FunRNOther = params.FunRNOther,
														OccClassID = params.OccClassID,
														OccClassID = params.OccClassID,
														OrgTypeOther = params.OrgTypeOther,
														PrinEmpID = params.PrinEmpID,
														PrinEmpOther = params.PrinEmpOther,
														WorkState = params.WorkState,
														WorkZip = params.WorkZip,
														Focus1 = params.Focus1,
														Focus2 = params.Focus2,
														Focus3 = params.Focus3,
														Focus4 = params.Focus4,
														Focus5 = params.Focus5,
														Focus6 = params.Focus6,
														Focus7 = params.Focus7,
														Focus8 = params.Focus8,
														Focus9 = params.Focus9,
														Focus10 = params.Focus10,
														FocusOther = params.FocusOther,
														SpecialPop1 = params.SpecialPop1,
														SpecialPop2 = params.SpecialPop2,
														SpecialPop3 = params.SpecialPop3,
														SpecialPop4 = params.SpecialPop4,
														SpecialPop5 = params.SpecialPop5,
														SpecialPop6 = params.SpecialPop6,
														SpecialPop7 = params.SpecialPop7,
														SpecialPop8 = params.SpecialPop8,
														SpecialPop9 = params.SpecialPop9,
														SpecialPop10 = params.SpecialPop10,
														SpecialPop11 = params.SpecialPop11,
														SpecialPop12 = params.SpecialPop12,
														SpecialPop13 = params.SpecialPop13,
														SpecialPop14 = params.SpecialPop14,
														SpecialPop15 = params.SpecialPop15,
														SpecialPop16 = params.SpecialPop16,
														SpecialPop17 = params.SpecialPop17,
														SpecialPop18 = params.SpecialPop18,
														SpecialPopOther = params.SpecialPopOther,
														MarketID = params.MarketID,
														MarketOther = params.MarketOther,
														ContactUpdates = params.ContactUpdates,
														ContactEval = params.ContactEval,
														PTCAlert = params.PTCAlert,
														PTCTraining = params.PTCTraining,
														CurrentlyEnrolled = params.CurrentlyEnrolled,
														PrimaryMotivation = params.PrimaryMotivation)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveAttendeeDate" hint="Saves date info for attendee to provided attendee db field.">
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<!--- <cfcontent type="text/javascript" /> --->
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access update function for attendee dates.")>

		<cfset Status = Application.ActivityAttendee.saveAttendeeDate(params.AttendeeID,params.currStatusdate,params.currStatusId)>
			
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveBudget" hint="Saves provided information as a budget entry."  output="false">
		<cfparam name="params.ActivityID" type="numeric" >
		<cfparam name="params.BudgetID" type="numeric" >
		<cfparam name="params.Description" type="string" >
		<cfparam name="params.EntryType" type="numeric" >
		<cfparam name="params.Amount" type="numeric" >
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access budget save functionality for activity finances.")>
		
		<cfset status = Application.ActivityFinance.saveBudget(params.ActivityID,params.BudgetID,params.Description,params.EntryType,params.Amount)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveCategory"  output="false">
		<cfparam name="params.ActivityID"  type="string">
		<cfparam name="params.CategoryID"  type="string">
		
		<cfset var Status = "Fail|Cannot access category save functionality for activities.">
		
		<cfset Status = Application.Activity.saveCategory(params.ActivityID,params.CategoryID)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="saveCategoriesLMS"  output="false">
		<cfparam name="params.ActivityID" default="" type="string" >
		<cfparam name="params.Site" default="" type="string" >
		
		<cfset var Status = "fail">
		
		<cfset Status = Application.ActivityPublish.saveCategoriesLMS(params.ActivityID,params.Site)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="saveCommitteeMember"  output="false">
		<cfparam name="params.ActivityID"  type="string">
		<cfparam name="params.PersonID"  type="string">
		
		<cfset var Status = "Fail|Cannot access faculty saving functionality.">
		
		<cfset Status = Application.ActivityPeople.saveCommitteeMember(params.ActivityID,params.PersonID)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="saveFacultyMember"  output="false">
		<cfparam name="params.ActivityID"  type="string">
		<cfparam name="params.PersonID"  type="string">
		
		<cfset var Status = "Fail|Cannot access faculty saving functionality.">
		
		<cfset Status = Application.ActivityPeople.saveFacultyMember(params.ActivityID,params.PersonID)>
		
		<cfset renderText(Status) />
	</cffunction>

	<cffunction name="saveFee"  ouput="true">
		<cfparam name="params.FeeID"  default="0">
		<cfparam name="params.ActivityID" >
		<cfparam name="params.Name" >
		<cfparam name="params.StartDate" >
		<cfparam name="params.StartTime" >
		<cfparam name="params.EndDate" >
		<cfparam name="params.EndTime" >
		<cfparam name="params.Amount" >
		
		<cfset var Status = "Fail|Cannot access fee saving functionality for activity finances.">
		
		<cfset Status = Application.ActivityFinance.saveFee(
							params.FeeID,
							params.ActivityID,
							params.Name,
							params.StartDate,
							params.StartTime,
							params.EndDate,
							params.EndTime,
							params.Amount)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="saveLedger" hint="Saves ledger information."  output="false">
		<cfparam name="params.ActivityID" type="numeric" >
		<cfparam name="params.EntryID" type="numeric" >
		<cfparam name="params.Description" type="string" >
		<cfparam name="params.Memo" type="string" >
		<cfparam name="params.EntryDate" type="date" >
		<cfparam name="params.EntryType" type="numeric" >
		<cfparam name="params.Amount" type="numeric" >
		
		<cfset var Status = "Fail|Cannot access fee saving functionality for activity finances.">
		
		<cfset Status = Application.ActivityFinance.saveLedger(
							params.ActivityID,
							params.EntryID,
							params.Description,
							params.Memo,
							params.EntryDate,
							params.EntryType,
							params.Amount)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>

	<cffunction name="saveNote"  output="false">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.NoteBody" type="string">
		<cfparam name="params.NoteID"  default="0">
		
		<cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access note saving functionality for activities.")>
		
		<cfset status = Application.Activity.saveNote(params.ActivityID,params.NoteBody,params.NoteID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="savePubGeneral" displayname="Save Form"  output="no">
		<cfparam name="params.ActivityID" type="string"  />
		<cfparam name="params.Overview" type="string"  />
		<cfparam name="params.Objectives" type="string"  />
		<cfparam name="params.Keywords" type="string"  />
		<cfparam name="params.PublishDate" type="string"  />
		<cfparam name="params.RemoveDate" type="string"  />
		<cfparam name="params.PaymentFlag" type="string"  />
		<cfparam name="params.PaymentFee" type="string"  />
		<cfparam name="params.FeaturedFlag" type="string"  default="N" />
		<cfparam name="params.ExtHostFlag" type="string"  default="N" />
		<cfparam name="params.ExtHostLink" type="string"  default="" />
		<cfparam name="params.AllowCommentFlag" type="string"  />
		<cfparam name="params.CommentApproveFlag" type="string"  />
		<cfparam name="params.NotifyEmails" type="string"  />
		<cfparam name="params.TermsFlag" type="string"  />
		<cfparam name="params.TermsText" type="string"  />
		<cfparam name="params.RestrictedFlag" type="string"  />
		
		<cfset var Status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access general publish save functionality currently.  Please contact technical support and try again later.")>
		
		<cfset status = Application.ActivityPublish.savePubGeneral(
							params.ActivityID,
							params.Overview,
							params.Objectives,
							params.Keywords,
							params.PublishDate,
							params.RemoveDate,
							params.PaymentFlag,
							params.PaymentFee,
							params.FeaturedFlag,
							params.ExtHostFlag,
							params.ExtHostLink,
							params.AllowCommentFlag,
							params.CommentApproveFlag,
							params.NotifyEmails,
							params.TermsFlag,
							params.TermsText,
							params.RestrictedFlag)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveSpecialties"  output="false">
		<cfparam name="params.ActivityID" default="" type="string" >
		<cfparam name="params.Specialties" default="" type="string" >
		
		<cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access specialty saving functionality for activities.")>
		
		<cfset Status = Application.ActivityPublish.saveSpecialties(params.ActivityID,params.Specialties)>
		
		<cfset renderText(Status.getJSON()) />
	</cffunction>
	
	<cffunction name="saveSupport"  output="false">
		<cfparam name="params.SupportID"  default="-1" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.Supporter" type="string">
		<cfparam name="params.SupportType" type="string">
		<cfparam name="params.Amount" type="string">
		<cfparam name="params.ContractNum"  type="string" default="">
		<cfparam name="params.BudgetRequested"  type="string" default="">
		<cfparam name="params.BudgetDueDate"  type="string" default="">
		<cfparam name="params.BudgetSentDate"  type="string" default="">
		<cfparam name="params.SentDate"  type="string" default="">
		<cfparam name="params.FundsReturned"  type="string" default="">
		
		<cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access the save function for activity finances.")>
		
		<cfset Status = Application.ActivityFinance.saveSupport(
							params.SupportID,
							params.ActivityID,
							params.Supporter,
							params.SupportType,
							params.Amount,
							params.ContractNum,
							params.BudgetRequested,
							params.BudgetDueDate,
							params.BudgetSentDate,
							params.SentDate,
							params.FundsReturned)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="sendcertificate" hint="Sends a copy of the attendee's certificate to the person attached to the attendee."  output="false">
		<cfparam name="params.activityId" type="numeric"  default="0">
		<cfparam name="params.personId" type="numeric"  default="0">
		<cfparam name="params.creditid" type="numeric"  default="1">
		
		<cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access the send certificate function.")>
		
		<cfset status = application.activityAttendee.sendCertificate(
							activityId=params.activityId,
							personId=params.personId,
							creditId=params.creditId)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="UnpublishFile" hint="Unpublishes provided file."  output="false">
		<cfparam name="params.ActivityID" type="numeric" >
		<cfparam name="params.FileID" type="numeric" >
		
		<cfset Status = "Fail|Cannot access the unpublish function for activity documents.">
		
		<cfset Status = Application.ActivityPublish.UnpublishFile(params.ActivityID,params.FileID)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="updateActivityStatus"  output="no" displayname="Set Activity Status">
		<cfparam name="params.ActivityID" type="numeric"  />
		<cfparam name="params.StatusID" type="numeric"  />
		
		<cfset Status = "Fail">
		
		<cfset Status = Application.Activity.updateStatus(params.ActivityID,params.StatusID)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="updateAddlAttendees"  output="false">
		<cfparam name="params.ActivityID" type="string" />
		<cfparam name="params.AddlAttendees" type="string" />
		
		<cfset var Status = "Fail|Cannot access the update function for additional attendees.">
		
		<cfset Status = Application.Activity.updateAddlAttendees(params.ActivityID,params.AddlAttendees)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="updateApplicationValue"  output="false">
		<cfparam name="params.ActivityID"  type="string">
		<cfparam name="params.Field"  type="string"> <!--- "Received, Sent, Approved, etc." --->
		<cfparam name="params.Flag"  type="string">
		<cfparam name="params.AppDate"  type="string">
		
		<cfset var Status = "Fail|Cannot access update functionality for activity applications.">
		
		<cfset Status = Application.Activity.updateApplicationValue(params.ActivityID,params.Field,params.Flag,params.AppDate)>
		
		<cfset renderText(Status) />
	</cffunction>

	<cffunction name="updateAttendeeStatuses"  output="false">
		<cfparam name="params.AttendeeList" type="string">
		<cfparam name="params.ActivityID" type="string">
		<cfparam name="params.StatusID" type="string">
		
		<cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access the status update functionality for attendees.")>
		
		<cfset status = Application.ActivityAttendee.updateStatuses(params.AttendeeList,params.ActivityID,params.StatusID)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
	
	<cffunction name="updateMaxRegistrants"  output="false">
		<cfparam name="params.ActivityID" type="string" />
		<cfparam name="params.MaxRegistrants" type="string" />
		
		<cfset var Status = "Fail|Cannot access the update function for max registrants.">
		
		<cfset Status = Application.Activity.updateMaxRegistrants(params.ActivityID,params.MaxRegistrants)>
		
		<cfset renderText(Status) />
	</cffunction>
	
	<cffunction name="updateMDStatus"  output="false">
		<cfparam name="params.attendeeId" type="string">
		<cfparam name="params.MDNonMD" type="string">
		
		<cfset var status = createObject("component","#application.settings.com#returnData.buildStruct").init()>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access the update function for attendee MD status.")>
		<cfset status = Application.ActivityAttendee.updateMDStatus(params.attendeeId,params.MDNonMD)>
		
		<cfset renderText(status.getJSON()) />
	</cffunction>
</cfcomponent>