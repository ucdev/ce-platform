<cfcomponent displayname="Assessment" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.Assessment.Assessment" output="false">
		<cfargument name="AssessmentID" type="string" required="false" default="" />
		<cfargument name="AssessTypeID" type="string" required="false" default="" />
		<cfargument name="Name" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="PassingScore" type="string" required="false" default="" />
		<cfargument name="MaxAttempts" type="string" required="false" default="" />
		<cfargument name="RequiredFlag" type="string" required="false" default="" />
		<cfargument name="RandomFlag" type="string" required="false" default="" />
		<cfargument name="CommentFlag" type="string" required="false" default="" />
		<cfargument name="Sort" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="ExternalID" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setAssessmentID(arguments.AssessmentID) />
		<cfset setAssessTypeID(arguments.AssessTypeID) />
		<cfset setName(arguments.Name) />
		<cfset setDescription(arguments.Description) />
		<cfset setPassingScore(arguments.PassingScore) />
		<cfset setMaxAttempts(arguments.MaxAttempts) />
		<cfset setRequiredFlag(arguments.RequiredFlag) />
		<cfset setRandomFlag(arguments.RandomFlag) />
		<cfset setCommentFlag(arguments.CommentFlag) />
		<cfset setSort(arguments.Sort) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setExternalID(arguments.ExternalID) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		<cfset setCreated(arguments.Created) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setUpdatedBy(arguments.UpdatedBy) />
		<cfset setDeleted(arguments.Deleted) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.Assessment.Assessment" output="false">
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
		
		<!--- AssessmentID --->
		<cfif (len(trim(getAssessmentID())) AND NOT isNumeric(trim(getAssessmentID())))>
			<cfset thisError.field = "AssessmentID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessmentID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AssessTypeID --->
		<cfif (len(trim(getAssessTypeID())) AND NOT isNumeric(trim(getAssessTypeID())))>
			<cfset thisError.field = "AssessTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AssessTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Name --->
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
		<cfif (len(trim(getDescription())) GT 1073741823)>
			<cfset thisError.field = "Description" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Description is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PassingScore --->
		<cfif (len(trim(getPassingScore())) AND NOT isNumeric(trim(getPassingScore())))>
			<cfset thisError.field = "PassingScore" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PassingScore is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MaxAttempts --->
		<cfif (len(trim(getMaxAttempts())) AND NOT isNumeric(trim(getMaxAttempts())))>
			<cfset thisError.field = "MaxAttempts" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MaxAttempts is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RequiredFlag --->
		<cfif (len(trim(getRequiredFlag())) AND NOT IsSimpleValue(trim(getRequiredFlag())))>
			<cfset thisError.field = "RequiredFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RequiredFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getRequiredFlag())) GT 1)>
			<cfset thisError.field = "RequiredFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "RequiredFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RandomFlag --->
		<cfif (len(trim(getRandomFlag())) AND NOT IsSimpleValue(trim(getRandomFlag())))>
			<cfset thisError.field = "RandomFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RandomFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getRandomFlag())) GT 1)>
			<cfset thisError.field = "RandomFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "RandomFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CommentFlag --->
		<cfif (len(trim(getCommentFlag())) AND NOT IsSimpleValue(trim(getCommentFlag())))>
			<cfset thisError.field = "CommentFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CommentFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCommentFlag())) GT 1)>
			<cfset thisError.field = "CommentFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CommentFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Sort --->
		<cfif (len(trim(getSort())) AND NOT isNumeric(trim(getSort())))>
			<cfset thisError.field = "Sort" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Sort is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityID --->
		<cfif (len(trim(getActivityID())) AND NOT isNumeric(trim(getActivityID())))>
			<cfset thisError.field = "ActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ExternalID --->
		<cfif (len(trim(getExternalID())) AND NOT IsSimpleValue(trim(getExternalID())))>
			<cfset thisError.field = "ExternalID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ExternalID is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getExternalID())) GT 50)>
			<cfset thisError.field = "ExternalID" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ExternalID is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreatedBy --->
		<cfif (len(trim(getCreatedBy())) AND NOT isNumeric(trim(getCreatedBy())))>
			<cfset thisError.field = "CreatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreatedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Created --->
		<cfif (len(trim(getCreated())) AND NOT isDate(trim(getCreated())))>
			<cfset thisError.field = "Created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Created is not a date" />
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
		<cfif (len(trim(getUpdatedBy())) AND NOT IsSimpleValue(trim(getUpdatedBy())))>
			<cfset thisError.field = "UpdatedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "UpdatedBy is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getUpdatedBy())) GT 10)>
			<cfset thisError.field = "UpdatedBy" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "UpdatedBy is too long" />
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
	<cffunction name="setAssessmentID" access="public" returntype="void" output="false">
		<cfargument name="AssessmentID" type="string" required="true" />
		<cfset variables.instance.AssessmentID = arguments.AssessmentID />
	</cffunction>
	<cffunction name="getAssessmentID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessmentID />
	</cffunction>

	<cffunction name="setAssessTypeID" access="public" returntype="void" output="false">
		<cfargument name="AssessTypeID" type="string" required="true" />
		<cfset variables.instance.AssessTypeID = arguments.AssessTypeID />
	</cffunction>
	<cffunction name="getAssessTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AssessTypeID />
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

	<cffunction name="setPassingScore" access="public" returntype="void" output="false">
		<cfargument name="PassingScore" type="string" required="true" />
		<cfset variables.instance.PassingScore = arguments.PassingScore />
	</cffunction>
	<cffunction name="getPassingScore" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PassingScore />
	</cffunction>

	<cffunction name="setMaxAttempts" access="public" returntype="void" output="false">
		<cfargument name="MaxAttempts" type="string" required="true" />
		<cfset variables.instance.MaxAttempts = arguments.MaxAttempts />
	</cffunction>
	<cffunction name="getMaxAttempts" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MaxAttempts />
	</cffunction>

	<cffunction name="setRequiredFlag" access="public" returntype="void" output="false">
		<cfargument name="RequiredFlag" type="string" required="true" />
		<cfset variables.instance.RequiredFlag = arguments.RequiredFlag />
	</cffunction>
	<cffunction name="getRequiredFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RequiredFlag />
	</cffunction>

	<cffunction name="setRandomFlag" access="public" returntype="void" output="false">
		<cfargument name="RandomFlag" type="string" required="true" />
		<cfset variables.instance.RandomFlag = arguments.RandomFlag />
	</cffunction>
	<cffunction name="getRandomFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RandomFlag />
	</cffunction>

	<cffunction name="setCommentFlag" access="public" returntype="void" output="false">
		<cfargument name="CommentFlag" type="string" required="true" />
		<cfset variables.instance.CommentFlag = arguments.CommentFlag />
	</cffunction>
	<cffunction name="getCommentFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CommentFlag />
	</cffunction>

	<cffunction name="setSort" access="public" returntype="void" output="false">
		<cfargument name="Sort" type="string" required="true" />
		<cfset variables.instance.Sort = arguments.Sort />
	</cffunction>
	<cffunction name="getSort" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Sort />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setExternalID" access="public" returntype="void" output="false">
		<cfargument name="ExternalID" type="string" required="true" />
		<cfset variables.instance.ExternalID = arguments.ExternalID />
	</cffunction>
	<cffunction name="getExternalID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExternalID />
	</cffunction>

	<cffunction name="setCreatedBy" access="public" returntype="void" output="false">
		<cfargument name="CreatedBy" type="string" required="true" />
		<cfset variables.instance.CreatedBy = arguments.CreatedBy />
	</cffunction>
	<cffunction name="getCreatedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreatedBy />
	</cffunction>

	<cffunction name="setCreated" access="public" returntype="void" output="false">
		<cfargument name="Created" type="string" required="true" />
		<cfset variables.instance.Created = arguments.Created />
	</cffunction>
	<cffunction name="getCreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Created />
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
