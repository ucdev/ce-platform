<cfcomponent displayname="ActivityPubComponent" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ActivityPubComponent.ActivityPubComponent" output="false">
		<cfargument name="PubComponentID" type="string" required="false" default="" />
		<cfargument name="ComponentID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="Sort" type="string" required="false" default="" />
		<cfargument name="DisplayName" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="ExternalURL" type="string" required="false" default="" />
		<cfargument name="AssessmentID" type="string" required="false" default="" />
		<cfargument name="FileID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setPubComponentID(arguments.PubComponentID) />
		<cfset setComponentID(arguments.ComponentID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setSort(arguments.Sort) />
		<cfset setDisplayName(arguments.DisplayName) />
		<cfset setDescription(arguments.Description) />
		<cfset setExternalURL(arguments.ExternalURL) />
		<cfset setAssessmentID(arguments.AssessmentID) />
		<cfset setFileID(arguments.FileID) />
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
	<cffunction name="setMemento" access="public" returntype="_com.ActivityPubComponent.ActivityPubComponent" output="false">
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
		
		<!--- PubComponentID --->
		<cfif (len(trim(getPubComponentID())) AND NOT isNumeric(trim(getPubComponentID())))>
			<cfset thisError.field = "PubComponentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PubComponentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ComponentID --->
		<cfif (NOT len(trim(getComponentID())))>
			<cfset thisError.field = "ComponentID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ComponentID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getComponentID())) AND NOT isNumeric(trim(getComponentID())))>
			<cfset thisError.field = "ComponentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ComponentID is not numeric" />
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
		
		<!--- Sort --->
		<cfif (len(trim(getSort())) AND NOT isNumeric(trim(getSort())))>
			<cfset thisError.field = "Sort" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Sort is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DisplayName --->
		<cfif (NOT len(trim(getDisplayName())))>
			<cfset thisError.field = "DisplayName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "DisplayName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDisplayName())) AND NOT IsSimpleValue(trim(getDisplayName())))>
			<cfset thisError.field = "DisplayName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DisplayName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDisplayName())) GT 255)>
			<cfset thisError.field = "DisplayName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DisplayName is too long" />
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
		
		<!--- ExternalURL --->
		<cfif (len(trim(getExternalURL())) AND NOT IsSimpleValue(trim(getExternalURL())))>
			<cfset thisError.field = "ExternalURL" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ExternalURL is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getExternalURL())) GT 500)>
			<cfset thisError.field = "ExternalURL" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ExternalURL is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AssessmentID --->
		<cfif (len(trim(getAssessmentID())) AND NOT isNumeric(trim(getAssessmentID())))>
			<cfset thisError.field = "AssessmentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessmentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FileID --->
		<cfif (len(trim(getFileID())) AND NOT isNumeric(trim(getFileID())))>
			<cfset thisError.field = "FileID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FileID is not numeric" />
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
	<cffunction name="setPubComponentID" access="public" returntype="void" output="false">
		<cfargument name="PubComponentID" type="string" required="true" />
		<cfset variables.instance.PubComponentID = arguments.PubComponentID />
	</cffunction>
	<cffunction name="getPubComponentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PubComponentID />
	</cffunction>

	<cffunction name="setComponentID" access="public" returntype="void" output="false">
		<cfargument name="ComponentID" type="string" required="true" />
		<cfset variables.instance.ComponentID = arguments.ComponentID />
	</cffunction>
	<cffunction name="getComponentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ComponentID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setSort" access="public" returntype="void" output="false">
		<cfargument name="Sort" type="string" required="true" />
		<cfset variables.instance.Sort = arguments.Sort />
	</cffunction>
	<cffunction name="getSort" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Sort />
	</cffunction>

	<cffunction name="setDisplayName" access="public" returntype="void" output="false">
		<cfargument name="DisplayName" type="string" required="true" />
		<cfset variables.instance.DisplayName = arguments.DisplayName />
	</cffunction>
	<cffunction name="getDisplayName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DisplayName />
	</cffunction>

	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="Description" type="string" required="true" />
		<cfset variables.instance.Description = arguments.Description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Description />
	</cffunction>

	<cffunction name="setExternalURL" access="public" returntype="void" output="false">
		<cfargument name="ExternalURL" type="string" required="true" />
		<cfset variables.instance.ExternalURL = arguments.ExternalURL />
	</cffunction>
	<cffunction name="getExternalURL" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExternalURL />
	</cffunction>

	<cffunction name="setAssessmentID" access="public" returntype="void" output="false">
		<cfargument name="AssessmentID" type="string" required="true" />
		<cfset variables.instance.AssessmentID = arguments.AssessmentID />
	</cffunction>
	<cffunction name="getAssessmentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessmentID />
	</cffunction>

	<cffunction name="setFileID" access="public" returntype="void" output="false">
		<cfargument name="FileID" type="string" required="true" />
		<cfset variables.instance.FileID = arguments.FileID />
	</cffunction>
	<cffunction name="getFileID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FileID />
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
