
<cfcomponent displayname="Activity" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.Activity.Activity" output="false">
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="ParentActivityID" type="string" required="false" default="" />
		<cfargument name="ActivityTypeID" type="string" required="false" default="" />
		<cfargument name="GroupingID" type="string" required="false" default="" />
		<cfargument name="Title" type="string" required="false" default="" />
		<cfargument name="Description" type="string" required="false" default="" />
		<cfargument name="ReleaseDate" type="string" required="false" default="" />
		<cfargument name="StartDate" type="string" required="false" default="" />
		<cfargument name="EndDate" type="string" required="false" default="" />
		<cfargument name="LocationID" type="string" required="false" default="" />
		<cfargument name="Location" type="string" required="false" default="" />
		<cfargument name="Address1" type="string" required="false" default="" />
		<cfargument name="Address2" type="string" required="false" default="" />
		<cfargument name="City" type="string" required="false" default="" />
		<cfargument name="State" type="string" required="false" default="" />
		<cfargument name="Country" type="string" required="false" default="" />
		<cfargument name="PostalCode" type="string" required="false" default="" />
		<cfargument name="SessionType" type="string" required="false" default="" />
		<cfargument name="StatusID" type="string" required="false" default="" />
		<cfargument name="StatMaxRegistrants" type="string" required="false" default="" />
		<cfargument name="StatAttendees" type="string" required="false" default="" />
		<cfargument name="StatAddlAttendees" type="string" required="false" default="" />
		<cfargument name="StatCMEHours" type="string" required="false" default="" />
		<cfargument name="StatMD" type="string" required="false" default="" />
		<cfargument name="StatNonMD" type="string" required="false" default="" />
		<cfargument name="StatSupporters" type="string" required="false" default="" />
		<cfargument name="StatSuppAmount" type="string" required="false" default="" />
		<cfargument name="Sponsorship" type="string" required="false" default="" />
		<cfargument name="Sponsor" type="string" required="false" default="" />
		<cfargument name="ExternalID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setParentActivityID(arguments.ParentActivityID) />
		<cfset setActivityTypeID(arguments.ActivityTypeID) />
		<cfset setGroupingID(arguments.GroupingID) />
		<cfset setTitle(arguments.Title) />
		<cfset setDescription(arguments.Description) />
		<cfset setReleaseDate(arguments.ReleaseDate) />
		<cfset setStartDate(arguments.StartDate) />
		<cfset setEndDate(arguments.EndDate) />
		<cfset setLocationID(arguments.LocationID) />
		<cfset setLocation(arguments.Location) />
		<cfset setAddress1(arguments.Address1) />
		<cfset setAddress2(arguments.Address2) />
		<cfset setCity(arguments.City) />
		<cfset setState(arguments.State) />
		<cfset setCountry(arguments.Country) />
		<cfset setPostalCode(arguments.PostalCode) />
		<cfset setSessionType(arguments.SessionType) />
		<cfset setStatusID(arguments.StatusID) />
		<cfset setStatMaxRegistrants(arguments.StatMaxRegistrants) />
		<cfset setStatAttendees(arguments.StatAttendees) />
		<cfset setStatAddlAttendees(arguments.StatAddlAttendees) />
		<cfset setStatCMEHours(arguments.StatCMEHours) />
		<cfset setStatMD(arguments.StatMD) />
		<cfset setStatNonMD(arguments.StatNonMD) />
		<cfset setStatSupporters(arguments.StatSupporters) />
		<cfset setStatSuppAmount(arguments.StatSuppAmount) />
		<cfset setSponsorship(arguments.Sponsorship) />
		<cfset setSponsor(arguments.Sponsor) />
		<cfset setExternalID(arguments.ExternalID) />
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
	<cffunction name="setMemento" access="public" returntype="_com.Activity.Activity" output="false">
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
		
		<!--- ActivityID --->
		<cfif (len(trim(getActivityID())) AND NOT isNumeric(trim(getActivityID())))>
			<cfset thisError.field = "ActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ParentActivityID --->
		<cfif (len(trim(getParentActivityID())) AND NOT isNumeric(trim(getParentActivityID())))>
			<cfset thisError.field = "ParentActivityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ParentActivityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ActivityTypeID --->
		<cfif (NOT len(trim(getActivityTypeID())))>
			<cfset thisError.field = "ActivityTypeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ActivityTypeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getActivityTypeID())) AND NOT isNumeric(trim(getActivityTypeID())))>
			<cfset thisError.field = "ActivityTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ActivityTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- GroupingID --->
		<cfif (len(trim(getGroupingID())) AND NOT isNumeric(trim(getGroupingID())))>
			<cfset thisError.field = "GroupingID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "GroupingID is not numeric" />
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
		<cfif (len(trim(getTitle())) GT 750)>
			<cfset thisError.field = "Title" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Title is too long" />
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
		
		<!--- ReleaseDate --->
		<cfif (NOT len(trim(getReleaseDate())))>
			<cfset thisError.field = "ReleaseDate" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "ReleaseDate is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReleaseDate())) AND NOT isDate(trim(getReleaseDate())))>
			<cfset thisError.field = "ReleaseDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReleaseDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StartDate --->
		<cfif (len(trim(getStartDate())) AND NOT isDate(trim(getStartDate())))>
			<cfset thisError.field = "StartDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StartDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- EndDate --->
		<cfif (len(trim(getEndDate())) AND NOT isDate(trim(getEndDate())))>
			<cfset thisError.field = "EndDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "EndDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
        
			<cfif (len(trim(getEndDate())) AND isDate(trim(getEndDate())) AND trim(getEndDate()) LT trim(getStartDate()))>
                <cfset thisError.field = "EndDate" />
                <cfset thisError.type = "Erroneous Date" />
                <cfset thisError.message = "End Date cannot happen before Start Date." />
                <cfset arrayAppend(errors,duplicate(thisError)) />
            </cfif>
		
		<!--- LocationID --->
		<cfif (len(trim(getLocationID())) AND NOT isNumeric(trim(getLocationID())))>
			<cfset thisError.field = "LocationID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "LocationID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Location --->
		<cfif (len(trim(getLocation())) AND NOT IsSimpleValue(trim(getLocation())))>
			<cfset thisError.field = "Location" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Location is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLocation())) GT 255)>
			<cfset thisError.field = "Location" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Location is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Address1 --->
		<cfif (len(trim(getAddress1())) AND NOT IsSimpleValue(trim(getAddress1())))>
			<cfset thisError.field = "Address1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Address1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAddress1())) GT 255)>
			<cfset thisError.field = "Address1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Address1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Address2 --->
		<cfif (len(trim(getAddress2())) AND NOT IsSimpleValue(trim(getAddress2())))>
			<cfset thisError.field = "Address2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Address2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAddress2())) GT 255)>
			<cfset thisError.field = "Address2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Address2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- City --->
		<cfif (len(trim(getCity())) AND NOT IsSimpleValue(trim(getCity())))>
			<cfset thisError.field = "City" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "City is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCity())) GT 100)>
			<cfset thisError.field = "City" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "City is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PostalCode --->
		<cfif (len(trim(getPostalCode())) AND NOT IsSimpleValue(trim(getPostalCode())))>
			<cfset thisError.field = "PostalCode" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PostalCode is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPostalCode())) GT 15)>
			<cfset thisError.field = "PostalCode" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "PostalCode is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SessionType --->
		<cfif (len(trim(getSessionType())) AND NOT IsSimpleValue(trim(getSessionType())))>
			<cfset thisError.field = "SessionType" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SessionType is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSessionType())) GT 1)>
			<cfset thisError.field = "SessionType" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SessionType is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatusID --->
		<cfif (len(trim(getStatusID())) AND NOT isNumeric(trim(getStatusID())))>
			<cfset thisError.field = "StatusID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatusID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatMaxRegistrants --->
		<cfif (len(trim(getStatMaxRegistrants())) AND NOT isNumeric(trim(getStatMaxRegistrants())))>
			<cfset thisError.field = "StatMaxRegistrants" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatMaxRegistrants is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatAttendees --->
		<cfif (len(trim(getStatAttendees())) AND NOT isNumeric(trim(getStatAttendees())))>
			<cfset thisError.field = "StatAttendees" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatAttendees is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatAddlAttendees --->
		<cfif (len(trim(getStatAddlAttendees())) AND NOT isNumeric(trim(getStatAddlAttendees())))>
			<cfset thisError.field = "StatAddlAttendees" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatAddlAttendees is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatCMEHours --->
		<cfif (len(trim(getStatCMEHours())) AND NOT isNumeric(trim(getStatCMEHours())))>
			<cfset thisError.field = "StatCMEHours" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatCMEHours is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatMD --->
		<cfif (len(trim(getStatMD())) AND NOT isNumeric(trim(getStatMD())))>
			<cfset thisError.field = "StatMD" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatMD is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatNonMD --->
		<cfif (len(trim(getStatNonMD())) AND NOT isNumeric(trim(getStatNonMD())))>
			<cfset thisError.field = "StatNonMD" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatNonMD is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatSupporters --->
		<cfif (len(trim(getStatSupporters())) AND NOT isNumeric(trim(getStatSupporters())))>
			<cfset thisError.field = "StatSupporters" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatSupporters is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatSuppAmount --->
		<cfif (len(trim(getStatSuppAmount())) AND NOT isNumeric(trim(getStatSuppAmount())))>
			<cfset thisError.field = "StatSuppAmount" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatSuppAmount is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Sponsorship --->
		<cfif (len(trim(getSponsorship())) AND NOT IsSimpleValue(trim(getSponsorship())))>
			<cfset thisError.field = "Sponsorship" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Sponsorship is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSponsorship())) GT 1)>
			<cfset thisError.field = "Sponsorship" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Sponsorship is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Sponsor --->
		<cfif (len(trim(getSponsor())) AND NOT IsSimpleValue(trim(getSponsor())))>
			<cfset thisError.field = "Sponsor" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Sponsor is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSponsor())) GT 255)>
			<cfset thisError.field = "Sponsor" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Sponsor is too long" />
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
	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setParentActivityID" access="public" returntype="void" output="false">
		<cfargument name="ParentActivityID" type="string" required="true" />
		<cfset variables.instance.ParentActivityID = arguments.ParentActivityID />
	</cffunction>
	<cffunction name="getParentActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ParentActivityID />
	</cffunction>

	<cffunction name="setActivityTypeID" access="public" returntype="void" output="false">
		<cfargument name="ActivityTypeID" type="string" required="true" />
		<cfset variables.instance.ActivityTypeID = arguments.ActivityTypeID />
	</cffunction>
	<cffunction name="getActivityTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityTypeID />
	</cffunction>

	<cffunction name="setGroupingID" access="public" returntype="void" output="false">
		<cfargument name="GroupingID" type="string" required="true" />
		<cfset variables.instance.GroupingID = arguments.GroupingID />
	</cffunction>
	<cffunction name="getGroupingID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.GroupingID />
	</cffunction>

	<cffunction name="setTitle" access="public" returntype="void" output="false">
		<cfargument name="Title" type="string" required="true" />
		<cfset variables.instance.Title = arguments.Title />
	</cffunction>
	<cffunction name="getTitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Title />
	</cffunction>

	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="Description" type="string" required="true" />
		<cfset variables.instance.Description = arguments.Description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Description />
	</cffunction>

	<cffunction name="setReleaseDate" access="public" returntype="void" output="false">
		<cfargument name="ReleaseDate" type="string" required="true" />
		<cfset variables.instance.ReleaseDate = arguments.ReleaseDate />
	</cffunction>
	<cffunction name="getReleaseDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReleaseDate />
	</cffunction>

	<cffunction name="setStartDate" access="public" returntype="void" output="false">
		<cfargument name="StartDate" type="string" required="true" />
		<cfset variables.instance.StartDate = arguments.StartDate />
	</cffunction>
	<cffunction name="getStartDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StartDate />
	</cffunction>

	<cffunction name="setEndDate" access="public" returntype="void" output="false">
		<cfargument name="EndDate" type="string" required="true" />
		<cfset variables.instance.EndDate = arguments.EndDate />
	</cffunction>
	<cffunction name="getEndDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.EndDate />
	</cffunction>

	<cffunction name="setLocationID" access="public" returntype="void" output="false">
		<cfargument name="LocationID" type="string" required="true" />
		<cfset variables.instance.LocationID = arguments.LocationID />
	</cffunction>
	<cffunction name="getLocationID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LocationID />
	</cffunction>

	<cffunction name="setLocation" access="public" returntype="void" output="false">
		<cfargument name="Location" type="string" required="true" />
		<cfset variables.instance.Location = arguments.Location />
	</cffunction>
	<cffunction name="getLocation" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Location />
	</cffunction>

	<cffunction name="setAddress1" access="public" returntype="void" output="false">
		<cfargument name="Address1" type="string" required="true" />
		<cfset variables.instance.Address1 = arguments.Address1 />
	</cffunction>
	<cffunction name="getAddress1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Address1 />
	</cffunction>

	<cffunction name="setAddress2" access="public" returntype="void" output="false">
		<cfargument name="Address2" type="string" required="true" />
		<cfset variables.instance.Address2 = arguments.Address2 />
	</cffunction>
	<cffunction name="getAddress2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Address2 />
	</cffunction>

	<cffunction name="setCity" access="public" returntype="void" output="false">
		<cfargument name="City" type="string" required="true" />
		<cfset variables.instance.City = arguments.City />
	</cffunction>
	<cffunction name="getCity" access="public" returntype="string" output="false">
		<cfreturn variables.instance.City />
	</cffunction>

	<cffunction name="setState" access="public" returntype="void" output="false">
		<cfargument name="State" type="string" required="true" />
		<cfset variables.instance.State = arguments.State />
	</cffunction>
	<cffunction name="getState" access="public" returntype="string" output="false">
		<cfreturn variables.instance.State />
	</cffunction>
	
	<cffunction name="setCountry" access="public" returntype="void" output="false">
		<cfargument name="Country" type="string" required="true" />
		<cfset variables.instance.Country = arguments.Country />
	</cffunction>
	<cffunction name="getCountry" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Country />
	</cffunction>

	<cffunction name="setPostalCode" access="public" returntype="void" output="false">
		<cfargument name="PostalCode" type="string" required="true" />
		<cfset variables.instance.PostalCode = arguments.PostalCode />
	</cffunction>
	<cffunction name="getPostalCode" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PostalCode />
	</cffunction>

	<cffunction name="setSessionType" access="public" returntype="void" output="false">
		<cfargument name="SessionType" type="string" required="true" />
		<cfset variables.instance.SessionType = arguments.SessionType />
	</cffunction>
	<cffunction name="getSessionType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SessionType />
	</cffunction>

	<cffunction name="setStatusID" access="public" returntype="void" output="false">
		<cfargument name="StatusID" type="string" required="true" />
		<cfset variables.instance.StatusID = arguments.StatusID />
	</cffunction>
	<cffunction name="getStatusID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatusID />
	</cffunction>

	<cffunction name="setStatMaxRegistrants" access="public" returntype="void" output="false">
		<cfargument name="StatMaxRegistrants" type="string" required="true" />
		<cfset variables.instance.StatMaxRegistrants = arguments.StatMaxRegistrants />
	</cffunction>
	<cffunction name="getStatMaxRegistrants" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatMaxRegistrants />
	</cffunction>

	<cffunction name="setStatAttendees" access="public" returntype="void" output="false">
		<cfargument name="StatAttendees" type="string" required="true" />
		<cfset variables.instance.StatAttendees = arguments.StatAttendees />
	</cffunction>
	<cffunction name="getStatAttendees" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatAttendees />
	</cffunction>

	<cffunction name="setStatAddlAttendees" access="public" returntype="void" output="false">
		<cfargument name="StatAddlAttendees" type="string" required="true" />
		<cfset variables.instance.StatAddlAttendees = arguments.StatAddlAttendees />
	</cffunction>
	<cffunction name="getStatAddlAttendees" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatAddlAttendees />
	</cffunction>

	<cffunction name="setStatCMEHours" access="public" returntype="void" output="false">
		<cfargument name="StatCMEHours" type="string" required="true" />
		<cfset variables.instance.StatCMEHours = arguments.StatCMEHours />
	</cffunction>
	<cffunction name="getStatCMEHours" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatCMEHours />
	</cffunction>

	<cffunction name="setStatMD" access="public" returntype="void" output="false">
		<cfargument name="StatMD" type="string" required="true" />
		<cfset variables.instance.StatMD = arguments.StatMD />
	</cffunction>
	<cffunction name="getStatMD" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatMD />
	</cffunction>

	<cffunction name="setStatNonMD" access="public" returntype="void" output="false">
		<cfargument name="StatNonMD" type="string" required="true" />
		<cfset variables.instance.StatNonMD = arguments.StatNonMD />
	</cffunction>
	<cffunction name="getStatNonMD" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatNonMD />
	</cffunction>

	<cffunction name="setStatSupporters" access="public" returntype="void" output="false">
		<cfargument name="StatSupporters" type="string" required="true" />
		<cfset variables.instance.StatSupporters = arguments.StatSupporters />
	</cffunction>
	<cffunction name="getStatSupporters" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatSupporters />
	</cffunction>

	<cffunction name="setStatSuppAmount" access="public" returntype="void" output="false">
		<cfargument name="StatSuppAmount" type="string" required="true" />
		<cfset variables.instance.StatSuppAmount = arguments.StatSuppAmount />
	</cffunction>
	<cffunction name="getStatSuppAmount" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatSuppAmount />
	</cffunction>

	<cffunction name="setSponsorship" access="public" returntype="void" output="false">
		<cfargument name="Sponsorship" type="string" required="true" />
		<cfset variables.instance.Sponsorship = arguments.Sponsorship />
	</cffunction>
	<cffunction name="getSponsorship" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Sponsorship />
	</cffunction>

	<cffunction name="setSponsor" access="public" returntype="void" output="false">
		<cfargument name="Sponsor" type="string" required="true" />
		<cfset variables.instance.Sponsor = arguments.Sponsor />
	</cffunction>
	<cffunction name="getSponsor" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Sponsor />
	</cffunction>

	<cffunction name="setExternalID" access="public" returntype="void" output="false">
		<cfargument name="ExternalID" type="string" required="true" />
		<cfset variables.instance.ExternalID = arguments.ExternalID />
	</cffunction>
	<cffunction name="getExternalID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ExternalID />
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
