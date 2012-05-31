<cfcomponent displayname="Grouping" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.System.Grouping" output="false">
		<cfargument name="GroupingID" type="string" required="false" default="" />
		<cfargument name="ActivityTypeID" type="string" required="false" default="" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setGroupingID(arguments.GroupingID) />
		<cfset setActivityTypeID(arguments.ActivityTypeID) />
		<cfset setName(arguments.Name) />
		<cfset setCreated(arguments.Created) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.System.Grouping" output="false">
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
		
		<!--- GroupingID --->
		<cfif (len(trim(getGroupingID())) AND NOT isNumeric(trim(getGroupingID())))>
			<cfset thisError.field = "GroupingID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "GroupingID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityTypeID --->
		<cfif (len(trim(getActivityTypeID())) AND NOT isNumeric(trim(getActivityTypeID())))>
			<cfset thisError.field = "ActivityTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Name --->
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
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setGroupingID" access="public" returntype="void" output="false">
		<cfargument name="GroupingID" type="string" required="true" />
		<cfset variables.instance.GroupingID = arguments.GroupingID />
	</cffunction>
	<cffunction name="getGroupingID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.GroupingID />
	</cffunction>

	<cffunction name="setActivityTypeID" access="public" returntype="void" output="false">
		<cfargument name="ActivityTypeID" type="string" required="true" />
		<cfset variables.instance.ActivityTypeID = arguments.ActivityTypeID />
	</cffunction>
	<cffunction name="getActivityTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityTypeID />
	</cffunction>

	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="Name" type="string" required="true" />
		<cfset variables.instance.Name = arguments.Name />
	</cffunction>
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Name />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
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
