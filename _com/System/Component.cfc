<cfcomponent displayname="Component" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.System.Component" output="false">
		<cfargument name="ComponentID" type="string" required="false" default="" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="TypeCode" type="string" required="false" default="" />
		<cfargument name="SortFlag" type="string" required="false" default="" />
		<cfargument name="MaxUsage" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setComponentID(arguments.ComponentID) />
		<cfset setName(arguments.Name) />
		<cfset setDescription(arguments.Description) />
		<cfset setTypeCode(arguments.TypeCode) />
		<cfset setSortFlag(arguments.SortFlag) />
		<cfset setMaxUsage(arguments.MaxUsage) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.System.Component" output="false">
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
		
		<!--- ComponentID --->
		<cfif (len(trim(getComponentID())) AND NOT isNumeric(trim(getComponentID())))>
			<cfset thisError.field = "ComponentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ComponentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Name --->
		<cfif (NOT len(trim(getName())))>
			<cfset thisError.field = "Name" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "Name is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
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
		
		<!--- Description --->
		<cfif (len(trim(getDescription())) AND NOT IsSimpleValue(trim(getDescription())))>
			<cfset thisError.field = "Description" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Description is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDescription())) GT 63000)>
			<cfset thisError.field = "Description" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Description is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- TypeCode --->
		<cfif (len(trim(getTypeCode())) AND NOT IsSimpleValue(trim(getTypeCode())))>
			<cfset thisError.field = "TypeCode" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "TypeCode is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getTypeCode())) GT 10)>
			<cfset thisError.field = "TypeCode" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "TypeCode is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SortFlag --->
		<cfif (len(trim(getSortFlag())) AND NOT IsSimpleValue(trim(getSortFlag())))>
			<cfset thisError.field = "SortFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SortFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSortFlag())) GT 1)>
			<cfset thisError.field = "SortFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SortFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MaxUsage --->
		<cfif (len(trim(getMaxUsage())) AND NOT isNumeric(trim(getMaxUsage())))>
			<cfset thisError.field = "MaxUsage" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MaxUsage is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setComponentID" access="public" returntype="void" output="false">
		<cfargument name="ComponentID" type="string" required="true" />
		<cfset variables.instance.ComponentID = arguments.ComponentID />
	</cffunction>
	<cffunction name="getComponentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ComponentID />
	</cffunction>

	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="Name" type="string" required="true" />
		<cfset variables.instance.Name = arguments.Name />
	</cffunction>
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Name />
	</cffunction>

	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="Description" type="string" required="true" />
		<cfset variables.instance.Description = arguments.Description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Description />
	</cffunction>

	<cffunction name="setTypeCode" access="public" returntype="void" output="false">
		<cfargument name="TypeCode" type="string" required="true" />
		<cfset variables.instance.TypeCode = arguments.TypeCode />
	</cffunction>
	<cffunction name="getTypeCode" access="public" returntype="string" output="false">
		<cfreturn variables.instance.TypeCode />
	</cffunction>

	<cffunction name="setSortFlag" access="public" returntype="void" output="false">
		<cfargument name="SortFlag" type="string" required="true" />
		<cfset variables.instance.SortFlag = arguments.SortFlag />
	</cffunction>
	<cffunction name="getSortFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SortFlag />
	</cffunction>

	<cffunction name="setMaxUsage" access="public" returntype="void" output="false">
		<cfargument name="MaxUsage" type="string" required="true" />
		<cfset variables.instance.MaxUsage = arguments.MaxUsage />
	</cffunction>
	<cffunction name="getMaxUsage" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MaxUsage />
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
