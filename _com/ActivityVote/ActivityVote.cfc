<cfcomponent displayname="ActivityVote" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ActivityVote.ActivityVote" output="false">
		<cfargument name="ActivityVoteID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="PersonID" type="string" required="false" default="" />
		<cfargument name="VoteValue" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setActivityVoteID(arguments.ActivityVoteID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setPersonID(arguments.PersonID) />
		<cfset setVoteValue(arguments.VoteValue) />
		<cfset setCreated(arguments.Created) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.ActivityVote.ActivityVote" output="false">
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
		
		<!--- ActivityVoteID --->
		<cfif (len(trim(getActivityVoteID())) AND NOT isNumeric(trim(getActivityVoteID())))>
			<cfset thisError.field = "ActivityVoteID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityVoteID is not numeric" />
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
		
		<!--- PersonID --->
		<cfif (NOT len(trim(getPersonID())))>
			<cfset thisError.field = "PersonID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PersonID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPersonID())) AND NOT isNumeric(trim(getPersonID())))>
			<cfset thisError.field = "PersonID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PersonID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- VoteValue --->
		<cfif (NOT len(trim(getVoteValue())))>
			<cfset thisError.field = "VoteValue" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "VoteValue is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getVoteValue())) AND NOT isNumeric(trim(getVoteValue())))>
			<cfset thisError.field = "VoteValue" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "VoteValue is not numeric" />
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
	<cffunction name="setActivityVoteID" access="public" returntype="void" output="false">
		<cfargument name="ActivityVoteID" type="string" required="true" />
		<cfset variables.instance.ActivityVoteID = arguments.ActivityVoteID />
	</cffunction>
	<cffunction name="getActivityVoteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityVoteID />
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

	<cffunction name="setVoteValue" access="public" returntype="void" output="false">
		<cfargument name="VoteValue" type="string" required="true" />
		<cfset variables.instance.VoteValue = arguments.VoteValue />
	</cffunction>
	<cffunction name="getVoteValue" access="public" returntype="string" output="false">
		<cfreturn variables.instance.VoteValue />
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
