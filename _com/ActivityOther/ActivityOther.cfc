
<cfcomponent displayname="activityOther" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.activityOther.activityOther" output="false">
		<cfargument name="OtherID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="DidacticHrs" type="string" required="false" default="" />
		<cfargument name="ExperimentalHrs" type="string" required="false" default="" />
		<cfargument name="SecClinSiteFlag" type="string" required="false" default="" />
		<cfargument name="CollabPTCFlag" type="string" required="false" default="" />
		<cfargument name="CollabPTCSpecify" type="string" required="false" default="" />
		<cfargument name="CollabAgencyFlag" type="string" required="false" default="" />
		<cfargument name="CollabAgencySpecify" type="string" required="false" default="" />
		<cfargument name="competenceDesign" type="string" required="false" default="" />
		<cfargument name="performanceDesign" type="string" required="false" default="" />
		<cfargument name="outcomesDesign" type="string" required="false" default="" />
		<cfargument name="competenceEval" type="string" required="false" default="" />
		<cfargument name="performanceEval" type="string" required="false" default="" />
		<cfargument name="outcomesEval" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setOtherID(arguments.OtherID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setDidacticHrs(arguments.DidacticHrs) />
		<cfset setExperimentalHrs(arguments.ExperimentalHrs) />
		<cfset setSecClinSiteFlag(arguments.SecClinSiteFlag) />
		<cfset setCollabPTCFlag(arguments.CollabPTCFlag) />
		<cfset setCollabPTCSpecify(arguments.CollabPTCSpecify) />
		<cfset setCollabAgencyFlag(arguments.CollabAgencyFlag) />
		<cfset setCollabAgencySpecify(arguments.CollabAgencySpecify) />
		<cfset setcompetenceDesign(arguments.competenceDesign) />
		<cfset setperformanceDesign(arguments.performanceDesign) />
		<cfset setoutcomesDesign(arguments.outcomesDesign) />
		<cfset setcompetenceEval(arguments.competenceEval) />
		<cfset setperformanceEval(arguments.performanceEval) />
		<cfset setoutcomesEval(arguments.outcomesEval) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.activityOther.activityOther" output="false">
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
		
		<!--- OtherID --->
		<cfif (len(trim(getOtherID())) AND NOT isNumeric(trim(getOtherID())))>
			<cfset thisError.field = "OtherID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OtherID is not numeric" />
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
		
		<!--- DidacticHrs --->
		<cfif (len(trim(getDidacticHrs())) AND NOT isNumeric(trim(getDidacticHrs())))>
			<cfset thisError.field = "DidacticHrs" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DidacticHrs is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ExperimentalHrs --->
		<cfif (len(trim(getExperimentalHrs())) AND NOT isNumeric(trim(getExperimentalHrs())))>
			<cfset thisError.field = "ExperimentalHrs" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ExperimentalHrs is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SecClinSiteFlag --->
		<cfif (len(trim(getSecClinSiteFlag())) AND NOT IsSimpleValue(trim(getSecClinSiteFlag())))>
			<cfset thisError.field = "SecClinSiteFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SecClinSiteFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSecClinSiteFlag())) GT 1)>
			<cfset thisError.field = "SecClinSiteFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SecClinSiteFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CollabPTCFlag --->
		<cfif (len(trim(getCollabPTCFlag())) AND NOT IsSimpleValue(trim(getCollabPTCFlag())))>
			<cfset thisError.field = "CollabPTCFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CollabPTCFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCollabPTCFlag())) GT 1)>
			<cfset thisError.field = "CollabPTCFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CollabPTCFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CollabPTCSpecify --->
		<cfif (len(trim(getCollabPTCSpecify())) AND NOT IsSimpleValue(trim(getCollabPTCSpecify())))>
			<cfset thisError.field = "CollabPTCSpecify" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CollabPTCSpecify is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCollabPTCSpecify())) GT 255)>
			<cfset thisError.field = "CollabPTCSpecify" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CollabPTCSpecify is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CollabAgencyFlag --->
		<cfif (len(trim(getCollabAgencyFlag())) AND NOT IsSimpleValue(trim(getCollabAgencyFlag())))>
			<cfset thisError.field = "CollabAgencyFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CollabAgencyFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCollabAgencyFlag())) GT 1)>
			<cfset thisError.field = "CollabAgencyFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CollabAgencyFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CollabAgencySpecify --->
		<cfif (len(trim(getCollabAgencySpecify())) AND NOT IsSimpleValue(trim(getCollabAgencySpecify())))>
			<cfset thisError.field = "CollabAgencySpecify" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CollabAgencySpecify is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCollabAgencySpecify())) GT 255)>
			<cfset thisError.field = "CollabAgencySpecify" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CollabAgencySpecify is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- competenceDesign --->
		<cfif (len(trim(getcompetenceDesign())) AND NOT isNumeric(trim(getcompetenceDesign())))>
			<cfset thisError.field = "competenceDesign" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "competenceDesign is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- performanceDesign --->
		<cfif (len(trim(getperformanceDesign())) AND NOT isNumeric(trim(getperformanceDesign())))>
			<cfset thisError.field = "performanceDesign" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "performanceDesign is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- outcomesDesign --->
		<cfif (len(trim(getoutcomesDesign())) AND NOT isNumeric(trim(getoutcomesDesign())))>
			<cfset thisError.field = "outcomesDesign" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "outcomesDesign is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- competenceEval --->
		<cfif (len(trim(getcompetenceEval())) AND NOT isNumeric(trim(getcompetenceEval())))>
			<cfset thisError.field = "competenceEval" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "competenceEval is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- performanceEval --->
		<cfif (len(trim(getperformanceEval())) AND NOT isNumeric(trim(getperformanceEval())))>
			<cfset thisError.field = "performanceEval" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "performanceEval is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- outcomesEval --->
		<cfif (len(trim(getoutcomesEval())) AND NOT isNumeric(trim(getoutcomesEval())))>
			<cfset thisError.field = "outcomesEval" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "outcomesEval is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setOtherID" access="public" returntype="void" output="false">
		<cfargument name="OtherID" type="string" required="true" />
		<cfset variables.instance.OtherID = arguments.OtherID />
	</cffunction>
	<cffunction name="getOtherID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OtherID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setDidacticHrs" access="public" returntype="void" output="false">
		<cfargument name="DidacticHrs" type="string" required="true" />
		<cfset variables.instance.DidacticHrs = arguments.DidacticHrs />
	</cffunction>
	<cffunction name="getDidacticHrs" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DidacticHrs />
	</cffunction>

	<cffunction name="setExperimentalHrs" access="public" returntype="void" output="false">
		<cfargument name="ExperimentalHrs" type="string" required="true" />
		<cfset variables.instance.ExperimentalHrs = arguments.ExperimentalHrs />
	</cffunction>
	<cffunction name="getExperimentalHrs" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExperimentalHrs />
	</cffunction>

	<cffunction name="setSecClinSiteFlag" access="public" returntype="void" output="false">
		<cfargument name="SecClinSiteFlag" type="string" required="true" />
		<cfset variables.instance.SecClinSiteFlag = arguments.SecClinSiteFlag />
	</cffunction>
	<cffunction name="getSecClinSiteFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SecClinSiteFlag />
	</cffunction>

	<cffunction name="setCollabPTCFlag" access="public" returntype="void" output="false">
		<cfargument name="CollabPTCFlag" type="string" required="true" />
		<cfset variables.instance.CollabPTCFlag = arguments.CollabPTCFlag />
	</cffunction>
	<cffunction name="getCollabPTCFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CollabPTCFlag />
	</cffunction>

	<cffunction name="setCollabPTCSpecify" access="public" returntype="void" output="false">
		<cfargument name="CollabPTCSpecify" type="string" required="true" />
		<cfset variables.instance.CollabPTCSpecify = arguments.CollabPTCSpecify />
	</cffunction>
	<cffunction name="getCollabPTCSpecify" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CollabPTCSpecify />
	</cffunction>

	<cffunction name="setCollabAgencyFlag" access="public" returntype="void" output="false">
		<cfargument name="CollabAgencyFlag" type="string" required="true" />
		<cfset variables.instance.CollabAgencyFlag = arguments.CollabAgencyFlag />
	</cffunction>
	<cffunction name="getCollabAgencyFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CollabAgencyFlag />
	</cffunction>

	<cffunction name="setCollabAgencySpecify" access="public" returntype="void" output="false">
		<cfargument name="CollabAgencySpecify" type="string" required="true" />
		<cfset variables.instance.CollabAgencySpecify = arguments.CollabAgencySpecify />
	</cffunction>
	<cffunction name="getCollabAgencySpecify" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CollabAgencySpecify />
	</cffunction>

	<cffunction name="setcompetenceDesign" access="public" returntype="void" output="false">
		<cfargument name="competenceDesign" type="string" required="true" />
		<cfset variables.instance.competenceDesign = arguments.competenceDesign />
	</cffunction>
	<cffunction name="getcompetenceDesign" access="public" returntype="string" output="false">
		<cfreturn variables.instance.competenceDesign />
	</cffunction>

	<cffunction name="setperformanceDesign" access="public" returntype="void" output="false">
		<cfargument name="performanceDesign" type="string" required="true" />
		<cfset variables.instance.performanceDesign = arguments.performanceDesign />
	</cffunction>
	<cffunction name="getperformanceDesign" access="public" returntype="string" output="false">
		<cfreturn variables.instance.performanceDesign />
	</cffunction>

	<cffunction name="setoutcomesDesign" access="public" returntype="void" output="false">
		<cfargument name="outcomesDesign" type="string" required="true" />
		<cfset variables.instance.outcomesDesign = arguments.outcomesDesign />
	</cffunction>
	<cffunction name="getoutcomesDesign" access="public" returntype="string" output="false">
		<cfreturn variables.instance.outcomesDesign />
	</cffunction>

	<cffunction name="setcompetenceEval" access="public" returntype="void" output="false">
		<cfargument name="competenceEval" type="string" required="true" />
		<cfset variables.instance.competenceEval = arguments.competenceEval />
	</cffunction>
	<cffunction name="getcompetenceEval" access="public" returntype="string" output="false">
		<cfreturn variables.instance.competenceEval />
	</cffunction>

	<cffunction name="setperformanceEval" access="public" returntype="void" output="false">
		<cfargument name="performanceEval" type="string" required="true" />
		<cfset variables.instance.performanceEval = arguments.performanceEval />
	</cffunction>
	<cffunction name="getperformanceEval" access="public" returntype="string" output="false">
		<cfreturn variables.instance.performanceEval />
	</cffunction>

	<cffunction name="setoutcomesEval" access="public" returntype="void" output="false">
		<cfargument name="outcomesEval" type="string" required="true" />
		<cfset variables.instance.outcomesEval = arguments.outcomesEval />
	</cffunction>
	<cffunction name="getoutcomesEval" access="public" returntype="string" output="false">
		<cfreturn variables.instance.outcomesEval />
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
