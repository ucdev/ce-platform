<cfcomponent displayname="ProcessStepActivity" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ProcessStepActivity.ProcessStepActivity" output="false">
		<cfargument name="Step_ActivityID" type="string" required="false" default="" />
		<cfargument name="StepID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="AssignedToID" type="string" required="false" default="" />
		<cfargument name="DueDate" type="string" required="false" default="" />
		<cfargument name="StepStatusID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setStep_ActivityID(arguments.Step_ActivityID) />
		<cfset setStepID(arguments.StepID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setAssignedToID(arguments.AssignedToID) />
		<cfset setDueDate(arguments.DueDate) />
		<cfset setStepStatusID(arguments.StepStatusID) />
		<cfset setCreated(arguments.Created) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setUpdatedBy(arguments.UpdatedBy) />
		<cfset setDeleted(arguments.Deleted) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.ProcessStepActivity.ProcessStepActivity" output="false">
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
		
		<!--- Step_ActivityID --->
		<cfif (len(trim(getStep_ActivityID())) AND NOT isNumeric(trim(getStep_ActivityID())))>
			<cfset thisError.field = "Step_ActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Step_ActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StepID --->
		<cfif (NOT len(trim(getStepID())))>
			<cfset thisError.field = "StepID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "StepID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getStepID())) AND NOT isNumeric(trim(getStepID())))>
			<cfset thisError.field = "StepID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StepID is not numeric" />
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
		
		<!--- AssignedToID --->
		<cfif (len(trim(getAssignedToID())) AND NOT isNumeric(trim(getAssignedToID())))>
			<cfset thisError.field = "AssignedToID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssignedToID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DueDate --->
		<cfif (len(trim(getDueDate())) AND NOT isDate(trim(getDueDate())))>
			<cfset thisError.field = "DueDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DueDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StepStatusID --->
		<cfif (len(trim(getStepStatusID())) AND NOT isNumeric(trim(getStepStatusID())))>
			<cfset thisError.field = "StepStatusID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StepStatusID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreatedBy --->
		<cfif (NOT len(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "CreatedBy is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCreatedBy())) AND NOT isNumeric(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreatedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Updated --->
		<cfif (len(trim(getUpdated())) AND NOT isDate(trim(getUpdated())))>
			<cfset thisError.field = "Updated" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Updated is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UpdatedBy --->
		<cfif (len(trim(getUpdatedBy())) AND NOT isNumeric(trim(getUpdatedBy())))>
			<cfset thisError.field = "UpdatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UpdatedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Deleted --->
		<cfif (len(trim(getDeleted())) AND NOT isDate(trim(getDeleted())))>
			<cfset thisError.field = "Deleted" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Deleted is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DeletedFlag --->
		<cfif (len(trim(getDeletedFlag())) AND NOT IsSimpleValue(trim(getDeletedFlag())))>
			<cfset thisError.field = "DeletedFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeletedFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDeletedFlag())) GT 1)>
			<cfset thisError.field = "DeletedFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DeletedFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setStep_ActivityID" access="public" returntype="void" output="false">
		<cfargument name="Step_ActivityID" type="string" required="true" />
		<cfset variables.instance.Step_ActivityID = arguments.Step_ActivityID />
	</cffunction>
	<cffunction name="getStep_ActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Step_ActivityID />
	</cffunction>

	<cffunction name="setStepID" access="public" returntype="void" output="false">
		<cfargument name="StepID" type="string" required="true" />
		<cfset variables.instance.StepID = arguments.StepID />
	</cffunction>
	<cffunction name="getStepID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StepID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setAssignedToID" access="public" returntype="void" output="false">
		<cfargument name="AssignedToID" type="string" required="true" />
		<cfset variables.instance.AssignedToID = arguments.AssignedToID />
	</cffunction>
	<cffunction name="getAssignedToID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssignedToID />
	</cffunction>

	<cffunction name="setDueDate" access="public" returntype="void" output="false">
		<cfargument name="DueDate" type="string" required="true" />
		<cfset variables.instance.DueDate = arguments.DueDate />
	</cffunction>
	<cffunction name="getDueDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DueDate />
	</cffunction>

	<cffunction name="setStepStatusID" access="public" returntype="void" output="false">
		<cfargument name="StepStatusID" type="string" required="true" />
		<cfset variables.instance.StepStatusID = arguments.StepStatusID />
	</cffunction>
	<cffunction name="getStepStatusID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StepStatusID />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
	</cffunction>

	<cffunction name="setCreatedBy" access="public" returntype="void" output="false">
		<cfargument name="CreatedBy" type="string" required="true" />
		<cfset variables.instance.CreatedBy = arguments.CreatedBy />
	</cffunction>
	<cffunction name="getCreatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreatedBy />
	</cffunction>

	<cffunction name="setUpdated" access="public" returntype="void" output="false">
		<cfargument name="Updated" type="string" required="true" />
		<cfset variables.instance.Updated = arguments.Updated />
	</cffunction>
	<cffunction name="getUpdated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Updated />
	</cffunction>

	<cffunction name="setUpdatedBy" access="public" returntype="void" output="false">
		<cfargument name="UpdatedBy" type="string" required="true" />
		<cfset variables.instance.UpdatedBy = arguments.UpdatedBy />
	</cffunction>
	<cffunction name="getUpdatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UpdatedBy />
	</cffunction>

	<cffunction name="setDeleted" access="public" returntype="void" output="false">
		<cfargument name="Deleted" type="string" required="true" />
		<cfset variables.instance.Deleted = arguments.Deleted />
	</cffunction>
	<cffunction name="getDeleted" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Deleted />
	</cffunction>

	<cffunction name="setDeletedFlag" access="public" returntype="void" output="false">
		<cfargument name="DeletedFlag" type="string" required="true" />
		<cfset variables.instance.DeletedFlag = arguments.DeletedFlag />
	</cffunction>
	<cffunction name="getDeletedFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeletedFlag />
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
