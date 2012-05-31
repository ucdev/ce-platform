<cfcomponent displayname="PersonSpecialty" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.PersonSpecialty.PersonSpecialty" output="false">
		<cfargument name="PersonSpecialtyID" type="string" required="false" default="" />
		<cfargument name="PersonID" type="string" required="false" default="" />
		<cfargument name="SpecialtyID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setPersonSpecialtyID(arguments.PersonSpecialtyID) />
		<cfset setPersonID(arguments.PersonID) />
		<cfset setSpecialtyID(arguments.SpecialtyID) />
		<cfset setCreated(arguments.Created) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.PersonSpecialty.PersonSpecialty" output="false">
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
		
		<!--- PersonSpecialtyID --->
		<cfif (len(trim(getPersonSpecialtyID())) AND NOT isNumeric(trim(getPersonSpecialtyID())))>
			<cfset thisError.field = "PersonSpecialtyID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PersonSpecialtyID is not numeric" />
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
		
		<!--- SpecialtyID --->
		<cfif (NOT len(trim(getSpecialtyID())))>
			<cfset thisError.field = "SpecialtyID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "SpecialtyID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSpecialtyID())) AND NOT isNumeric(trim(getSpecialtyID())))>
			<cfset thisError.field = "SpecialtyID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SpecialtyID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
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
	<cffunction name="setPersonSpecialtyID" access="public" returntype="void" output="false">
		<cfargument name="PersonSpecialtyID" type="string" required="true" />
		<cfset variables.instance.PersonSpecialtyID = arguments.PersonSpecialtyID />
	</cffunction>
	<cffunction name="getPersonSpecialtyID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonSpecialtyID />
	</cffunction>

	<cffunction name="setPersonID" access="public" returntype="void" output="false">
		<cfargument name="PersonID" type="string" required="true" />
		<cfset variables.instance.PersonID = arguments.PersonID />
	</cffunction>
	<cffunction name="getPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonID />
	</cffunction>

	<cffunction name="setSpecialtyID" access="public" returntype="void" output="false">
		<cfargument name="SpecialtyID" type="string" required="true" />
		<cfset variables.instance.SpecialtyID = arguments.SpecialtyID />
	</cffunction>
	<cffunction name="getSpecialtyID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SpecialtyID />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
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
