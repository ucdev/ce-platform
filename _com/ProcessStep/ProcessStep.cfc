<cfcomponent displayname="ProcessStep" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ProcessStep.ProcessStep" output="false">
		<cfargument name="StepID" type="string" required="false" default="" />
		<cfargument name="ProcessID" type="string" required="false" default="" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="Instructions" type="string" required="false" default="" />
		<cfargument name="DueDateSetting" type="string" required="false" default="" />
		<cfargument name="DueDate" type="string" required="false" default="" />
		<cfargument name="BeforeOrAfter" type="string" required="false" default="" />
		<cfargument name="RelativeDays" type="string" required="false" default="" />
		<cfargument name="WaitingDays" type="string" required="false" default="" />
		<cfargument name="NotifyFlag" type="string" required="false" default="" />
		<cfargument name="Sort" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setStepID(arguments.StepID) />
		<cfset setProcessID(arguments.ProcessID) />
		<cfset setName(arguments.Name) />
		<cfset setDescription(arguments.Description) />
		<cfset setInstructions(arguments.Instructions) />
		<cfset setDueDateSetting(arguments.DueDateSetting) />
		<cfset setDueDate(arguments.DueDate) />
		<cfset setBeforeOrAfter(arguments.BeforeOrAfter) />
		<cfset setRelativeDays(arguments.RelativeDays) />
		<cfset setWaitingDays(arguments.WaitingDays) />
		<cfset setNotifyFlag(arguments.NotifyFlag) />
		<cfset setSort(arguments.Sort) />
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
	<cffunction name="setMemento" access="public" returntype="_com.ProcessStep.ProcessStep" output="false">
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
		
		<!--- StepID --->
		<cfif (len(trim(getStepID())) AND NOT isNumeric(trim(getStepID())))>
			<cfset thisError.field = "StepID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StepID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ProcessID --->
		<cfif (NOT len(trim(getProcessID())))>
			<cfset thisError.field = "ProcessID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ProcessID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getProcessID())) AND NOT isNumeric(trim(getProcessID())))>
			<cfset thisError.field = "ProcessID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ProcessID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Name --->
		<cfif (NOT len(trim(getName())))>
			<cfset thisError.field = "Name" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "Name is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getName())) AND NOT IsSimpleValue(trim(getName())))>
			<cfset thisError.field = "Name" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Name is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getName())) GT 255)>
			<cfset thisError.field = "Name" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Name is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Description --->
		<cfif (len(trim(getDescription())) AND NOT IsSimpleValue(trim(getDescription())))>
			<cfset thisError.field = "Description" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Description is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDescription())) GT 63000)>
			<cfset thisError.field = "Description" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Description is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Instructions --->
		<cfif (len(trim(getInstructions())) AND NOT IsSimpleValue(trim(getInstructions())))>
			<cfset thisError.field = "Instructions" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Instructions is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getInstructions())) GT 63000)>
			<cfset thisError.field = "Instructions" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Instructions is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DueDateSetting --->
		<cfif (len(trim(getDueDateSetting())) AND NOT IsSimpleValue(trim(getDueDateSetting())))>
			<cfset thisError.field = "DueDateSetting" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DueDateSetting is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDueDateSetting())) GT 1)>
			<cfset thisError.field = "DueDateSetting" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DueDateSetting is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DueDate --->
		<cfif (len(trim(getDueDate())) AND NOT isDate(trim(getDueDate())))>
			<cfset thisError.field = "DueDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DueDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- BeforeOrAfter --->
		<cfif (len(trim(getBeforeOrAfter())) AND NOT IsSimpleValue(trim(getBeforeOrAfter())))>
			<cfset thisError.field = "BeforeOrAfter" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "BeforeOrAfter is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getBeforeOrAfter())) GT 1)>
			<cfset thisError.field = "BeforeOrAfter" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "BeforeOrAfter is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RelativeDays --->
		<cfif (len(trim(getRelativeDays())) AND NOT isNumeric(trim(getRelativeDays())))>
			<cfset thisError.field = "RelativeDays" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RelativeDays is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- WaitingDays --->
		<cfif (len(trim(getWaitingDays())) AND NOT isNumeric(trim(getWaitingDays())))>
			<cfset thisError.field = "WaitingDays" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "WaitingDays is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- NotifyFlag --->
		<cfif (len(trim(getNotifyFlag())) AND NOT IsSimpleValue(trim(getNotifyFlag())))>
			<cfset thisError.field = "NotifyFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "NotifyFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getNotifyFlag())) GT 1)>
			<cfset thisError.field = "NotifyFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "NotifyFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Sort --->
		<cfif (len(trim(getSort())) AND NOT isNumeric(trim(getSort())))>
			<cfset thisError.field = "Sort" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Sort is not numeric" />
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
	<cffunction name="setStepID" access="public" returntype="void" output="false">
		<cfargument name="StepID" type="string" required="true" />
		<cfset variables.instance.StepID = arguments.StepID />
	</cffunction>
	<cffunction name="getStepID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StepID />
	</cffunction>

	<cffunction name="setProcessID" access="public" returntype="void" output="false">
		<cfargument name="ProcessID" type="string" required="true" />
		<cfset variables.instance.ProcessID = arguments.ProcessID />
	</cffunction>
	<cffunction name="getProcessID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ProcessID />
	</cffunction>

	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="Name" type="string" required="true" />
		<cfset variables.instance.Name = arguments.Name />
	</cffunction>
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Name />
	</cffunction>

	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="Description" type="string" required="true" />
		<cfset variables.instance.Description = arguments.Description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Description />
	</cffunction>

	<cffunction name="setInstructions" access="public" returntype="void" output="false">
		<cfargument name="Instructions" type="string" required="true" />
		<cfset variables.instance.Instructions = arguments.Instructions />
	</cffunction>
	<cffunction name="getInstructions" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Instructions />
	</cffunction>

	<cffunction name="setDueDateSetting" access="public" returntype="void" output="false">
		<cfargument name="DueDateSetting" type="string" required="true" />
		<cfset variables.instance.DueDateSetting = arguments.DueDateSetting />
	</cffunction>
	<cffunction name="getDueDateSetting" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DueDateSetting />
	</cffunction>

	<cffunction name="setDueDate" access="public" returntype="void" output="false">
		<cfargument name="DueDate" type="string" required="true" />
		<cfset variables.instance.DueDate = arguments.DueDate />
	</cffunction>
	<cffunction name="getDueDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DueDate />
	</cffunction>

	<cffunction name="setBeforeOrAfter" access="public" returntype="void" output="false">
		<cfargument name="BeforeOrAfter" type="string" required="true" />
		<cfset variables.instance.BeforeOrAfter = arguments.BeforeOrAfter />
	</cffunction>
	<cffunction name="getBeforeOrAfter" access="public" returntype="string" output="false">
		<cfreturn variables.instance.BeforeOrAfter />
	</cffunction>

	<cffunction name="setRelativeDays" access="public" returntype="void" output="false">
		<cfargument name="RelativeDays" type="string" required="true" />
		<cfset variables.instance.RelativeDays = arguments.RelativeDays />
	</cffunction>
	<cffunction name="getRelativeDays" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RelativeDays />
	</cffunction>

	<cffunction name="setWaitingDays" access="public" returntype="void" output="false">
		<cfargument name="WaitingDays" type="string" required="true" />
		<cfset variables.instance.WaitingDays = arguments.WaitingDays />
	</cffunction>
	<cffunction name="getWaitingDays" access="public" returntype="string" output="false">
		<cfreturn variables.instance.WaitingDays />
	</cffunction>

	<cffunction name="setNotifyFlag" access="public" returntype="void" output="false">
		<cfargument name="NotifyFlag" type="string" required="true" />
		<cfset variables.instance.NotifyFlag = arguments.NotifyFlag />
	</cffunction>
	<cffunction name="getNotifyFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.NotifyFlag />
	</cffunction>

	<cffunction name="setSort" access="public" returntype="void" output="false">
		<cfargument name="Sort" type="string" required="true" />
		<cfset variables.instance.Sort = arguments.Sort />
	</cffunction>
	<cffunction name="getSort" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Sort />
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
