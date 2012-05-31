<cfcomponent displayname="HistoryStyle" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.HistoryStyle.HistoryStyle" output="false">
		<cfargument name="HistoryStyleID" type="string" required="false" default="" />
		<cfargument name="HistoryTypeID" type="string" required="false" default="" />
		<cfargument name="Title" type="string" required="false" default="" />
		<cfargument name="TemplateFrom" type="string" required="false" default="" />
		<cfargument name="TemplateTo" type="string" required="false" default="" />
		<cfargument name="PossessiveFlag" type="string" required="false" default="" />
		<cfargument name="IconImg" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setHistoryStyleID(arguments.HistoryStyleID) />
		<cfset setHistoryTypeID(arguments.HistoryTypeID) />
		<cfset setTitle(arguments.Title) />
		<cfset setTemplateFrom(arguments.TemplateFrom) />
		<cfset setTemplateTo(arguments.TemplateTo) />
		<cfset setPossessiveFlag(arguments.PossessiveFlag) />
		<cfset setIconImg(arguments.IconImg) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.HistoryStyle.HistoryStyle" output="false">
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
		
		<!--- HistoryStyleID --->
		<cfif (len(trim(getHistoryStyleID())) AND NOT isNumeric(trim(getHistoryStyleID())))>
			<cfset thisError.field = "HistoryStyleID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "HistoryStyleID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- HistoryTypeID --->
		<cfif (len(trim(getHistoryTypeID())) AND NOT isNumeric(trim(getHistoryTypeID())))>
			<cfset thisError.field = "HistoryTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "HistoryTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Title --->
		<cfif (NOT len(trim(getTitle())))>
			<cfset thisError.field = "Title" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "Title is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTitle())) AND NOT IsSimpleValue(trim(getTitle())))>
			<cfset thisError.field = "Title" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Title is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTitle())) GT 50)>
			<cfset thisError.field = "Title" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Title is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TemplateFrom --->
		<cfif (NOT len(trim(getTemplateFrom())))>
			<cfset thisError.field = "TemplateFrom" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "TemplateFrom is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplateFrom())) AND NOT IsSimpleValue(trim(getTemplateFrom())))>
			<cfset thisError.field = "TemplateFrom" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TemplateFrom is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplateFrom())) GT 63000)>
			<cfset thisError.field = "TemplateFrom" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TemplateFrom is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TemplateTo --->
		<cfif (NOT len(trim(getTemplateTo())))>
			<cfset thisError.field = "TemplateTo" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "TemplateTo is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplateTo())) AND NOT IsSimpleValue(trim(getTemplateTo())))>
			<cfset thisError.field = "TemplateTo" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TemplateTo is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTemplateTo())) GT 63000)>
			<cfset thisError.field = "TemplateTo" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TemplateTo is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PossessiveFlag --->
		<cfif (len(trim(getPossessiveFlag())) AND NOT IsSimpleValue(trim(getPossessiveFlag())))>
			<cfset thisError.field = "PossessiveFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PossessiveFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPossessiveFlag())) GT 1)>
			<cfset thisError.field = "PossessiveFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PossessiveFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- IconImg --->
		<cfif (len(trim(getIconImg())) AND NOT IsSimpleValue(trim(getIconImg())))>
			<cfset thisError.field = "IconImg" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "IconImg is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getIconImg())) GT 25)>
			<cfset thisError.field = "IconImg" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "IconImg is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setHistoryStyleID" access="public" returntype="void" output="false">
		<cfargument name="HistoryStyleID" type="string" required="true" />
		<cfset variables.instance.HistoryStyleID = arguments.HistoryStyleID />
	</cffunction>
	<cffunction name="getHistoryStyleID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.HistoryStyleID />
	</cffunction>

	<cffunction name="setHistoryTypeID" access="public" returntype="void" output="false">
		<cfargument name="HistoryTypeID" type="string" required="true" />
		<cfset variables.instance.HistoryTypeID = arguments.HistoryTypeID />
	</cffunction>
	<cffunction name="getHistoryTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.HistoryTypeID />
	</cffunction>

	<cffunction name="setTitle" access="public" returntype="void" output="false">
		<cfargument name="Title" type="string" required="true" />
		<cfset variables.instance.Title = arguments.Title />
	</cffunction>
	<cffunction name="getTitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Title />
	</cffunction>

	<cffunction name="setTemplateFrom" access="public" returntype="void" output="false">
		<cfargument name="TemplateFrom" type="string" required="true" />
		<cfset variables.instance.TemplateFrom = arguments.TemplateFrom />
	</cffunction>
	<cffunction name="getTemplateFrom" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TemplateFrom />
	</cffunction>

	<cffunction name="setTemplateTo" access="public" returntype="void" output="false">
		<cfargument name="TemplateTo" type="string" required="true" />
		<cfset variables.instance.TemplateTo = arguments.TemplateTo />
	</cffunction>
	<cffunction name="getTemplateTo" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TemplateTo />
	</cffunction>

	<cffunction name="setPossessiveFlag" access="public" returntype="void" output="false">
		<cfargument name="PossessiveFlag" type="string" required="true" />
		<cfset variables.instance.PossessiveFlag = arguments.PossessiveFlag />
	</cffunction>
	<cffunction name="getPossessiveFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PossessiveFlag />
	</cffunction>

	<cffunction name="setIconImg" access="public" returntype="void" output="false">
		<cfargument name="IconImg" type="string" required="true" />
		<cfset variables.instance.IconImg = arguments.IconImg />
	</cffunction>
	<cffunction name="getIconImg" access="public" returntype="string" output="false">
		<cfreturn variables.instance.IconImg />
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
