
<cfcomponent displayname="ActivityFaculty" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ActivityFaculty.ActivityFaculty" output="false">
		<cfargument name="FacultyID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="PersonID" type="string" required="false" default="" />
		<cfargument name="CVFileID" type="string" required="false" default="" />
		<cfargument name="CVApproveFlag" type="string" required="false" default="" />
		<cfargument name="DisclosureFileID" type="string" required="false" default="" />
		<cfargument name="DisclosureApproveFlag" type="string" required="false" default="" />
		<cfargument name="RoleID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setFacultyID(arguments.FacultyID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setPersonID(arguments.PersonID) />
		<cfset setCVFileID(arguments.CVFileID) />
		<cfset setCVApproveFlag(arguments.CVApproveFlag) />
		<cfset setDisclosureFileID(arguments.DisclosureFileID) />
		<cfset setDisclosureApproveFlag(arguments.DisclosureApproveFlag) />
		<cfset setRoleID(arguments.RoleID) />
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
	<cffunction name="setMemento" access="public" returntype="_com.ActivityFaculty.ActivityFaculty" output="false">
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
		
		<!--- FacultyID --->
		<cfif (len(trim(getFacultyID())) AND NOT isNumeric(trim(getFacultyID())))>
			<cfset thisError.field = "FacultyID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FacultyID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityID --->
		<cfif (len(trim(getActivityID())) AND NOT isNumeric(trim(getActivityID())))>
			<cfset thisError.field = "ActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PersonID --->
		<cfif (len(trim(getPersonID())) AND NOT isNumeric(trim(getPersonID())))>
			<cfset thisError.field = "PersonID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PersonID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CVFileID --->
		<cfif (len(trim(getCVFileID())) AND NOT isNumeric(trim(getCVFileID())))>
			<cfset thisError.field = "CVFileID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CVFileID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CVApproveFlag --->
		<cfif (len(trim(getCVApproveFlag())) AND NOT IsSimpleValue(trim(getCVApproveFlag())))>
			<cfset thisError.field = "CVApproveFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CVApproveFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCVApproveFlag())) GT 1)>
			<cfset thisError.field = "CVApproveFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CVApproveFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DisclosureFileID --->
		<cfif (len(trim(getDisclosureFileID())) AND NOT isNumeric(trim(getDisclosureFileID())))>
			<cfset thisError.field = "DisclosureFileID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DisclosureFileID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DisclosureApproveFlag --->
		<cfif (len(trim(getDisclosureApproveFlag())) AND NOT IsSimpleValue(trim(getDisclosureApproveFlag())))>
			<cfset thisError.field = "DisclosureApproveFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DisclosureApproveFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getDisclosureApproveFlag())) GT 1)>
			<cfset thisError.field = "DisclosureApproveFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "DisclosureApproveFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- RoleID --->
		<cfif (len(trim(getRoleID())) AND NOT isNumeric(trim(getRoleID())))>
			<cfset thisError.field = "RoleID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "RoleID is not numeric" />
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
	<cffunction name="setFacultyID" access="public" returntype="void" output="false">
		<cfargument name="FacultyID" type="string" required="true" />
		<cfset variables.instance.FacultyID = arguments.FacultyID />
	</cffunction>
	<cffunction name="getFacultyID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FacultyID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setPersonID" access="public" returntype="void" output="false">
		<cfargument name="PersonID" type="string" required="true" />
		<cfset variables.instance.PersonID = arguments.PersonID />
	</cffunction>
	<cffunction name="getPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonID />
	</cffunction>

	<cffunction name="setCVFileID" access="public" returntype="void" output="false">
		<cfargument name="CVFileID" type="string" required="true" />
		<cfset variables.instance.CVFileID = arguments.CVFileID />
	</cffunction>
	<cffunction name="getCVFileID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CVFileID />
	</cffunction>

	<cffunction name="setCVApproveFlag" access="public" returntype="void" output="false">
		<cfargument name="CVApproveFlag" type="string" required="true" />
		<cfset variables.instance.CVApproveFlag = arguments.CVApproveFlag />
	</cffunction>
	<cffunction name="getCVApproveFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CVApproveFlag />
	</cffunction>

	<cffunction name="setDisclosureFileID" access="public" returntype="void" output="false">
		<cfargument name="DisclosureFileID" type="string" required="true" />
		<cfset variables.instance.DisclosureFileID = arguments.DisclosureFileID />
	</cffunction>
	<cffunction name="getDisclosureFileID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DisclosureFileID />
	</cffunction>

	<cffunction name="setDisclosureApproveFlag" access="public" returntype="void" output="false">
		<cfargument name="DisclosureApproveFlag" type="string" required="true" />
		<cfset variables.instance.DisclosureApproveFlag = arguments.DisclosureApproveFlag />
	</cffunction>
	<cffunction name="getDisclosureApproveFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DisclosureApproveFlag />
	</cffunction>

	<cffunction name="setRoleID" access="public" returntype="void" output="false">
		<cfargument name="RoleID" type="string" required="true" />
		<cfset variables.instance.RoleID = arguments.RoleID />
	</cffunction>
	<cffunction name="getRoleID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.RoleID />
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
