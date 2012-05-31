<cfcomponent displayname="Action" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.Action.Action" output="false">
		<cfargument name="ActionID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="PersonID" type="string" required="false" default="" />
		<cfargument name="Code" type="string" required="false" default="" />
		<cfargument name="ShortName" type="string" required="false" default="" />
		<cfargument name="LongName" type="string" required="false" default="" />
		<cfargument name="HiddenFlag" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setActionID(arguments.ActionID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setPersonID(arguments.PersonID) />
		<cfset setCode(arguments.Code) />
		<cfset setShortName(arguments.ShortName) />
		<cfset setLongName(arguments.LongName) />
		<cfset setHiddenFlag(arguments.HiddenFlag) />
		<cfset setCreated(arguments.Created) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.Action.Action" output="false">
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
		
		<!--- ActionID --->
		<cfif (len(trim(getActionID())) AND NOT isNumeric(trim(getActionID())))>
			<cfset thisError.field = "ActionID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActionID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityID --->
		<cfif (len(trim(getActivityID())) AND NOT isNumeric(trim(getActivityID())))>
			<cfset thisError.field = "ActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PersonID --->
		<cfif (len(trim(getPersonID())) AND NOT isNumeric(trim(getPersonID())))>
			<cfset thisError.field = "PersonID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PersonID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Code --->
		<cfif (len(trim(getCode())) AND NOT IsSimpleValue(trim(getCode())))>
			<cfset thisError.field = "Code" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Code is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCode())) GT 4)>
			<cfset thisError.field = "Code" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Code is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ShortName --->
		<cfif (NOT len(trim(getShortName())))>
			<cfset thisError.field = "ShortName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ShortName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getShortName())) AND NOT IsSimpleValue(trim(getShortName())))>
			<cfset thisError.field = "ShortName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ShortName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getShortName())) GT 50)>
			<cfset thisError.field = "ShortName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ShortName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- LongName --->
		<cfif (NOT len(trim(getLongName())))>
			<cfset thisError.field = "LongName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "LongName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLongName())) AND NOT IsSimpleValue(trim(getLongName())))>
			<cfset thisError.field = "LongName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "LongName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLongName())) GT 63000)>
			<cfset thisError.field = "LongName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "LongName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- HiddenFlag --->
		<cfif (len(trim(getHiddenFlag())) AND NOT IsSimpleValue(trim(getHiddenFlag())))>
			<cfset thisError.field = "HiddenFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "HiddenFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getHiddenFlag())) GT 1)>
			<cfset thisError.field = "HiddenFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "HiddenFlag is too long" />
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
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setActionID" access="public" returntype="void" output="false">
		<cfargument name="ActionID" type="string" required="true" />
		<cfset variables.instance.ActionID = arguments.ActionID />
	</cffunction>
	<cffunction name="getActionID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActionID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setPersonID" access="public" returntype="void" output="false">
		<cfargument name="PersonID" type="string" required="true" />
		<cfset variables.instance.PersonID = arguments.PersonID />
	</cffunction>
	<cffunction name="getPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonID />
	</cffunction>

	<cffunction name="setCode" access="public" returntype="void" output="false">
		<cfargument name="Code" type="string" required="true" />
		<cfset variables.instance.Code = arguments.Code />
	</cffunction>
	<cffunction name="getCode" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Code />
	</cffunction>

	<cffunction name="setShortName" access="public" returntype="void" output="false">
		<cfargument name="ShortName" type="string" required="true" />
		<cfset variables.instance.ShortName = arguments.ShortName />
	</cffunction>
	<cffunction name="getShortName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ShortName />
	</cffunction>

	<cffunction name="setLongName" access="public" returntype="void" output="false">
		<cfargument name="LongName" type="string" required="true" />
		<cfset variables.instance.LongName = arguments.LongName />
	</cffunction>
	<cffunction name="getLongName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LongName />
	</cffunction>

	<cffunction name="setHiddenFlag" access="public" returntype="void" output="false">
		<cfargument name="HiddenFlag" type="string" required="true" />
		<cfset variables.instance.HiddenFlag = arguments.HiddenFlag />
	</cffunction>
	<cffunction name="getHiddenFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.HiddenFlag />
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
