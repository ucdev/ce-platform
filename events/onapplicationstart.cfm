<!---
<cfset application.javaloader = javaLoader() />
<cfset doLessGeneration = LessEngine(['bootstrap.less']) />
<cfset application.sengrid = createObject("component","lib.sendgrid").init(api_user='joshuairl',api_key='cfr010408') />
--->

<cfset application.version_token = "v3" />
<cfset application.messages = [] />

<!--- GENERATE CSS --->
<cfset generateBundle(type="css", bundle="ce", compress=true, sources="bootstrap,jquery.ui,ccpd") />

<cfset js = [] /> 
<cfset jsScaffolded = [] />

<!--- GENERATE JS --->
<cffunction name="$$singularize" returntype="string" access="public" output="false" hint="Returns the singular form of the passed in word."
	examples=
	'
		<!--- Singularize a word, will result in "language" --->
		##singularize("languages")##
	'
	categories="global,string" chapters="miscellaneous-helpers" functions="capitalize,humanize,pluralize">
	<cfargument name="word" type="string" required="true" hint="String to singularize.">
	<cfreturn $singularizeOrPluralize(text=arguments.word, which="singularize")>
</cffunction>

<cfdirectory action="list" directory="#expandPath('/javascripts/app/controllers')#" filter="*.js" name="jsList">
<cfset baseDirPriority = "models,collections,controllers,routers,views" />
<cfset baseViewFiles = "row,index,edit,show" />

<cfloop query="jsList">
	<cfloop list="#baseDirPriority#" index="key" delimiters=",">
		<cfset fileLoc = "" />
		
		<cfswitch expression="#key#">
			<cfcase value="models">
				<cfset fileLoc = "/app/#key#/#$$singularize(replace(jsList.name,'.js',''))#" />
				<cfset jsScaffolded.add(fileLoc)>
			</cfcase>
			<cfcase value="views">
				<cfloop list="#baseViewFiles#" index="viewFile" delimiters=",">
					<cfset fileLoc = "/app/#key#/#replace(jsList.name,'.js','')#/#viewFile#" />
					<cfset jsScaffolded.add(fileLoc)>
				</cfloop>
			</cfcase>
			<cfdefaultcase>
				<cfset fileLoc = "/app/#key#/#replace(jsList.name,'.js','')#" />
				<cfset jsScaffolded.add(fileLoc)>
			</cfdefaultcase>
		</cfswitch>
	</cfloop>
</cfloop>

<cfscript>
js.addAll([
// GLOBAL VENDORS (avoid putting things here, try to embed / nest it within our "app" module system)
/* jQuery, jQuery UI */
"vendor/jquery/jquery",
"vendor/jquery/jquery-ui-1.8.21.custom.min",

/* Underscore */
"vendor/backbone/underscore",

/* Backbone */
"vendor/backbone/backbone",
"vendor/backbone/backbone.marionette",

/* jQuery Plugins */
"vendor/jquery/jquery.form.js",
"vendor/jquery/jquerymx-3.2.custom.js",
"vendor/jquery/jquery.qtip.js",
"vendor/jquery/jquery.blockUI",
"vendor/jquery/jquery.cfjs.packed",
"vendor/jquery/jquery.maskedinput-1.1.3.pack",
"vendor/jquery/jquery.tokenInput",
"vendor/jquery/jquery.pjax.js",

/* Twitter Bootstrap JS */
"vendor/bootstrap/bootstrap-transition",
"vendor/bootstrap/bootstrap-alert",
"vendor/bootstrap/bootstrap-modal",
"vendor/bootstrap/bootstrap-dropdown",
"vendor/bootstrap/bootstrap-scrollspy",
"vendor/bootstrap/bootstrap-tab",
"vendor/bootstrap/bootstrap-tooltip",
"vendor/bootstrap/bootstrap-popover",
"vendor/bootstrap/bootstrap-button",
"vendor/bootstrap/bootstrap-collapse",
"vendor/bootstrap/bootstrap-carousel",
"vendor/bootstrap/bootstrap-typeahead",

// APPLICATION JS
/* ce */
"app/app",

/* ce.log */
"app/log",

/* ce.global */
"app/global",
"app/global/alerts",

/* ce.vendor [Nested Vendors (try to put jquery plugins within modules of our system, similar to "ui.typeahead"] */
"app/vendor/mustache",

/* ce.ui */
"app/ui",
"app/ui/typeahead",
"app/ui/tokenizer",
"app/ui/actionMenu"
]);

<!--- SCAFFOLDED MVC STUFF --->
js.addAll(jsScaffolded);

js.addAll([
"app/user", // ce.user
"app/user/events", // ce.user.events
"app/user/auth", // ce.user.auth
"app/activity", // ce.activity
"app/activity/participants", // ce.activity.participants
"app/activity/participants/row", // ce.activity.participants.row
"app/person" // ce.person
]);
</cfscript>

<cfset generateBundle(type="js", bundle="ce", compress=true, sources="#arrayToList(js,',')#") />

<cfset application['config'] = {} />
<cfset application.config['name'] = "CCPD" />

<!--- COM OBJECTS --->
<cfset application['settings'] = {} />
<cfset application.settings['com'] = "_com." />
<cfset application.settings['dsn'] = get("dataSourceName") />
<cfset application.settings['weburl'] = 'http://dev.ccpd.uc.edu/' />
<cfset application['email'] = CreateObject("component","#Application.Settings.Com#email").Init()>
<cfset application['search'] = createObject("component","_com.typeahead.search").init(application.settings.dsn) />

<!--- COMPONENTS --->
<cfset application['com'] = {} />
<cfset application.com['AccountDAO'] = CreateObject("component","#Application.Settings.Com#Account.AccountDAO").Init(Application.Settings.DSN)>
<cfset application.com['AccountGateway'] = CreateObject("component","#Application.Settings.Com#Account.AccountGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActionDAO'] = CreateObject("component","#Application.Settings.Com#Action.ActionDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActionGateway'] = CreateObject("component","#Application.Settings.Com#Action.ActionGateway").Init(Application.Settings.DSN)>
<cfset application.com['AgendaDAO'] = CreateObject("component","#Application.Settings.Com#Agenda.AgendaDAO").Init(Application.Settings.DSN)>
<cfset application.com['AgendaGateway'] = CreateObject("component","#Application.Settings.Com#Agenda.AgendaGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessmentDAO'] = CreateObject("component","#Application.Settings.Com#Assessment.AssessmentDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessmentGateway'] = CreateObject("component","#Application.Settings.Com#Assessment.AssessmentGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessTmplDAO'] = CreateObject("component","#Application.Settings.Com#AssessTmpl.AssessTmplDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessTmplGateway'] = CreateObject("component","#Application.Settings.Com#AssessTmpl.AssessTmplGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessAnswerDAO'] = CreateObject("component","#Application.Settings.Com#AssessAnswer.AssessAnswerDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessAnswerGateway'] = CreateObject("component","#Application.Settings.Com#AssessAnswer.AssessAnswerGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessQuestionDAO'] = CreateObject("component","#Application.Settings.Com#AssessQuestion.AssessQuestionDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessQuestionGateway'] = CreateObject("component","#Application.Settings.Com#AssessQuestion.AssessQuestionGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessResultDAO'] = CreateObject("component","#Application.Settings.Com#AssessResult.AssessResultDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessResultGateway'] = CreateObject("component","#Application.Settings.Com#AssessResult.AssessResultGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessSectionDAO'] = CreateObject("component","#Application.Settings.Com#AssessSection.AssessSectionDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessSectionGateway'] = CreateObject("component","#Application.Settings.Com#AssessSection.AssessSectionGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessmentDAO'] = CreateObject("component","#Application.Settings.Com#Assessment.AssessmentDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessmentGateway'] = CreateObject("component","#Application.Settings.Com#Assessment.AssessmentGateway").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeDAO'] = CreateObject("component","#Application.Settings.Com#Attendee.AttendeeDAO").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeGateway'] = CreateObject("component","#Application.Settings.Com#Attendee.AttendeeGateway").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeCreditDAO'] = CreateObject("component","#Application.Settings.Com#AttendeeCredit.AttendeeCreditDAO").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeCreditGateway'] = CreateObject("component","#Application.Settings.Com#AttendeeCredit.AttendeeCreditGateway").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeCDCDAO'] = CreateObject("component","#Application.Settings.Com#Attendee.AttendeeCDCDAO").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeCDCGateway'] = CreateObject("component","#Application.Settings.Com#Attendee.AttendeeCDCGateway").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeStatusDAO'] = CreateObject("component","#Application.Settings.Com#AttendeeStatus.AttendeeStatusDAO").Init(Application.Settings.DSN)>
<cfset application.com['AttendeeStatusGateway'] = CreateObject("component","#Application.Settings.Com#AttendeeStatus.AttendeeStatusGateway").Init(Application.Settings.DSN)>
<cfset application.com['AddressTypeDAO'] = CreateObject("component","#Application.Settings.Com#AddressType.AddressTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['AddressTypeGateway'] = CreateObject("component","#Application.Settings.Com#AddressType.AddressTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['CategoryDAO'] = CreateObject("component","#Application.Settings.Com#Category.CategoryDAO").Init(Application.Settings.DSN)>
<cfset application.com['CategoryGateway'] = CreateObject("component","#Application.Settings.Com#Category.CategoryGateway").Init(Application.Settings.DSN)>
<cfset application.com['ComponentDAO'] = CreateObject("component","#Application.Settings.Com#System.ComponentDAO").Init(Application.Settings.DSN)>
<cfset application.com['ComponentGateway'] = CreateObject("component","#Application.Settings.Com#System.ComponentGateway").Init(Application.Settings.DSN)>
<cfset application.com['CommentDAO'] = CreateObject("component","#Application.Settings.Com#Comment.CommentDAO").Init(Application.Settings.DSN)>
<cfset application.com['CommentGateway'] = CreateObject("component","#Application.Settings.Com#Comment.CommentGateway").Init(Application.Settings.DSN)>
<cfset application.com['CreditDAO'] = CreateObject("component","#Application.Settings.Com#System.CreditDAO").Init(Application.Settings.DSN)>
<cfset application.com['CreditGateway'] = CreateObject("component","#Application.Settings.Com#System.CreditGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityDAO'] = CreateObject("component","#Application.Settings.Com#Activity.ActivityDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityGateway'] = CreateObject("component","#Application.Settings.Com#Activity.ActivityGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCategoryDAO'] = CreateObject("component","#Application.Settings.Com#ActivityCategory.ActivityCategoryDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCategoryGateway'] = CreateObject("component","#Application.Settings.Com#ActivityCategory.ActivityCategoryGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityApplicationDAO'] = CreateObject("component","#Application.Settings.Com#ActivityApplication.ActivityApplicationDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityApplicationGateway'] = CreateObject("component","#Application.Settings.Com#ActivityApplication.ActivityApplicationGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCommitteeDAO'] = CreateObject("component","#Application.Settings.Com#ActivityCommittee.ActivityCommitteeDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCommitteeGateway'] = CreateObject("component","#Application.Settings.Com#ActivityCommittee.ActivityCommitteeGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityPubGeneralDAO'] = CreateObject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneralDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityPubGeneralGateway'] = CreateObject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneralGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityPubComponentDAO'] = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponentDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityPubComponentGateway'] = CreateObject("component","#Application.Settings.Com#ActivityPubComponent.ActivityPubComponentGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityFacultyDAO'] = CreateObject("component","#Application.Settings.Com#ActivityFaculty.ActivityFacultyDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityFacultyGateway'] = CreateObject("component","#Application.Settings.Com#ActivityFaculty.ActivityFacultyGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityOtherDAO'] = CreateObject("component","#Application.Settings.Com#ActivityOther.ActivityOtherDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityOtherGateway'] = CreateObject("component","#Application.Settings.Com#ActivityOther.ActivityOtherGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivitySupportDAO'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.SupportDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivitySupportGateway'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.SupportGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityBudgetDAO'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.BudgetDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityBudgetGateway'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.BudgetGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityLedgerDAO'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.LedgerDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityLedgerGateway'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.LedgerGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityFeeDAO'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.FeeDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityFeeGateway'] = CreateObject("component","#Application.Settings.Com#ActivityFinance.FeeGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCreditDAO'] = CreateObject("component","#Application.Settings.Com#ActivityCredit.ActivityCreditDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCreditGateway'] = CreateObject("component","#Application.Settings.Com#ActivityCredit.ActivityCreditGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityNoteDAO'] = CreateObject("component","#Application.Settings.Com#ActivityNote.ActivityNoteDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityNoteGateway'] = CreateObject("component","#Application.Settings.Com#ActivityNote.ActivityNoteGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityOtherDAO'] = CreateObject("component","#Application.Settings.Com#ActivityOther.ActivityOtherDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityOtherGateway'] = CreateObject("component","#Application.Settings.Com#ActivityOther.ActivityOtherGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCategoryLMSDAO'] = CreateObject("component","#Application.Settings.Com#ActivityCategoryLMS.ActivityCategoryLMSDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityCategoryLMSGateway'] = CreateObject("component","#Application.Settings.Com#ActivityCategoryLMS.ActivityCategoryLMSGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityPrereqDAO'] = CreateObject("component","#Application.Settings.Com#ActivityPrereq.ActivityPrereqDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityPrereqGateway'] = CreateObject("component","#Application.Settings.Com#ActivityPrereq.ActivityPrereqGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivitySpecialtyDAO'] = CreateObject("component","#Application.Settings.Com#ActivitySpecialtyLMS.ActivitySpecialtyLMSDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivitySpecialtyGateway'] = CreateObject("component","#Application.Settings.Com#ActivitySpecialtyLMS.ActivitySpecialtyLMSGateway").Init(Application.Settings.DSN)>
<cfset application.com['ActivityTypeDAO'] = CreateObject("component","#Application.Settings.Com#System.ActivityTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['ActivityTypeGateway'] = CreateObject("component","#Application.Settings.Com#System.ActivityTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessResultStatusDAO'] = CreateObject("component","#Application.Settings.Com#System.AssessResultStatusDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessResultStatusGateway'] = CreateObject("component","#Application.Settings.Com#System.AssessResultStatusGateway").Init(Application.Settings.DSN)>
<cfset application.com['DegreeDAO'] = CreateObject("component","#Application.Settings.Com#System.DegreeDAO").Init(Application.Settings.DSN)>
<cfset application.com['DegreeGateway'] = CreateObject("component","#Application.Settings.Com#System.DegreeGateway").Init(Application.Settings.DSN)>
<cfset application.com['GroupingDAO'] = CreateObject("component","#Application.Settings.Com#System.GroupingDAO").Init(Application.Settings.DSN)>
<cfset application.com['GroupingGateway'] = CreateObject("component","#Application.Settings.Com#System.GroupingGateway").Init(Application.Settings.DSN)>
<cfset application.com['imageDAO'] = CreateObject("component","#Application.Settings.Com#image.imageDAO").Init(Application.Settings.DSN)>
<cfset application.com['imageGateway'] = CreateObject("component","#Application.Settings.Com#image.imageGateway").Init(Application.Settings.DSN)>
<cfset application.com['image'] = CreateObject("component","#Application.Settings.Com#image.imageService").Init(Application.com.imageDao,application.com.imageGateway)>
<cfset application.com['imageTypeDAO'] = CreateObject("component","#Application.Settings.Com#imageType.imageTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['imageTypeGateway'] = CreateObject("component","#Application.Settings.Com#imageType.imageTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['imageType'] = CreateObject("component","#Application.Settings.Com#imageType.imageTypeService").Init(Application.com.imageTypeDao,application.com.imageTypeGateway)>
<cfset application.com['EntryTypeDAO'] = CreateObject("component","#Application.Settings.Com#System.EntryTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['EntryTypeGateway'] = CreateObject("component","#Application.Settings.Com#System.EntryTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['FileDAO'] = CreateObject("component","#Application.Settings.Com#File.FileDAO").Init(Application.Settings.DSN)>
<cfset application.com['FileGateway'] = CreateObject("component","#Application.Settings.Com#File.FileGateway").Init(Application.Settings.DSN)>
<cfset application.com['FileTypeDAO'] = CreateObject("component","#Application.Settings.Com#System.FileTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['FileTypeGateway'] = CreateObject("component","#Application.Settings.Com#System.FileTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['HistoryStyleDAO'] = CreateObject("component","#Application.Settings.Com#HistoryStyle.HistoryStyleDAO").Init(Application.Settings.DSN)>
<cfset application.com['HistoryStyleGateway'] = CreateObject("component","#Application.Settings.Com#HistoryStyle.HistoryStyleGateway").Init(Application.Settings.DSN)>
<cfset application.com['EmailStyleDAO'] = CreateObject("component","#Application.Settings.Com#EmailStyle.EmailStyleDAO").Init(Application.Settings.DSN)>
<cfset application.com['EmailStyleGateway'] = CreateObject("component","#Application.Settings.Com#EmailStyle.EmailStyleGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonDAO'] = CreateObject("component","#Application.Settings.Com#Person.PersonDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonGateway'] = CreateObject("component","#Application.Settings.Com#Person.PersonGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonAddressDAO'] = CreateObject("component","#Application.Settings.Com#PersonAddress.PersonAddressDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonAddressGateway'] = CreateObject("component","#Application.Settings.Com#PersonAddress.PersonAddressGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonDegreeDAO'] = CreateObject("component","#Application.Settings.Com#PersonDegree.PersonDegreeDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonDegreeGateway'] = CreateObject("component","#Application.Settings.Com#PersonDegree.PersonDegreeGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonNewDAO'] = CreateObject("component","#Application.Settings.Com#Person.PersonDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonNewGateway'] = CreateObject("component","#Application.Settings.Com#Person.PersonGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonEmailDAO'] = CreateObject("component","#Application.Settings.Com#PersonEmail.PersonEmailDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonEmailGateway'] = CreateObject("component","#Application.Settings.Com#PersonEmail.PersonEmailGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonFileDAO'] = CreateObject("component","#Application.Settings.Com#PersonFile.PersonFileDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonFileGateway'] = CreateObject("component","#Application.Settings.Com#PersonFile.PersonFileGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonNoteDAO'] = CreateObject("component","#Application.Settings.Com#PersonNote.PersonNoteDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonNoteGateway'] = CreateObject("component","#Application.Settings.Com#PersonNote.PersonNoteGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonPrefDAO'] = CreateObject("component","#Application.Settings.Com#PersonPref.PersonPrefDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonPrefGateway'] = CreateObject("component","#Application.Settings.Com#PersonPref.PersonPrefGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonStatusDAO'] = CreateObject("component","#Application.Settings.Com#System.PersonStatusDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonStatusGateway'] = CreateObject("component","#Application.Settings.Com#System.PersonStatusGateway").Init(Application.Settings.DSN)>
<cfset application.com['ProcessDAO'] = CreateObject("component","#Application.Settings.Com#Process.ProcessDAO").Init(Application.Settings.DSN)>
<cfset application.com['ProcessGateway'] = CreateObject("component","#Application.Settings.Com#Process.ProcessGateway").Init(Application.Settings.DSN)>
<cfset application.com['ProcessManagerDAO'] = CreateObject("component","#Application.Settings.Com#ProcessManager.ProcessManagerDAO").Init(Application.Settings.DSN)>
<cfset application.com['ProcessManagerGateway'] = CreateObject("component","#Application.Settings.Com#ProcessManager.ProcessManagerGateway").Init(Application.Settings.DSN)>
<cfset application.com['ProcessStepDAO'] = CreateObject("component","#Application.Settings.Com#ProcessStep.ProcessStepDAO").Init(Application.Settings.DSN)>
<cfset application.com['ProcessStepGateway'] = CreateObject("component","#Application.Settings.Com#ProcessStep.ProcessStepGateway").Init(Application.Settings.DSN)>
<cfset application.com['ProcessStepActivityDAO'] = CreateObject("component","#Application.Settings.Com#ProcessStepActivity.ProcessStepActivityDAO").Init(Application.Settings.DSN)>
<cfset application.com['ProcessStepActivityGateway'] = CreateObject("component","#Application.Settings.Com#ProcessStepActivity.ProcessStepActivityGateway").Init(Application.Settings.DSN)>
<cfset application.com['RoleDAO'] = CreateObject("component","#Application.Settings.Com#Role.RoleDAO").Init(Application.Settings.DSN)>
<cfset application.com['RoleGateway'] = CreateObject("component","#Application.Settings.Com#Role.RoleGateway").Init(Application.Settings.DSN)>
<cfset application.com['StatusDAO'] = CreateObject("component","#Application.Settings.Com#System.StatusDAO").Init(Application.Settings.DSN)>
<cfset application.com['StatusGateway'] = CreateObject("component","#Application.Settings.Com#System.StatusGateway").Init(Application.Settings.DSN)>
<cfset application.com['PersonStatusDAO'] = CreateObject("component","#Application.Settings.Com#System.PersonStatusDAO").Init(Application.Settings.DSN)>
<cfset application.com['PersonStatusGateway'] = CreateObject("component","#Application.Settings.Com#System.PersonStatusGateway").Init(Application.Settings.DSN)>
<cfset application.com['StepStatusDAO'] = CreateObject("component","#Application.Settings.Com#System.StepStatusDAO").Init(Application.Settings.DSN)>
<cfset application.com['StepStatusGateway'] = CreateObject("component","#Application.Settings.Com#System.StepStatusGateway").Init(Application.Settings.DSN)>
<cfset application.com['SupporterDAO'] = CreateObject("component","#Application.Settings.Com#System.SupporterDAO").Init(Application.Settings.DSN)>
<cfset application.com['SupporterGateway'] = CreateObject("component","#Application.Settings.Com#System.SupporterGateway").Init(Application.Settings.DSN)>
<cfset application.com['SupportTypeDAO'] = CreateObject("component","#Application.Settings.Com#System.SupportTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['SupportTypeGateway'] = CreateObject("component","#Application.Settings.Com#System.SupportTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['CBAFundDAO'] = CreateObject("component","#Application.Settings.Com#System.CBAFundDAO").Init(Application.Settings.DSN)>
<cfset application.com['CBAFundGateway'] = CreateObject("component","#Application.Settings.Com#System.CBAFundGateway").Init(Application.Settings.DSN)>
<cfset application.com['CBOFundDAO'] = CreateObject("component","#Application.Settings.Com#System.CBOFundDAO").Init(Application.Settings.DSN)>
<cfset application.com['CBOFundGateway'] = CreateObject("component","#Application.Settings.Com#System.CBOFundGateway").Init(Application.Settings.DSN)>
<cfset application.com['FunRCDAO'] = CreateObject("component","#Application.Settings.Com#System.FunRCDAO").Init(Application.Settings.DSN)>
<cfset application.com['FunRCGateway'] = CreateObject("component","#Application.Settings.Com#System.FunRCGateway").Init(Application.Settings.DSN)>
<cfset application.com['FunRNDAO'] = CreateObject("component","#Application.Settings.Com#System.FunRNDAO").Init(Application.Settings.DSN)>
<cfset application.com['FunRNGateway'] = CreateObject("component","#Application.Settings.Com#System.FunRNGateway").Init(Application.Settings.DSN)>
<cfset application.com['OccClassDAO'] = CreateObject("component","#Application.Settings.Com#System.OccClassDAO").Init(Application.Settings.DSN)>
<cfset application.com['OccClassGateway'] = CreateObject("component","#Application.Settings.Com#System.OccClassGateway").Init(Application.Settings.DSN)>
<cfset application.com['OrgTypeDAO'] = CreateObject("component","#Application.Settings.Com#System.OrgTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['OrgTypeGateway'] = CreateObject("component","#Application.Settings.Com#System.OrgTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['QuestionTypeDAO'] = CreateObject("component","#Application.Settings.Com#System.AssessQuestionTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['QuestionTypeGateway'] = CreateObject("component","#Application.Settings.Com#System.AssessQuestionTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['ProfCDAO'] = CreateObject("component","#Application.Settings.Com#System.ProfCDAO").Init(Application.Settings.DSN)>
<cfset application.com['ProfCGateway'] = CreateObject("component","#Application.Settings.Com#System.ProfCGateway").Init(Application.Settings.DSN)>
<cfset application.com['ProfNDAO'] = CreateObject("component","#Application.Settings.Com#System.ProfNDAO").Init(Application.Settings.DSN)>
<cfset application.com['ProfNGateway'] = CreateObject("component","#Application.Settings.Com#System.ProfNGateway").Init(Application.Settings.DSN)>
<cfset application.com['MarketDAO'] = CreateObject("component","#Application.Settings.Com#System.MarketDAO").Init(Application.Settings.DSN)>
<cfset application.com['MarketGateway'] = CreateObject("component","#Application.Settings.Com#System.MarketGateway").Init(Application.Settings.DSN)>
<cfset application.com['PrinEmpDAO'] = CreateObject("component","#Application.Settings.Com#System.PrinEmpDAO").Init(Application.Settings.DSN)>
<cfset application.com['PrinEmpGateway'] = CreateObject("component","#Application.Settings.Com#System.PrinEmpGateway").Init(Application.Settings.DSN)>
<cfset application.com['ReportDAO'] = CreateObject("component","#Application.Settings.Com#System.ReportDAO").Init(Application.Settings.DSN)>
<cfset application.com['ReportGateway'] = CreateObject("component","#Application.Settings.Com#System.ReportGateway").Init(Application.Settings.DSN)>
<cfset application.com['AssessmentTypeDAO'] = CreateObject("component","#Application.Settings.Com#System.AssessTypeDAO").Init(Application.Settings.DSN)>
<cfset application.com['AssessmentTypeGateway'] = CreateObject("component","#Application.Settings.Com#System.AssessTypeGateway").Init(Application.Settings.DSN)>
<cfset application.com['CategoryLMSDAO'] = CreateObject("component","#Application.Settings.Com#CategoryLMS.CategoryLMSDAO").Init(Application.Settings.DSN)>
<cfset application.com['CategoryLMSGateway'] = CreateObject("component","#Application.Settings.Com#CategoryLMS.CategoryLMSGateway").Init(Application.Settings.DSN)>
<cfset application.com['SiteDAO'] = CreateObject("component","#Application.Settings.Com#Site.SiteDAO").Init(Application.Settings.DSN)>
<cfset application.com['SiteGateway'] = CreateObject("component","#Application.Settings.Com#Site.SiteGateway").Init(Application.Settings.DSN)>
<cfset application.com['SpecialtyDAO'] = CreateObject("component","#Application.Settings.Com#Specialty.SpecialtyDAO").Init(Application.Settings.DSN)>
<cfset application.com['SpecialtyGateway'] = CreateObject("component","#Application.Settings.Com#Specialty.SpecialtyGateway").Init(Application.Settings.DSN)>
<cfset application['Activity'] = CreateObject("component","#Application.Settings.Com#Public_Activity").Init()>
<cfset application['ActivityAttendee'] = CreateObject("component","#Application.Settings.Com#Public_ActivityAttendee").Init()>
<cfset application['ActivityFinance'] = CreateObject("component","#Application.Settings.Com#Public_ActivityFinance").Init()>
<cfset application['ActivityPeople'] = CreateObject("component","#Application.Settings.Com#Public_ActivityPeople").Init()>
<cfset application['ActivityPublish'] = CreateObject("component","#Application.Settings.Com#Public_ActivityPublish").Init()>
<cfset application['Assessment'] = CreateObject("component","#Application.Settings.Com#Public_Assessment").Init()>
<cfset application['Auth'] = CreateObject("component","#Application.Settings.Com#Public_Auth").Init()>
<cfset application['Builder'] = CreateObject("component","#Application.Settings.Com#Public_Builder").Init()>
<cfset application['History'] = CreateObject("component","#Application.Settings.Com#History").Init()>
<cfset application['Person'] = CreateObject("component","#Application.Settings.Com#Public_Person").init()>
<cfset application['Renderer'] = CreateObject("component","#Application.Settings.Com#Renderer").Init()>
<cfset application['System'] = CreateObject("component","#Application.Settings.Com#Public_Sys").init()>
<cfset application['UDF'] = CreateObject("component","#Application.Settings.Com#UDF").init()>

<cfset application['list'] = {} />
<cfset application.list['FunRC'] = Application.Com.FunRCGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['FunRN'] = Application.Com.FunRNGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['OccClass'] = Application.Com.OccClassGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['OrgType'] = Application.Com.OrgTypeGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['ProfC'] = Application.Com.ProfCGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['ProfN'] = Application.Com.ProfNGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['Market'] = Application.Com.MarketGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['PrinEmp'] = Application.Com.PrinEmpGateway.getByAttributes(OrderBy='Name')>
<cfset application.list['StepStatus'] = Application.Com.StepStatusGateway.getByAttributes(OrderBy='Name')>
<cfset application['RenderPod'] = CreateObject("component","#Application.Settings.Com#RenderPod").init()>
<cfset application.list['AddressTypes'] = Application.Com.AddressTypeGateway.getByAttributes(OrderBy='Description')>
<cfset application.list['AuthLevels'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getAuthLevels()>
<cfset application.list['States'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getStates()>
<cfset application.list['Countries'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getCountries()>
<cfset application.list['HistoryStyles'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getHistoryStyles()>
<cfset application.list['ActivityTypes'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getActivityTypes()>
<cfset application.list['Groupings'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getGroupings()>
<cfset application.list['Credits'] = Application.Com.CreditGateway.getByAttributes(DeletedFlag='N')>
<cfset application.list['Degrees'] = Application.Com.DegreeGateway.getByAttributes(DeletedFlag='N')>
<cfset application.list['OMBEthnicities'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getOMBEthnicities()>
<cfset application.list['PersonStatuses'] = Application.Com.PersonStatusGateway.getByAttributes()>
<cfset application.list['NoiseWords'] = CreateObject("component","#Application.Settings.Com#Config_Lists").getNoiseWords()>
