<cfcomponent displayname="History" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.History.History" output="false">
		<cfargument name="HistoryID" type="string" required="false" default="" />
		<cfargument name="HistoryStyleID" type="string" required="false" default="" />
		<cfargument name="HistoryHTML" type="string" required="false" default="" />
		<cfargument name="FromPersonID" type="string" required="false" default="" />
		<cfargument name="ToPersonID" type="string" required="false" default="" />
		<cfargument name="ToActivityID" type="string" required="false" default="" />
		<cfargument name="ToHistoryID" type="string" required="false" default="" />
		<cfargument name="ToSiteID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="HiddenFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setHistoryID(arguments.HistoryID) />
		<cfset setHistoryStyleID(arguments.HistoryStyleID) />
		<cfset setHistoryHTML(arguments.HistoryHTML) />
		<cfset setFromPersonID(arguments.FromPersonID) />
		<cfset setToPersonID(arguments.ToPersonID) />
		<cfset setToActivityID(arguments.ToActivityID) />
		<cfset setToHistoryID(arguments.ToHistoryID) />
		<cfset setToSiteID(arguments.ToSiteID) />
		<cfset setCreated(arguments.Created) />
		<cfset setHiddenFlag(arguments.HiddenFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.History.History" output="false">
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
		
		<!--- HistoryID --->
		<cfif (len(trim(getHistoryID())) AND NOT isNumeric(trim(getHistoryID())))>
			<cfset thisError.field = "HistoryID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "HistoryID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- HistoryStyleID --->
		<cfif (NOT len(trim(getHistoryStyleID())))>
			<cfset thisError.field = "HistoryStyleID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "HistoryStyleID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getHistoryStyleID())) AND NOT isNumeric(trim(getHistoryStyleID())))>
			<cfset thisError.field = "HistoryStyleID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "HistoryStyleID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- HistoryHTML --->
		<cfif (len(trim(getHistoryHTML())) AND NOT IsSimpleValue(trim(getHistoryHTML())))>
			<cfset thisError.field = "HistoryHTML" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "HistoryHTML is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getHistoryHTML())) GT 63000)>
			<cfset thisError.field = "HistoryHTML" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "HistoryHTML is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FromPersonID --->
		<cfif (NOT len(trim(getFromPersonID())))>
			<cfset thisError.field = "FromPersonID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FromPersonID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFromPersonID())) AND NOT isNumeric(trim(getFromPersonID())))>
			<cfset thisError.field = "FromPersonID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FromPersonID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ToPersonID --->
		<cfif (len(trim(getToPersonID())) AND NOT isNumeric(trim(getToPersonID())))>
			<cfset thisError.field = "ToPersonID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ToPersonID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ToActivityID --->
		<cfif (len(trim(getToActivityID())) AND NOT isNumeric(trim(getToActivityID())))>
			<cfset thisError.field = "ToActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ToActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ToHistoryID --->
		<cfif (len(trim(getToHistoryID())) AND NOT isNumeric(trim(getToHistoryID())))>
			<cfset thisError.field = "ToHistoryID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ToHistoryID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ToSiteID --->
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
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
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setHistoryID" access="public" returntype="void" output="false">
		<cfargument name="HistoryID" type="string" required="true" />
		<cfset variables.instance.HistoryID = arguments.HistoryID />
	</cffunction>
	<cffunction name="getHistoryID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.HistoryID />
	</cffunction>

	<cffunction name="setHistoryStyleID" access="public" returntype="void" output="false">
		<cfargument name="HistoryStyleID" type="string" required="true" />
		<cfset variables.instance.HistoryStyleID = arguments.HistoryStyleID />
	</cffunction>
	<cffunction name="getHistoryStyleID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.HistoryStyleID />
	</cffunction>

	<cffunction name="setHistoryHTML" access="public" returntype="void" output="false">
		<cfargument name="HistoryHTML" type="string" required="true" />
		<cfset variables.instance.HistoryHTML = arguments.HistoryHTML />
	</cffunction>
	<cffunction name="getHistoryHTML" access="public" returntype="string" output="false">
		<cfreturn variables.instance.HistoryHTML />
	</cffunction>

	<cffunction name="setFromPersonID" access="public" returntype="void" output="false">
		<cfargument name="FromPersonID" type="string" required="true" />
		<cfset variables.instance.FromPersonID = arguments.FromPersonID />
	</cffunction>
	<cffunction name="getFromPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FromPersonID />
	</cffunction>

	<cffunction name="setToPersonID" access="public" returntype="void" output="false">
		<cfargument name="ToPersonID" type="string" required="true" />
		<cfset variables.instance.ToPersonID = arguments.ToPersonID />
	</cffunction>
	<cffunction name="getToPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ToPersonID />
	</cffunction>

	<cffunction name="setToActivityID" access="public" returntype="void" output="false">
		<cfargument name="ToActivityID" type="string" required="true" />
		<cfset variables.instance.ToActivityID = arguments.ToActivityID />
	</cffunction>
	<cffunction name="getToActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ToActivityID />
	</cffunction>

	<cffunction name="setToHistoryID" access="public" returntype="void" output="false">
		<cfargument name="ToHistoryID" type="string" required="true" />
		<cfset variables.instance.ToHistoryID = arguments.ToHistoryID />
	</cffunction>
	<cffunction name="getToHistoryID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ToHistoryID />
	</cffunction>

	<cffunction name="setToSiteID" access="public" returntype="void" output="false">
		<cfargument name="ToSiteID" type="string" required="true" />
		<cfset variables.instance.ToSiteID = arguments.ToSiteID />
	</cffunction>
	<cffunction name="getToSiteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ToSiteID />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
	</cffunction>

	<cffunction name="setHiddenFlag" access="public" returntype="void" output="false">
		<cfargument name="HiddenFlag" type="string" required="true" />
		<cfset variables.instance.HiddenFlag = arguments.HiddenFlag />
	</cffunction>
	<cffunction name="getHiddenFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.HiddenFlag />
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
