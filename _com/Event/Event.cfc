<cfcomponent displayname="Event" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.Event.Event" output="false">
		<cfargument name="id" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="name" type="string" required="false" default="" />
		<cfargument name="description" type="string" required="false" default="" />
		<cfargument name="date_started" type="string" required="false" default="" />
		<cfargument name="date_ended" type="string" required="false" default="" />
		<cfargument name="time_started" type="string" required="false" default="" />
		<cfargument name="time_ended" type="string" required="false" default="" />
		<cfargument name="is_all_day" type="string" required="false" default="" />
		<cfargument name="repeat_type" type="string" required="false" default="" />
		<cfargument name="color" type="string" required="false" default="" />
		<cfargument name="date_updated" type="string" required="false" default="" />
		<cfargument name="date_created" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setid(arguments.id) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setname(arguments.name) />
		<cfset setdescription(arguments.description) />
		<cfset setdate_started(arguments.date_started) />
		<cfset setdate_ended(arguments.date_ended) />
		<cfset settime_started(arguments.time_started) />
		<cfset settime_ended(arguments.time_ended) />
		<cfset setis_all_day(arguments.is_all_day) />
		<cfset setrepeat_type(arguments.repeat_type) />
		<cfset setcolor(arguments.color) />
		<cfset setdate_updated(arguments.date_updated) />
		<cfset setdate_created(arguments.date_created) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.Event.Event" output="false">
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
		
		<!--- id --->
		<cfif (len(trim(getid())) AND NOT isNumeric(trim(getid())))>
			<cfset thisError.field = "id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityID --->
		<cfif (len(trim(getActivityID())) AND NOT isNumeric(trim(getActivityID())))>
			<cfset thisError.field = "ActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- name --->
		<cfif (len(trim(getname())) AND NOT IsSimpleValue(trim(getname())))>
			<cfset thisError.field = "name" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "name is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getname())) GT 100)>
			<cfset thisError.field = "name" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "name is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- description --->
		<cfif (len(trim(getdescription())) AND NOT IsSimpleValue(trim(getdescription())))>
			<cfset thisError.field = "description" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "description is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getdescription())) GT 2147483647)>
			<cfset thisError.field = "description" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "description is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- date_started --->
		<cfif (len(trim(getdate_started())) AND NOT isDate(trim(getdate_started())))>
			<cfset thisError.field = "date_started" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "date_started is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- date_ended --->
		<cfif (len(trim(getdate_ended())) AND NOT isDate(trim(getdate_ended())))>
			<cfset thisError.field = "date_ended" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "date_ended is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- time_started --->
		<cfif (len(trim(gettime_started())) AND NOT IsSimpleValue(trim(gettime_started())))>
			<cfset thisError.field = "time_started" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "time_started is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettime_started())) GT 5)>
			<cfset thisError.field = "time_started" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "time_started is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- time_ended --->
		<cfif (len(trim(gettime_ended())) AND NOT IsSimpleValue(trim(gettime_ended())))>
			<cfset thisError.field = "time_ended" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "time_ended is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettime_ended())) GT 5)>
			<cfset thisError.field = "time_ended" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "time_ended is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- is_all_day --->
		<cfif (len(trim(getis_all_day())) AND NOT isNumeric(trim(getis_all_day())))>
			<cfset thisError.field = "is_all_day" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "is_all_day is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- repeat_type --->
		<cfif (len(trim(getrepeat_type())) AND NOT isNumeric(trim(getrepeat_type())))>
			<cfset thisError.field = "repeat_type" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "repeat_type is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- color --->
		<cfif (len(trim(getcolor())) AND NOT IsSimpleValue(trim(getcolor())))>
			<cfset thisError.field = "color" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "color is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getcolor())) GT 6)>
			<cfset thisError.field = "color" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "color is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- date_updated --->
		<cfif (len(trim(getdate_updated())) AND NOT isDate(trim(getdate_updated())))>
			<cfset thisError.field = "date_updated" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "date_updated is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- date_created --->
		<cfif (len(trim(getdate_created())) AND NOT isDate(trim(getdate_created())))>
			<cfset thisError.field = "date_created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "date_created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setid" access="public" returntype="void" output="false">
		<cfargument name="id" type="string" required="true" />
		<cfset variables.instance.id = arguments.id />
	</cffunction>
	<cffunction name="getid" access="public" returntype="string" output="false">
		<cfreturn variables.instance.id />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setname" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfset variables.instance.name = arguments.name />
	</cffunction>
	<cffunction name="getname" access="public" returntype="string" output="false">
		<cfreturn variables.instance.name />
	</cffunction>

	<cffunction name="setdescription" access="public" returntype="void" output="false">
		<cfargument name="description" type="string" required="true" />
		<cfset variables.instance.description = arguments.description />
	</cffunction>
	<cffunction name="getdescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.description />
	</cffunction>

	<cffunction name="setdate_started" access="public" returntype="void" output="false">
		<cfargument name="date_started" type="string" required="true" />
		<cfset variables.instance.date_started = arguments.date_started />
	</cffunction>
	<cffunction name="getdate_started" access="public" returntype="string" output="false">
		<cfreturn variables.instance.date_started />
	</cffunction>

	<cffunction name="setdate_ended" access="public" returntype="void" output="false">
		<cfargument name="date_ended" type="string" required="true" />
		<cfset variables.instance.date_ended = arguments.date_ended />
	</cffunction>
	<cffunction name="getdate_ended" access="public" returntype="string" output="false">
		<cfreturn variables.instance.date_ended />
	</cffunction>

	<cffunction name="settime_started" access="public" returntype="void" output="false">
		<cfargument name="time_started" type="string" required="true" />
		<cfset variables.instance.time_started = arguments.time_started />
	</cffunction>
	<cffunction name="gettime_started" access="public" returntype="string" output="false">
		<cfreturn variables.instance.time_started />
	</cffunction>

	<cffunction name="settime_ended" access="public" returntype="void" output="false">
		<cfargument name="time_ended" type="string" required="true" />
		<cfset variables.instance.time_ended = arguments.time_ended />
	</cffunction>
	<cffunction name="gettime_ended" access="public" returntype="string" output="false">
		<cfreturn variables.instance.time_ended />
	</cffunction>

	<cffunction name="setis_all_day" access="public" returntype="void" output="false">
		<cfargument name="is_all_day" type="string" required="true" />
		<cfset variables.instance.is_all_day = arguments.is_all_day />
	</cffunction>
	<cffunction name="getis_all_day" access="public" returntype="string" output="false">
		<cfreturn variables.instance.is_all_day />
	</cffunction>

	<cffunction name="setrepeat_type" access="public" returntype="void" output="false">
		<cfargument name="repeat_type" type="string" required="true" />
		<cfset variables.instance.repeat_type = arguments.repeat_type />
	</cffunction>
	<cffunction name="getrepeat_type" access="public" returntype="string" output="false">
		<cfreturn variables.instance.repeat_type />
	</cffunction>

	<cffunction name="setcolor" access="public" returntype="void" output="false">
		<cfargument name="color" type="string" required="true" />
		<cfset variables.instance.color = arguments.color />
	</cffunction>
	<cffunction name="getcolor" access="public" returntype="string" output="false">
		<cfreturn variables.instance.color />
	</cffunction>

	<cffunction name="setdate_updated" access="public" returntype="void" output="false">
		<cfargument name="date_updated" type="string" required="true" />
		<cfset variables.instance.date_updated = arguments.date_updated />
	</cffunction>
	<cffunction name="getdate_updated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.date_updated />
	</cffunction>

	<cffunction name="setdate_created" access="public" returntype="void" output="false">
		<cfargument name="date_created" type="string" required="true" />
		<cfset variables.instance.date_created = arguments.date_created />
	</cffunction>
	<cffunction name="getdate_created" access="public" returntype="string" output="false">
		<cfreturn variables.instance.date_created />
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
