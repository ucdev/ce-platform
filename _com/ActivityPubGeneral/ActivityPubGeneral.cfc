<cfcomponent displayname="ActivityPubGeneral" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ActivityPubGeneral.ActivityPubGeneral" output="false">
		<cfargument name="PubGeneralID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="LinkName" type="string" required="false" default="" />
		<cfargument name="Overview" type="string" required="false" default="" />
		<cfargument name="Keywords" type="string" required="false" default="" />
		<cfargument name="Objectives" type="string" required="false" default="" />
		<cfargument name="Goals" type="string" required="false" default="" />
		<cfargument name="PublishFlag" type="string" required="false" default="" />
		<cfargument name="PublishDate" type="string" required="false" default="" />
		<cfargument name="RemoveDate" type="string" required="false" default="" />
		<cfargument name="PaymentFlag" type="string" required="false" default="" />
		<cfargument name="PaymentFee" type="string" required="false" default="" />
		<cfargument name="TermsFlag" type="string" required="false" default="" />
		<cfargument name="TermsText" type="string" required="false" default="" />
		<cfargument name="AllowCommentFlag" type="string" required="false" default="" />
		<cfargument name="CommentApproveFlag" type="string" required="false" default="" />
		<cfargument name="NotifyEmails" type="string" required="false" default="" />
		<cfargument name="StatViews" type="string" required="false" default="" />
		<cfargument name="StatVoteCount" type="string" required="false" default="" />
		<cfargument name="StatVoteValue" type="string" required="false" default="" />
		<cfargument name="FeaturedFlag" type="string" required="false" default="" />
		<cfargument name="extHostFlag" type="string" required="false" default="" />
		<cfargument name="extHostLink" type="string" required="false" default="" />
		<cfargument name="RestrictedFlag" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setPubGeneralID(arguments.PubGeneralID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setLinkName(arguments.LinkName) />
		<cfset setOverview(arguments.Overview) />
		<cfset setKeywords(arguments.Keywords) />
		<cfset setObjectives(arguments.Objectives) />
		<cfset setGoals(arguments.Goals) />
		<cfset setPublishFlag(arguments.PublishFlag) />
		<cfset setPublishDate(arguments.PublishDate) />
		<cfset setRemoveDate(arguments.RemoveDate) />
		<cfset setPaymentFlag(arguments.PaymentFlag) />
		<cfset setPaymentFee(arguments.PaymentFee) />
		<cfset setTermsFlag(arguments.TermsFlag) />
		<cfset setTermsText(arguments.TermsText) />
		<cfset setAllowCommentFlag(arguments.AllowCommentFlag) />
		<cfset setCommentApproveFlag(arguments.CommentApproveFlag) />
		<cfset setNotifyEmails(arguments.NotifyEmails) />
		<cfset setStatViews(arguments.StatViews) />
		<cfset setStatVoteCount(arguments.StatVoteCount) />
		<cfset setStatVoteValue(arguments.StatVoteValue) />
		<cfset setFeaturedFlag(arguments.FeaturedFlag) />
		<cfset setExtHostFlag(arguments.extHostFlag) />
		<cfset setExtHostLink(arguments.extHostLink) />
		<cfset setRestrictedFlag(arguments.RestrictedFlag) />
		<cfset setUpdated(arguments.Updated) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.ActivityPubGeneral.ActivityPubGeneral" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfset var errors = arrayNew(1) />
		<cfset var thisError = structNew() />
		
		<!--- PubGeneralID --->
		<cfif (len(trim(getPubGeneralID())) AND NOT isNumeric(trim(getPubGeneralID())))>
			<cfset thisError.field = "PubGeneralID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PubGeneralID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityID --->
		<cfif (NOT len(trim(getActivityID())))>
			<cfset thisError.field = "ActivityID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ActivityID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getActivityID())) AND NOT isNumeric(trim(getActivityID())))>
			<cfset thisError.field = "ActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- LinkName --->
		<cfif (len(trim(getLinkName())) AND NOT IsSimpleValue(trim(getLinkName())))>
			<cfset thisError.field = "LinkName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "LinkName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLinkName())) GT 255)>
			<cfset thisError.field = "LinkName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "LinkName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Overview --->
		<cfif (len(trim(getOverview())) AND NOT IsSimpleValue(trim(getOverview())))>
			<cfset thisError.field = "Overview" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Overview is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getOverview())) GT 63000)>
			<cfset thisError.field = "Overview" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Overview is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Keywords --->
		<cfif (len(trim(getKeywords())) AND NOT IsSimpleValue(trim(getKeywords())))>
			<cfset thisError.field = "Keywords" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Keywords is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getKeywords())) GT 63000)>
			<cfset thisError.field = "Keywords" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Keywords is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Objectives 
		<cfif (NOT len(trim(getObjectives())))>
			<cfset thisError.field = "Objectives" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "Objectives is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>--->
		<cfif (len(trim(getObjectives())) AND NOT IsSimpleValue(trim(getObjectives())))>
			<cfset thisError.field = "Objectives" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Objectives is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getObjectives())) GT 63000)>
			<cfset thisError.field = "Objectives" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Objectives is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Goals --->
		<cfif (len(trim(getGoals())) AND NOT IsSimpleValue(trim(getGoals())))>
			<cfset thisError.field = "Goals" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Goals is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getGoals())) GT 63000)>
			<cfset thisError.field = "Goals" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Goals is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PublishFlag --->
		<cfif (len(trim(getPublishFlag())) AND NOT IsSimpleValue(trim(getPublishFlag())))>
			<cfset thisError.field = "PublishFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PublishFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPublishFlag())) GT 1)>
			<cfset thisError.field = "PublishFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PublishFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PublishDate --->
		<cfif (len(trim(getPublishDate())) AND NOT isDate(trim(getPublishDate())))>
			<cfset thisError.field = "PublishDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PublishDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RemoveDate --->
		<cfif (len(trim(getRemoveDate())) AND NOT isDate(trim(getRemoveDate())))>
			<cfset thisError.field = "RemoveDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RemoveDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PaymentFlag --->
		<cfif (len(trim(getPaymentFlag())) AND NOT IsSimpleValue(trim(getPaymentFlag())))>
			<cfset thisError.field = "PaymentFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PaymentFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPaymentFlag())) GT 1)>
			<cfset thisError.field = "PaymentFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PaymentFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PaymentFee --->
		<cfif (len(trim(getPaymentFee())) AND NOT isNumeric(trim(getPaymentFee())))>
			<cfset thisError.field = "PaymentFee" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PaymentFee is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TermsFlag --->
		<cfif (len(trim(getTermsFlag())) AND NOT IsSimpleValue(trim(getTermsFlag())))>
			<cfset thisError.field = "TermsFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TermsFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTermsFlag())) GT 1)>
			<cfset thisError.field = "TermsFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TermsFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TermsText --->
		<cfif (len(trim(getTermsText())) AND NOT IsSimpleValue(trim(getTermsText())))>
			<cfset thisError.field = "TermsText" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TermsText is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTermsText())) GT 63000)>
			<cfset thisError.field = "TermsText" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TermsText is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AllowCommentFlag --->
		<cfif (len(trim(getAllowCommentFlag())) AND NOT IsSimpleValue(trim(getAllowCommentFlag())))>
			<cfset thisError.field = "AllowCommentFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AllowCommentFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAllowCommentFlag())) GT 1)>
			<cfset thisError.field = "AllowCommentFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "AllowCommentFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CommentApproveFlag --->
		<cfif (len(trim(getCommentApproveFlag())) AND NOT IsSimpleValue(trim(getCommentApproveFlag())))>
			<cfset thisError.field = "CommentApproveFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CommentApproveFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCommentApproveFlag())) GT 1)>
			<cfset thisError.field = "CommentApproveFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CommentApproveFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- NotifyEmails --->
		<cfif (len(trim(getNotifyEmails())) AND NOT IsSimpleValue(trim(getNotifyEmails())))>
			<cfset thisError.field = "NotifyEmails" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "NotifyEmails is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getNotifyEmails())) GT 63000)>
			<cfset thisError.field = "NotifyEmails" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "NotifyEmails is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatViews --->
		<cfif (len(trim(getStatViews())) AND NOT isNumeric(trim(getStatViews())))>
			<cfset thisError.field = "StatViews" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatViews is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatVoteCount --->
		<cfif (len(trim(getStatVoteCount())) AND NOT isNumeric(trim(getStatVoteCount())))>
			<cfset thisError.field = "StatVoteCount" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatVoteCount is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatVoteValue --->
		<cfif (len(trim(getStatVoteValue())) AND NOT isNumeric(trim(getStatVoteValue())))>
			<cfset thisError.field = "StatVoteValue" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatVoteValue is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FeaturedFlag --->
		<cfif (len(trim(getFeaturedFlag())) AND NOT IsSimpleValue(trim(getFeaturedFlag())))>
			<cfset thisError.field = "FeaturedFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FeaturedFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFeaturedFlag())) GT 1)>
			<cfset thisError.field = "FeaturedFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FeaturedFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ExtHostFlag --->
		<cfif (len(trim(getExtHostFlag())) AND NOT IsSimpleValue(trim(getExtHostFlag())))>
			<cfset thisError.field = "ExtHostFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ExtHostFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getExtHostFlag())) GT 1)>
			<cfset thisError.field = "ExtHostFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ExtHostFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ExtHostLink --->
        
		<!--- RestrictedFlag --->
		<cfif (len(trim(getRestrictedFlag())) AND NOT IsSimpleValue(trim(getRestrictedFlag())))>
			<cfset thisError.field = "RestrictedFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RestrictedFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getRestrictedFlag())) GT 1)>
			<cfset thisError.field = "RestrictedFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "RestrictedFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Updated --->
		<cfif (len(trim(getUpdated())) AND NOT isDate(trim(getUpdated())))>
			<cfset thisError.field = "Updated" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Updated is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setPubGeneralID" access="public" returntype="void" output="false">
		<cfargument name="PubGeneralID" type="string" required="true" />
		<cfset variables.instance.PubGeneralID = arguments.PubGeneralID />
	</cffunction>
	<cffunction name="getPubGeneralID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PubGeneralID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setLinkName" access="public" returntype="void" output="false">
		<cfargument name="LinkName" type="string" required="true" />
		<cfset variables.instance.LinkName = arguments.LinkName />
	</cffunction>
	<cffunction name="getLinkName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LinkName />
	</cffunction>

	<cffunction name="setOverview" access="public" returntype="void" output="false">
		<cfargument name="Overview" type="string" required="true" />
		<cfset variables.instance.Overview = arguments.Overview />
	</cffunction>
	<cffunction name="getOverview" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Overview />
	</cffunction>

	<cffunction name="setKeywords" access="public" returntype="void" output="false">
		<cfargument name="Keywords" type="string" required="true" />
		<cfset variables.instance.Keywords = arguments.Keywords />
	</cffunction>
	<cffunction name="getKeywords" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Keywords />
	</cffunction>

	<cffunction name="setObjectives" access="public" returntype="void" output="false">
		<cfargument name="Objectives" type="string" required="true" />
		<cfset variables.instance.Objectives = arguments.Objectives />
	</cffunction>
	<cffunction name="getObjectives" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Objectives />
	</cffunction>

	<cffunction name="setGoals" access="public" returntype="void" output="false">
		<cfargument name="Goals" type="string" required="true" />
		<cfset variables.instance.Goals = arguments.Goals />
	</cffunction>
	<cffunction name="getGoals" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Goals />
	</cffunction>

	<cffunction name="setPublishFlag" access="public" returntype="void" output="false">
		<cfargument name="PublishFlag" type="string" required="true" />
		<cfset variables.instance.PublishFlag = arguments.PublishFlag />
	</cffunction>
	<cffunction name="getPublishFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PublishFlag />
	</cffunction>

	<cffunction name="setPublishDate" access="public" returntype="void" output="false">
		<cfargument name="PublishDate" type="string" required="true" />
		<cfset variables.instance.PublishDate = arguments.PublishDate />
	</cffunction>
	<cffunction name="getPublishDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PublishDate />
	</cffunction>

	<cffunction name="setRemoveDate" access="public" returntype="void" output="false">
		<cfargument name="RemoveDate" type="string" required="true" />
		<cfset variables.instance.RemoveDate = arguments.RemoveDate />
	</cffunction>
	<cffunction name="getRemoveDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RemoveDate />
	</cffunction>

	<cffunction name="setPaymentFlag" access="public" returntype="void" output="false">
		<cfargument name="PaymentFlag" type="string" required="true" />
		<cfset variables.instance.PaymentFlag = arguments.PaymentFlag />
	</cffunction>
	<cffunction name="getPaymentFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PaymentFlag />
	</cffunction>

	<cffunction name="setPaymentFee" access="public" returntype="void" output="false">
		<cfargument name="PaymentFee" type="string" required="true" />
		<cfset variables.instance.PaymentFee = arguments.PaymentFee />
	</cffunction>
	<cffunction name="getPaymentFee" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PaymentFee />
	</cffunction>

	<cffunction name="setTermsFlag" access="public" returntype="void" output="false">
		<cfargument name="TermsFlag" type="string" required="true" />
		<cfset variables.instance.TermsFlag = arguments.TermsFlag />
	</cffunction>
	<cffunction name="getTermsFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TermsFlag />
	</cffunction>

	<cffunction name="setTermsText" access="public" returntype="void" output="false">
		<cfargument name="TermsText" type="string" required="true" />
		<cfset variables.instance.TermsText = arguments.TermsText />
	</cffunction>
	<cffunction name="getTermsText" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TermsText />
	</cffunction>

	<cffunction name="setAllowCommentFlag" access="public" returntype="void" output="false">
		<cfargument name="AllowCommentFlag" type="string" required="true" />
		<cfset variables.instance.AllowCommentFlag = arguments.AllowCommentFlag />
	</cffunction>
	<cffunction name="getAllowCommentFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AllowCommentFlag />
	</cffunction>

	<cffunction name="setCommentApproveFlag" access="public" returntype="void" output="false">
		<cfargument name="CommentApproveFlag" type="string" required="true" />
		<cfset variables.instance.CommentApproveFlag = arguments.CommentApproveFlag />
	</cffunction>
	<cffunction name="getCommentApproveFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CommentApproveFlag />
	</cffunction>

	<cffunction name="setNotifyEmails" access="public" returntype="void" output="false">
		<cfargument name="NotifyEmails" type="string" required="true" />
		<cfset variables.instance.NotifyEmails = arguments.NotifyEmails />
	</cffunction>
	<cffunction name="getNotifyEmails" access="public" returntype="string" output="false">
		<cfreturn variables.instance.NotifyEmails />
	</cffunction>

	<cffunction name="setStatViews" access="public" returntype="void" output="false">
		<cfargument name="StatViews" type="string" required="true" />
		<cfset variables.instance.StatViews = arguments.StatViews />
	</cffunction>
	<cffunction name="getStatViews" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatViews />
	</cffunction>

	<cffunction name="setStatVoteCount" access="public" returntype="void" output="false">
		<cfargument name="StatVoteCount" type="string" required="true" />
		<cfset variables.instance.StatVoteCount = arguments.StatVoteCount />
	</cffunction>
	<cffunction name="getStatVoteCount" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatVoteCount />
	</cffunction>

	<cffunction name="setStatVoteValue" access="public" returntype="void" output="false">
		<cfargument name="StatVoteValue" type="string" required="true" />
		<cfset variables.instance.StatVoteValue = arguments.StatVoteValue />
	</cffunction>
	<cffunction name="getStatVoteValue" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatVoteValue />
	</cffunction>

	<cffunction name="setFeaturedFlag" access="public" returntype="void" output="false">
		<cfargument name="FeaturedFlag" type="string" required="true" />
		<cfset variables.instance.FeaturedFlag = arguments.FeaturedFlag />
	</cffunction>
	<cffunction name="getFeaturedFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FeaturedFlag />
	</cffunction>

	<cffunction name="setExtHostFlag" access="public" returntype="void" output="false">
		<cfargument name="ExtHostFlag" type="string" required="true" />
		<cfset variables.instance.ExtHostFlag = arguments.ExtHostFlag />
	</cffunction>
	<cffunction name="getExtHostFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExtHostFlag />
	</cffunction>

	<cffunction name="setExtHostLink" access="public" returntype="void" output="false">
		<cfargument name="ExtHostLink" type="string" required="true" />
		<cfset variables.instance.ExtHostLink = arguments.ExtHostLink />
	</cffunction>
	<cffunction name="getExtHostLink" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExtHostLink />
	</cffunction>

	<cffunction name="setRestrictedFlag" access="public" returntype="void" output="false">
		<cfargument name="RestrictedFlag" type="string" required="true" />
		<cfset variables.instance.RestrictedFlag = arguments.RestrictedFlag />
	</cffunction>
	<cffunction name="getRestrictedFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RestrictedFlag />
	</cffunction>

	<cffunction name="setUpdated" access="public" returntype="void" output="false">
		<cfargument name="Updated" type="string" required="true" />
		<cfset variables.instance.Updated = arguments.Updated />
	</cffunction>
	<cffunction name="getUpdated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Updated />
	</cffunction>


	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>
