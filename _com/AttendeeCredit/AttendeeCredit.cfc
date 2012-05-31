
<cfcomponent displayname="AttendeeCredit" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.AttendeeCredit.AttendeeCredit" output="false">
		<cfargument name="AttendeeCreditID" type="string" required="false" default="" />
		<cfargument name="AttendeeID" type="string" required="false" default="" />
		<cfargument name="CreditID" type="string" required="false" default="" />
		<cfargument name="Amount" type="string" required="false" default="" />
		<cfargument name="ReferenceNo" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setAttendeeCreditID(arguments.AttendeeCreditID) />
		<cfset setAttendeeID(arguments.AttendeeID) />
		<cfset setCreditID(arguments.CreditID) />
		<cfset setAmount(arguments.Amount) />
		<cfset setReferenceNo(arguments.ReferenceNo) />
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
	<cffunction name="setMemento" access="public" returntype="_com.AttendeeCredit.AttendeeCredit" output="false">
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
		
		<!--- AttendeeCreditID --->
		<cfif (len(trim(getAttendeeCreditID())) AND NOT isNumeric(trim(getAttendeeCreditID())))>
			<cfset thisError.field = "AttendeeCreditID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AttendeeCreditID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AttendeeID --->
		<cfif (NOT len(trim(getAttendeeID())))>
			<cfset thisError.field = "AttendeeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "AttendeeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAttendeeID())) AND NOT isNumeric(trim(getAttendeeID())))>
			<cfset thisError.field = "AttendeeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AttendeeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CreditID --->
		<cfif (NOT len(trim(getCreditID())))>
			<cfset thisError.field = "CreditID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "CreditID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCreditID())) AND NOT isNumeric(trim(getCreditID())))>
			<cfset thisError.field = "CreditID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CreditID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Amount --->
		<cfif (len(trim(getAmount())) AND NOT isNumeric(trim(getAmount())))>
			<cfset thisError.field = "Amount" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Amount is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReferenceNo --->
		<cfif (len(trim(getReferenceNo())) AND NOT IsSimpleValue(trim(getReferenceNo())))>
			<cfset thisError.field = "ReferenceNo" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReferenceNo is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReferenceNo())) GT 50)>
			<cfset thisError.field = "ReferenceNo" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ReferenceNo is too long" />
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
	<cffunction name="setAttendeeCreditID" access="public" returntype="void" output="false">
		<cfargument name="AttendeeCreditID" type="string" required="true" />
		<cfset variables.instance.AttendeeCreditID = arguments.AttendeeCreditID />
	</cffunction>
	<cffunction name="getAttendeeCreditID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AttendeeCreditID />
	</cffunction>

	<cffunction name="setAttendeeID" access="public" returntype="void" output="false">
		<cfargument name="AttendeeID" type="string" required="true" />
		<cfset variables.instance.AttendeeID = arguments.AttendeeID />
	</cffunction>
	<cffunction name="getAttendeeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AttendeeID />
	</cffunction>

	<cffunction name="setCreditID" access="public" returntype="void" output="false">
		<cfargument name="CreditID" type="string" required="true" />
		<cfset variables.instance.CreditID = arguments.CreditID />
	</cffunction>
	<cffunction name="getCreditID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CreditID />
	</cffunction>

	<cffunction name="setAmount" access="public" returntype="void" output="false">
		<cfargument name="Amount" type="string" required="true" />
		<cfset variables.instance.Amount = arguments.Amount />
	</cffunction>
	<cffunction name="getAmount" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Amount />
	</cffunction>

	<cffunction name="setReferenceNo" access="public" returntype="void" output="false">
		<cfargument name="ReferenceNo" type="string" required="true" />
		<cfset variables.instance.ReferenceNo = arguments.ReferenceNo />
	</cffunction>
	<cffunction name="getReferenceNo" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReferenceNo />
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
