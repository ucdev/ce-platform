<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset activityTypes = model("sys_activityType").findAll(maxRows=5)>
        <cfset activityCategories = model("Category").findAll(order="name")>
        <cfset activityGroupings = model("sys_grouping").findAll(maxRows=5)>
		<cfset activities = model("activity").findAll(maxRows=100,order="created DESC") />
		
		<cfset pageTitle("Activities") />
		<cfset pageSubTitle("Browse or search activities.") />
		
		<cfif isLoggedin()>
			<cfset subLayout("user") />
		<cfelse>
			<cfset subLayout("guest") />
		</cfif>
	</cffunction>
	<!---
	<cffunction name="edit">
		<cfparam name="params.key" type="integer" />
        
		<cfset $setActivity() />
		
        <cfif NOT isObject(activity)>
	        <cfset flashInsert(error="Activity #params.key# was not found")>
			<cfset redirectTo(action="index")>
        </cfif>
        
		<cfset activityTypes = model("sys_activityType").findAll(maxRows=5)>
        <cfset activityCategories = model("Category").findAll(order="name")>
        <cfset activityGroupings = model("sys_grouping").findAll(maxRows=5)>
        
		
	</cffunction>--->
	
	<cffunction name="adm_credit">
		<cfparam name="params.key" type="integer" />
		<cfparam name="params.credits" default="" />
		
		<cfset attributes.credits = params.credits />
		<cfset $setActivity() />
		<!---Creates the List of Existing Credits for the Activity --->
		<cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=Attributes.ActivityID)>
		<cfset qCredits = Application.Com.CreditGateway.getByAttributes()>
		
		<cfloop query="qCredits">
			<cfparam name="params.CreditAmount#qCredits.CreditID#" default="0" />
			<cfparam name="params.Credits#qCredits.CreditID#" default="0" />
			<cfparam name="params.ReferenceFlag#qCredits.CreditID#" default="N" />
			<cfparam name="params.ReferenceNo#qCredits.CreditID#" default="" />
		</cfloop>
		
		<cfloop query="qCredits">
			<cfset params.Credits = ListAppend(params.Credits,Evaluate("params.Credits#qCredits.CreditID#"),",")>
		</cfloop>
				
		<cfloop query="qActivityCredits">
			<cfset params.Credits = ListAppend(params.Credits,qActivityCredits.CreditID,",")>
			<cfset "params.CreditAmount#qActivityCredits.CreditID#" = qActivityCredits.Amount>
			<cfset "params.ReferenceNo#qActivityCredits.CreditID#" = qActivityCredits.ReferenceNo>
		</cfloop>		
		
	</cffunction>
	
	<cffunction name="adm_participants">
		<cfparam name="params.key" type="integer" />
		<cfparam name="params.status" type="numeric" default="0" />
		
		<cfset $setActivity() />
		
		<!--- LEGACY FIX --->
		<cfset attributes.status = params.status />
		
		<cfset qAttendees = Application.activityAttendee.getAttendees(ActivityID=Attributes.ActivityID,DeletedFlag="N")>
		
		<!--- TOTALATTENDEELIST IS USED FOR SELECTING ALL ATTENDEES IN AN ACTIVITY --->
		<cfset TotalAttendeeList = "">
		<cfset totalCount = qAttendees.recordCount>
		<cfset completeCount = 0>
		<cfset failCount = 0>
		<cfset progressCount = 0>
		<cfset registeredCount = 0>
		
		<cfloop query="qAttendees">
			<cfset TotalAttendeeList = ListAppend(TotalAttendeeList, qAttendees.PersonID,",")>
			
			<cfswitch expression="#qAttendees.statusId#">
				<cfcase value="1">
					<cfset completeCount++>
				</cfcase>
				<cfcase value="2">
					<cfset progressCount++>
				</cfcase>
				<cfcase value="3">
					<cfset registeredCount++>
				</cfcase>
				<cfcase value="4">
					<cfset failCount++>
				</cfcase>
			</cfswitch>
		</cfloop>
		
		<cfif attributes.status EQ 0 AND getToken(cookie.USER_AttendeeStatus,1,"|") EQ attributes.activityid>
			<cfset attributes.status = getToken(cookie.USER_AttendeeStatus,2,"|")>
		</cfif>
		
		<cfif attributes.status GT 0>
			<cfquery name="qTempAttendees" dbtype="query">
				SELECT *
				FROM qAttendees
				WHERE qAttendees.statusId = <cfqueryparam value="#attributes.status#" cfsqltype="cf_sql_integer" />
			</cfquery>
			
			<cfset qAttendees = qTempAttendees>
		</cfif>
		
		<cfset AttendeePager = CreateObject("component","#Application.Settings.Com#Pagination").init()>
		<cfset AttendeePager.setQueryToPaginate(qAttendees)>
		<cfset AttendeePager.setBaseLink("#myself#Activity.Attendees?ActivityID=#Attributes.ActivityID#&status=#attributes.status#") />
		<cfset AttendeePager.setItemsPerPage(15) />
		<cfset AttendeePager.setUrlPageIndicator("page") />
		<cfset AttendeePager.setShowNumericLinks(true) />
		<cfset AttendeePager.setClassName("green") />
		
	</cffunction>
	
	<cffunction name="adm_faculty">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qActivityFacultyList = Application.Com.ActivityFacultyGateway.getByViewAttributes(ActivityID=activity.id,DeletedFlag='N',OrderBy="sr.RoleID DESC, p1.LastName,p1.FirstName")>
		
		
	</cffunction>
	
	<cffunction name="adm_committee">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qCommittee = Application.Com.ActivityCommitteeGateway.getByAttributes(ActivityID=Attributes.ActivityID)>
		
	</cffunction>
	
	<cffunction name="adm_finances">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
	</cffunction>
	<cffunction name="adm_finances_budget">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qFinBudgetList = Application.Com.ActivityBudgetGateway.getByViewAttributes(ActivityID=Attributes.ActivityID,DeletedFlag='N',OrderBy='et.Name')>
		
	</cffunction>
	<cffunction name="adm_finances_ledger">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qFinLedgerList = Application.Com.ActivityLedgerGateway.getByViewAttributes(ActivityID=Attributes.ActivityID,DeletedFlag='N',OrderBy='EntryDate DESC')>
		
	</cffunction>
	<cffunction name="adm_finances_fees">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qFinFeeList = Application.Com.ActivityFeeGateway.getByViewAttributes(ActivityID=Attributes.ActivityID,DeletedFlag='N')>
		
	</cffunction>
	<cffunction name="adm_finances_support">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qSupporterList = Application.Com.SupporterGateway.getByAttributes(DeletedFlag='N',OrderBy='Name')>
		
	</cffunction>
	
	<cffunction name="adm_documents">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qFileList = Application.Com.FileGateway.getByViewAttributes(ActivityID=Attributes.ActivityID,DeletedFlag='N',OrderBy='FileTypeID')>

		
	</cffunction>
	
	<cffunction name="adm_">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
	</cffunction>
	
	<cffunction name="adm_publish">
		<cfparam name="params.key" type="integer" />
		<cfparam name="params.PubGeneralID" default="0" />
		<cfset $setActivity() />
		<cfset attributes.pubGeneralId = params.pubGeneralId />
		
		<cfif NOT IsDefined("Attributes.Submitted")>
			<cfset activityPubGeneral = CreateObject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").Init(ActivityID=Attributes.ActivityID)>
			
			<cfset PubGeneralExists = Application.Com.ActivityPubGeneralDAO.Exists(ActivityPubGeneral)>
			
			<cfif PubGeneralExists>
				<cfset ActivityPubGeneral = Application.Com.ActivityPubGeneralDAO.Read(ActivityPubGeneral)>
				
				<cfset Attributes.Overview = ActivityPubGeneral.getOverview()>
				<cfset Attributes.Keywords = ActivityPubGeneral.getKeywords()>
				<cfset Attributes.Objectives = ActivityPubGeneral.getObjectives()>
				<cfset Attributes.Goals = ActivityPubGeneral.getGoals()>
				<cfset Attributes.PublishDate = DateFormat(ActivityPubGeneral.getPublishDate(),"mm/dd/yyyy")>
				<cfset Attributes.RemoveDate = DateFormat(ActivityPubGeneral.getRemoveDate(),"mm/dd/yyyy")>
				<cfset Attributes.PaymentFlag = ActivityPubGeneral.getPaymentFlag()>
				<cfset Attributes.AllowCommentFlag = ActivityPubGeneral.getAllowCommentFlag()>
				<cfset Attributes.CommentApproveFlag = ActivityPubGeneral.getCommentApproveFlag()>
				<cfset Attributes.NotifyEmails = ActivityPubGeneral.getNotifyEmails()>
				<cfset Attributes.FeaturedFlag = ActivityPubGeneral.getFeaturedFlag()>
				<cfset Attributes.ExtHostFlag = ActivityPubGeneral.getExtHostFlag()>
				<cfset Attributes.ExtHostLink = ActivityPubGeneral.getExtHostLink()>
				<cfset Attributes.PaymentFlag = ActivityPubGeneral.getPaymentFlag()>
				<cfset Attributes.PaymentFee = ActivityPubGeneral.getPaymentFee()>
				<cfset Attributes.PublishFlag = ActivityPubGeneral.getPublishFlag()>
				<cfset Attributes.TermsFlag = ActivityPubGeneral.getTermsFlag()>
				<cfset Attributes.TermsText = ActivityPubGeneral.getTermsText()>
				<cfset Attributes.RestrictedFlag = ActivityPubGeneral.getRestrictedFlag()>
			</cfif>
		</cfif>
		
	</cffunction>
	
	<cffunction name="adm_publish_specialties">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfparam name="params.ActivitySpecialtyList" default="" />
		
		<!--- GET SPECIALTIES FOR CURRENT ACTIVITY --->
		<cfset qActivitySpecialties = Application.Com.ActivitySpecialtyGateway.getByAttributes(ActivityID=Attributes.ActivityID)>
		
		<!--- FILL LIST VARIABLE --->
		<cfloop query="qActivitySpecialties">
			<cfset ActivitySpecialtyList = ListAppend(params.ActivitySpecialtyList, qActivitySpecialties.SpecialtyID, "|")>
			<cfset Attributes.ThisUpdated = qActivitySpecialties.Created>
		</cfloop>
		
		
	</cffunction>
	
	<cffunction name="adm_publish_categories">
		<cfparam name="params.key" type="integer" />
		<cfparam name="params.ActivityCategoryList" default="" />
		
		<cfset $setActivity() />
		
		
		<!--- GET SPECIALTIES FOR CURRENT ACTIVITY --->
		<cfset qActivityCategories = Application.Com.ActivityCategoryLMSGateway.getByAttributes(ActivityID=Attributes.ActivityID)>
		
		<!--- FILL LIST VARIABLE --->
		<cfloop query="qActivityCategories">
			<cfset ActivityCategoryList = ListAppend(params.ActivityCategoryList, qActivityCategories.CategoryID, "|")>
			<cfset Attributes.ThisUpdated = qActivityCategories.Created>
		</cfloop>
		
		
	</cffunction>
	
	<cffunction name="adm_reports">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
	</cffunction>
	
	<cffunction name="adm_history">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
	</cffunction>
	
	<cffunction name="adm_notes">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		<cfset qActivityNotes = Application.Com.ActivityNoteGateway.getByViewAttributes(ActivityID=#Attributes.ActivityID#,DeletedFlag='N',OrderBy='an.Created DESC')>
		
	</cffunction>
	
	<cffunction name="adm_accme">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
	</cffunction>
	
	<cffunction name="adm_cdc">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
		<cfif NOT IsDefined("Attributes.Submitted")>
			<cfset ActivityOtherBean = CreateObject("component","#Application.Settings.Com#ActivityOther.ActivityOther").Init(ActivityID=Attributes.ActivityID)>
			<cfset ActivityOtherExists = Application.Com.ActivityOtherDAO.Exists(ActivityOtherBean)>
			
			<cfif ActivityOtherExists>
				<cfset ActivityOtherBean = Application.Com.ActivityOtherDAO.Read(ActivityOtherBean)>
				
				<cfset Attributes.CollabAgencyFlag = ActivityOtherBean.getCollabAgencyFlag()>
				<cfset Attributes.CollabAgencySpecify = ActivityOtherBean.getCollabAgencySpecify()>
				<cfset Attributes.CollabPTCFlag = ActivityOtherBean.getCollabPTCFlag()>
				<cfset Attributes.CollabPTCSpecify = ActivityOtherBean.getCollabPTCSpecify()>
				<cfset Attributes.DidacticHrs = ActivityOtherBean.getDidacticHrs()>
				<cfset Attributes.ExperimentalHrs = ActivityOtherBean.getExperimentalHrs()>
				<cfset Attributes.OtherID = ActivityOtherBean.getOtherID()>
				<cfset Attributes.SecClinSiteFlag = ActivityOtherBean.getSecClinSiteFlag()>
			</cfif>
		</cfif>
		
	</cffunction>
	
	<cffunction name="adm_agenda">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
	</cffunction>
	
	<cffunction name="adm_app">
		<cfparam name="params.key" type="integer" />
		<cfset $setActivity() />
		
		<cfset ActivityApp = CreateObject("component","#Application.Settings.Com#ActivityApplication.ActivityApplication").Init(ActivityID=params.key)>
		
		<cfif Application.Com.ActivityApplicationDAO.Exists(ActivityApp)>
			<cfset ActivityApp = Application.Com.ActivityApplicationDAO.Read(ActivityApp)>
		<cfelse>
			<cfset Application.Com.ActivityApplicationDAO.Create(ActivityApp)>
		</cfif>
		
		
	</cffunction>
	<!---
	
	<cffunction name="show">
		<cfparam name="params.key" type="integer" />
<cfset $setActivity() />
		<cfset subLayout('show') />
	</cffunction>
	
	--->
	
	<cffunction name="show">
		<cfset activity = model("activity").findByKey(key=params.key, include="activityType,grouping, status", returnAs="query") />
	</cffunction>
</cfcomponent>