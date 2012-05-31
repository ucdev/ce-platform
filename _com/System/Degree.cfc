
<cfcomponent displayname="Degree" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.System.Degree" output="false">
		<cfargument name="DegreeID" type="string" required="false" default="" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="Abbrev" type="string" required="false" default="" />
		<cfargument name="Sort" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setDegreeID(arguments.DegreeID) />
		<cfset setName(arguments.Name) />
		<cfset setAbbrev(arguments.Abbrev) />
		<cfset setSort(arguments.Sort) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.System.Degree" output="false">
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
		
		<!--- DegreeID --->
		<cfif (len(trim(getDegreeID())) AND NOT isNumeric(trim(getDegreeID())))>
			<cfset thisError.field = "DegreeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DegreeID is not numeric" />
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
		<cfif (len(trim(getName())) GT 150)>
			<cfset thisError.field = "Name" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Name is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Abbrev --->
		<cfif (len(trim(getAbbrev())) AND NOT IsSimpleValue(trim(getAbbrev())))>
			<cfset thisError.field = "Abbrev" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Abbrev is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAbbrev())) GT 15)>
			<cfset thisError.field = "Abbrev" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Abbrev is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Sort --->
		<cfif (len(trim(getSort())) AND NOT isNumeric(trim(getSort())))>
			<cfset thisError.field = "Sort" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Sort is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setDegreeID" access="public" returntype="void" output="false">
		<cfargument name="DegreeID" type="string" required="true" />
		<cfset variables.instance.DegreeID = arguments.DegreeID />
	</cffunction>
	<cffunction name="getDegreeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DegreeID />
	</cffunction>

	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="Name" type="string" required="true" />
		<cfset variables.instance.Name = arguments.Name />
	</cffunction>
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Name />
	</cffunction>

	<cffunction name="setAbbrev" access="public" returntype="void" output="false">
		<cfargument name="Abbrev" type="string" required="true" />
		<cfset variables.instance.Abbrev = arguments.Abbrev />
	</cffunction>
	<cffunction name="getAbbrev" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Abbrev />
	</cffunction>

	<cffunction name="setSort" access="public" returntype="void" output="false">
		<cfargument name="Sort" type="string" required="true" />
		<cfset variables.instance.Sort = arguments.Sort />
	</cffunction>
	<cffunction name="getSort" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Sort />
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
