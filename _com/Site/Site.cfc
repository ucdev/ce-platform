<cfcomponent displayname="Site" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.Site.Site" output="false">
		<cfargument name="SiteID" type="string" required="false" default="" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="NameShort" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="DomainName" type="string" required="false" default="" />
		<cfargument name="ContactName" type="string" required="false" default="" />
		<cfargument name="ContactPhone" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setSiteID(arguments.SiteID) />
		<cfset setName(arguments.Name) />
		<cfset setNameShort(arguments.NameShort) />
		<cfset setDescription(arguments.Description) />
		<cfset setDomainName(arguments.DomainName) />
		<cfset setContactName(arguments.ContactName) />
		<cfset setContactPhone(arguments.ContactPhone) />
		<cfset setCreated(arguments.Created) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setUpdatedBy(arguments.UpdatedBy) />
		<cfset setDeleted(arguments.Deleted) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.Site.Site" output="false">
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
		
		<!--- SiteID --->
		<cfif (len(trim(getSiteID())) AND NOT isNumeric(trim(getSiteID())))>
			<cfset thisError.field = "SiteID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SiteID is not numeric" />
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
		
		<!--- NameShort --->
		<cfif (NOT len(trim(getNameShort())))>
			<cfset thisError.field = "NameShort" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "NameShort is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getNameShort())) AND NOT IsSimpleValue(trim(getNameShort())))>
			<cfset thisError.field = "NameShort" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "NameShort is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getNameShort())) GT 15)>
			<cfset thisError.field = "NameShort" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "NameShort is too long" />
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
		
		<!--- DomainName --->
		<cfif (NOT len(trim(getDomainName())))>
			<cfset thisError.field = "DomainName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DomainName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDomainName())) AND NOT IsSimpleValue(trim(getDomainName())))>
			<cfset thisError.field = "DomainName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DomainName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDomainName())) GT 255)>
			<cfset thisError.field = "DomainName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DomainName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ContactName --->
		<cfif (len(trim(getContactName())) AND NOT IsSimpleValue(trim(getContactName())))>
			<cfset thisError.field = "ContactName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ContactName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getContactName())) GT 255)>
			<cfset thisError.field = "ContactName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ContactName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ContactPhone --->
		<cfif (len(trim(getContactPhone())) AND NOT IsSimpleValue(trim(getContactPhone())))>
			<cfset thisError.field = "ContactPhone" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ContactPhone is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getContactPhone())) GT 50)>
			<cfset thisError.field = "ContactPhone" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ContactPhone is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreatedBy --->
		<cfif (NOT len(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "CreatedBy is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCreatedBy())) AND NOT isNumeric(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreatedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Updated --->
		<cfif (len(trim(getUpdated())) AND NOT isDate(trim(getUpdated())))>
			<cfset thisError.field = "Updated" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Updated is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- UpdatedBy --->
		<cfif (len(trim(getUpdatedBy())) AND NOT isNumeric(trim(getUpdatedBy())))>
			<cfset thisError.field = "UpdatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UpdatedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Deleted --->
		<cfif (len(trim(getDeleted())) AND NOT isDate(trim(getDeleted())))>
			<cfset thisError.field = "Deleted" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Deleted is not a date" />
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
	<cffunction name="setSiteID" access="public" returntype="void" output="false">
		<cfargument name="SiteID" type="string" required="true" />
		<cfset variables.instance.SiteID = arguments.SiteID />
	</cffunction>
	<cffunction name="getSiteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SiteID />
	</cffunction>

	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="Name" type="string" required="true" />
		<cfset variables.instance.Name = arguments.Name />
	</cffunction>
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Name />
	</cffunction>

	<cffunction name="setNameShort" access="public" returntype="void" output="false">
		<cfargument name="NameShort" type="string" required="true" />
		<cfset variables.instance.NameShort = arguments.NameShort />
	</cffunction>
	<cffunction name="getNameShort" access="public" returntype="string" output="false">
		<cfreturn variables.instance.NameShort />
	</cffunction>

	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="Description" type="string" required="true" />
		<cfset variables.instance.Description = arguments.Description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Description />
	</cffunction>

	<cffunction name="setDomainName" access="public" returntype="void" output="false">
		<cfargument name="DomainName" type="string" required="true" />
		<cfset variables.instance.DomainName = arguments.DomainName />
	</cffunction>
	<cffunction name="getDomainName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DomainName />
	</cffunction>

	<cffunction name="setContactName" access="public" returntype="void" output="false">
		<cfargument name="ContactName" type="string" required="true" />
		<cfset variables.instance.ContactName = arguments.ContactName />
	</cffunction>
	<cffunction name="getContactName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ContactName />
	</cffunction>

	<cffunction name="setContactPhone" access="public" returntype="void" output="false">
		<cfargument name="ContactPhone" type="string" required="true" />
		<cfset variables.instance.ContactPhone = arguments.ContactPhone />
	</cffunction>
	<cffunction name="getContactPhone" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ContactPhone />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
	</cffunction>

	<cffunction name="setCreatedBy" access="public" returntype="void" output="false">
		<cfargument name="CreatedBy" type="string" required="true" />
		<cfset variables.instance.CreatedBy = arguments.CreatedBy />
	</cffunction>
	<cffunction name="getCreatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreatedBy />
	</cffunction>

	<cffunction name="setUpdated" access="public" returntype="void" output="false">
		<cfargument name="Updated" type="string" required="true" />
		<cfset variables.instance.Updated = arguments.Updated />
	</cffunction>
	<cffunction name="getUpdated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Updated />
	</cffunction>

	<cffunction name="setUpdatedBy" access="public" returntype="void" output="false">
		<cfargument name="UpdatedBy" type="string" required="true" />
		<cfset variables.instance.UpdatedBy = arguments.UpdatedBy />
	</cffunction>
	<cffunction name="getUpdatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.UpdatedBy />
	</cffunction>

	<cffunction name="setDeleted" access="public" returntype="void" output="false">
		<cfargument name="Deleted" type="string" required="true" />
		<cfset variables.instance.Deleted = arguments.Deleted />
	</cffunction>
	<cffunction name="getDeleted" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Deleted />
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
