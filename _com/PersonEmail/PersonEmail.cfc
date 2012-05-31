
<cfcomponent displayname="PersonEmail" output="false">
		<cfproperty name="email_id" type="numeric" default="" />
		<cfproperty name="person_id" type="numeric" default="" />
		<cfproperty name="email_address" type="string" default="" />
		<cfproperty name="is_verified" type="numeric" default="" />
		<cfproperty name="verification_key" type="string" default="" />
		<cfproperty name="allow_login" type="numeric" default="" />
		
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.PersonEmail.PersonEmail" output="false">
		<cfargument name="email_id" type="string" required="false" default="" />
		<cfargument name="person_id" type="string" required="false" default="" />
		<cfargument name="email_address" type="string" required="false" default="" />
		<cfargument name="is_verified" type="string" required="false" default="" />
		<cfargument name="verification_key" type="string" required="false" default="" />
		<cfargument name="allow_login" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setemail_id(arguments.email_id) />
		<cfset setperson_id(arguments.person_id) />
		<cfset setemail_address(arguments.email_address) />
		<cfset setis_verified(arguments.is_verified) />
		<cfset setverification_key(arguments.verification_key) />
		<cfset setallow_login(arguments.allow_login) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.PersonEmail.PersonEmail" output="false">
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
		
		<!--- email_id --->
		<cfif (len(trim(getemail_id())) AND NOT isNumeric(trim(getemail_id())))>
			<cfset thisError.field = "email_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "email_id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- person_id --->
		<cfif (NOT len(trim(getperson_id())))>
			<cfset thisError.field = "person_id" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "person_id is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getperson_id())) AND NOT isNumeric(trim(getperson_id())))>
			<cfset thisError.field = "person_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "person_id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- email_address --->
		<cfif (NOT len(trim(getemail_address())))>
			<cfset thisError.field = "email_address" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "email_address is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getemail_address())) AND NOT IsSimpleValue(trim(getemail_address())))>
			<cfset thisError.field = "email_address" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "email_address is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getemail_address())) GT 320)>
			<cfset thisError.field = "email_address" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "email_address is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- is_verified --->
		<cfif (len(trim(getis_verified())) AND NOT isNumeric(trim(getis_verified())))>
			<cfset thisError.field = "is_verified" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "is_verified is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- verification_key --->
		<cfif (NOT len(trim(getverification_key())))>
			<cfset thisError.field = "verification_key" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "verification_key is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getverification_key())) AND NOT IsSimpleValue(trim(getverification_key())))>
			<cfset thisError.field = "verification_key" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "verification_key is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getverification_key())) GT 50)>
			<cfset thisError.field = "verification_key" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "verification_key is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- allow_login --->
		<cfif (len(trim(getallow_login())) AND NOT isNumeric(trim(getallow_login())))>
			<cfset thisError.field = "allow_login" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "allow_login is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setemail_id" access="public" returntype="void" output="false">
		<cfargument name="email_id" type="string" required="true" />
		<cfset variables.instance.email_id = arguments.email_id />
	</cffunction>
	<cffunction name="getemail_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.email_id />
	</cffunction>

	<cffunction name="setperson_id" access="public" returntype="void" output="false">
		<cfargument name="person_id" type="string" required="true" />
		<cfset variables.instance.person_id = arguments.person_id />
	</cffunction>
	<cffunction name="getperson_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.person_id />
	</cffunction>

	<cffunction name="setemail_address" access="public" returntype="void" output="false">
		<cfargument name="email_address" type="string" required="true" />
		<cfset variables.instance.email_address = arguments.email_address />
	</cffunction>
	<cffunction name="getemail_address" access="public" returntype="string" output="false">
		<cfreturn variables.instance.email_address />
	</cffunction>

	<cffunction name="setis_verified" access="public" returntype="void" output="false">
		<cfargument name="is_verified" type="string" required="true" />
		<cfset variables.instance.is_verified = arguments.is_verified />
	</cffunction>
	<cffunction name="getis_verified" access="public" returntype="string" output="false">
		<cfreturn variables.instance.is_verified />
	</cffunction>

	<cffunction name="setverification_key" access="public" returntype="void" output="false">
		<cfargument name="verification_key" type="string" required="true" />
		<cfset variables.instance.verification_key = arguments.verification_key />
	</cffunction>
	<cffunction name="getverification_key" access="public" returntype="string" output="false">
		<cfreturn variables.instance.verification_key />
	</cffunction>

	<cffunction name="setallow_login" access="public" returntype="void" output="false">
		<cfargument name="allow_login" type="string" required="true" />
		<cfset variables.instance.allow_login = arguments.allow_login />
	</cffunction>
	<cffunction name="getallow_login" access="public" returntype="string" output="false">
		<cfreturn variables.instance.allow_login />
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
