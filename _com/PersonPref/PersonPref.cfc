<cfcomponent displayname="PersonPref" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.PersonPref.PersonPref" output="false">
		<cfargument name="PersonPrefID" type="string" required="false" default="" />
		<cfargument name="PersonID" type="string" required="false" default="" />
		<cfargument name="EmailSpecialtyFlag" type="string" required="false" default="" />
		<cfargument name="PrimaryEmailId" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setPersonPrefID(arguments.PersonPrefID) />
		<cfset setPersonID(arguments.PersonID) />
		<cfset setEmailSpecialtyFlag(arguments.EmailSpecialtyFlag) />
		<cfset setPrimaryEmailId(arguments.PrimaryEmailId) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.PersonPref.PersonPref" output="false">
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
		
		<!--- PersonPrefID --->
		<cfif (len(trim(getPersonPrefID())) AND NOT isNumeric(trim(getPersonPrefID())))>
			<cfset thisError.field = "PersonPrefID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PersonPrefID is not numeric" />
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
		
		<!--- EmailSpecialtyFlag --->
		<cfif (len(trim(getEmailSpecialtyFlag())) AND NOT IsSimpleValue(trim(getEmailSpecialtyFlag())))>
			<cfset thisError.field = "EmailSpecialtyFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "EmailSpecialtyFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getEmailSpecialtyFlag())) GT 1)>
			<cfset thisError.field = "EmailSpecialtyFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "EmailSpecialtyFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
        <!--- PrimaryEmailId --->
		<cfif (len(trim(getPrimaryEmailId())) AND NOT isNumeric(trim(getPrimaryEmailId())))>
			<cfset thisError.field = "PrimaryEmailId" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PrimaryEmailId is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
        
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setPersonPrefID" access="public" returntype="void" output="false">
		<cfargument name="PersonPrefID" type="string" required="true" />
		<cfset variables.instance.PersonPrefID = arguments.PersonPrefID />
	</cffunction>
	<cffunction name="getPersonPrefID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonPrefID />
	</cffunction>

	<cffunction name="setPersonID" access="public" returntype="void" output="false">
		<cfargument name="PersonID" type="string" required="true" />
		<cfset variables.instance.PersonID = arguments.PersonID />
	</cffunction>
	<cffunction name="getPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonID />
	</cffunction>

	<cffunction name="setEmailSpecialtyFlag" access="public" returntype="void" output="false">
		<cfargument name="EmailSpecialtyFlag" type="string" required="true" />
		<cfset variables.instance.EmailSpecialtyFlag = arguments.EmailSpecialtyFlag />
	</cffunction>
	<cffunction name="getEmailSpecialtyFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.EmailSpecialtyFlag />
	</cffunction>

	<cffunction name="setPrimaryEmailId" access="public" returntype="void" output="false">
		<cfargument name="PrimaryEmailId" type="string" required="true" />
		<cfset variables.instance.PrimaryEmailId = arguments.PrimaryEmailId />
	</cffunction>
	<cffunction name="getPrimaryEmailId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PrimaryEmailId />
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
