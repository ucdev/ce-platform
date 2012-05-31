<cfcomponent displayname="EmailStyle" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.EmailStyle.EmailStyle" output="false">
		<cfargument name="EmailStyleID" type="string" required="false" default="" />
		<cfargument name="Subject" type="string" required="false" default="" />
		<cfargument name="TemplateHTML" type="string" required="false" default="" />
		<cfargument name="TemplatePlain" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setEmailStyleID(arguments.EmailStyleID) />
		<cfset setSubject(arguments.Subject) />
		<cfset setTemplateHTML(arguments.TemplateHTML) />
		<cfset setTemplatePlain(arguments.TemplatePlain) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.EmailStyle.EmailStyle" output="false">
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
		
		<!--- EmailStyleID --->
		<cfif (len(trim(getEmailStyleID())) AND NOT isNumeric(trim(getEmailStyleID())))>
			<cfset thisError.field = "EmailStyleID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "EmailStyleID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Subject --->
		<cfif (NOT len(trim(getSubject())))>
			<cfset thisError.field = "Subject" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "Subject is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSubject())) AND NOT IsSimpleValue(trim(getSubject())))>
			<cfset thisError.field = "Subject" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Subject is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSubject())) GT 255)>
			<cfset thisError.field = "Subject" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Subject is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TemplateHTML --->
		<cfif (NOT len(trim(getTemplateHTML())))>
			<cfset thisError.field = "TemplateHTML" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "TemplateHTML is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplateHTML())) AND NOT IsSimpleValue(trim(getTemplateHTML())))>
			<cfset thisError.field = "TemplateHTML" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TemplateHTML is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplateHTML())) GT 63000)>
			<cfset thisError.field = "TemplateHTML" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TemplateHTML is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TemplatePlain --->
		<cfif (NOT len(trim(getTemplatePlain())))>
			<cfset thisError.field = "TemplatePlain" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "TemplatePlain is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplatePlain())) AND NOT IsSimpleValue(trim(getTemplatePlain())))>
			<cfset thisError.field = "TemplatePlain" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TemplatePlain is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplatePlain())) GT 63000)>
			<cfset thisError.field = "TemplatePlain" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TemplatePlain is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setEmailStyleID" access="public" returntype="void" output="false">
		<cfargument name="EmailStyleID" type="string" required="true" />
		<cfset variables.instance.EmailStyleID = arguments.EmailStyleID />
	</cffunction>
	<cffunction name="getEmailStyleID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.EmailStyleID />
	</cffunction>

	<cffunction name="setSubject" access="public" returntype="void" output="false">
		<cfargument name="Subject" type="string" required="true" />
		<cfset variables.instance.Subject = arguments.Subject />
	</cffunction>
	<cffunction name="getSubject" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Subject />
	</cffunction>

	<cffunction name="setTemplateHTML" access="public" returntype="void" output="false">
		<cfargument name="TemplateHTML" type="string" required="true" />
		<cfset variables.instance.TemplateHTML = arguments.TemplateHTML />
	</cffunction>
	<cffunction name="getTemplateHTML" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TemplateHTML />
	</cffunction>

	<cffunction name="setTemplatePlain" access="public" returntype="void" output="false">
		<cfargument name="TemplatePlain" type="string" required="true" />
		<cfset variables.instance.TemplatePlain = arguments.TemplatePlain />
	</cffunction>
	<cffunction name="getTemplatePlain" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TemplatePlain />
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
