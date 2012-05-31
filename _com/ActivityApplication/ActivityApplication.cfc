<cfcomponent displayname="ActivityApplication" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ActivityApplication.ActivityApplication" output="false">
		<cfargument name="ApplicationID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="ReceivedFlag" type="string" required="false" default="" />
		<cfargument name="ReceivedDate" type="string" required="false" default="" />
		<cfargument name="SentFlag" type="string" required="false" default="" />
		<cfargument name="SentDate" type="string" required="false" default="" />
		<cfargument name="ApprovedFlag" type="string" required="false" default="" />
		<cfargument name="ApprovedDate" type="string" required="false" default="" />
		<cfargument name="NeedsFlag" type="string" required="false" default="" />
		<cfargument name="NeedsDate" type="string" required="false" default="" />
		<cfargument name="ObjFlag" type="string" required="false" default="" />
		<cfargument name="ObjDate" type="string" required="false" default="" />
		<cfargument name="SuppFlag" type="string" required="false" default="" />
		<cfargument name="SuppDate" type="string" required="false" default="" />
		<cfargument name="AttendFlag" type="string" required="false" default="" />
		<cfargument name="AttendDate" type="string" required="false" default="" />
		<cfargument name="CVFlag" type="string" required="false" default="" />
		<cfargument name="CVDate" type="string" required="false" default="" />
		<cfargument name="BrochFlag" type="string" required="false" default="" />
		<cfargument name="BrochDate" type="string" required="false" default="" />
		<cfargument name="MembApprFlag" type="string" required="false" default="" />
		<cfargument name="MembApprDate" type="string" required="false" default="" />
		<cfargument name="ConflictFlag" type="string" required="false" default="" />
		<cfargument name="ConflictDate" type="string" required="false" default="" />
		<cfargument name="EvalFlag" type="string" required="false" default="" />
		<cfargument name="EvalDate" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setApplicationID(arguments.ApplicationID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setReceivedFlag(arguments.ReceivedFlag) />
		<cfset setReceivedDate(arguments.ReceivedDate) />
		<cfset setSentFlag(arguments.SentFlag) />
		<cfset setSentDate(arguments.SentDate) />
		<cfset setApprovedFlag(arguments.ApprovedFlag) />
		<cfset setApprovedDate(arguments.ApprovedDate) />
		<cfset setNeedsFlag(arguments.NeedsFlag) />
		<cfset setNeedsDate(arguments.NeedsDate) />
		<cfset setObjFlag(arguments.ObjFlag) />
		<cfset setObjDate(arguments.ObjDate) />
		<cfset setSuppFlag(arguments.SuppFlag) />
		<cfset setSuppDate(arguments.SuppDate) />
		<cfset setAttendFlag(arguments.AttendFlag) />
		<cfset setAttendDate(arguments.AttendDate) />
		<cfset setCVFlag(arguments.CVFlag) />
		<cfset setCVDate(arguments.CVDate) />
		<cfset setBrochFlag(arguments.BrochFlag) />
		<cfset setBrochDate(arguments.BrochDate) />
		<cfset setMembApprFlag(arguments.MembApprFlag) />
		<cfset setMembApprDate(arguments.MembApprDate) />
		<cfset setConflictFlag(arguments.ConflictFlag) />
		<cfset setConflictDate(arguments.ConflictDate) />
		<cfset setEvalFlag(arguments.EvalFlag) />
		<cfset setEvalDate(arguments.EvalDate) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.ActivityApplication.ActivityApplication" output="false">
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
		
		<!--- ApplicationID --->
		<cfif (len(trim(getApplicationID())) AND NOT isNumeric(trim(getApplicationID())))>
			<cfset thisError.field = "ApplicationID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ApplicationID is not numeric" />
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
		
		<!--- ReceivedFlag --->
		<cfif (len(trim(getReceivedFlag())) AND NOT IsSimpleValue(trim(getReceivedFlag())))>
			<cfset thisError.field = "ReceivedFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReceivedFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getReceivedFlag())) GT 1)>
			<cfset thisError.field = "ReceivedFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ReceivedFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ReceivedDate --->
		<cfif (len(trim(getReceivedDate())) AND NOT isDate(trim(getReceivedDate())))>
			<cfset thisError.field = "ReceivedDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ReceivedDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SentFlag --->
		<cfif (len(trim(getSentFlag())) AND NOT IsSimpleValue(trim(getSentFlag())))>
			<cfset thisError.field = "SentFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SentFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSentFlag())) GT 1)>
			<cfset thisError.field = "SentFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SentFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SentDate --->
		<cfif (len(trim(getSentDate())) AND NOT isDate(trim(getSentDate())))>
			<cfset thisError.field = "SentDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SentDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ApprovedFlag --->
		<cfif (len(trim(getApprovedFlag())) AND NOT IsSimpleValue(trim(getApprovedFlag())))>
			<cfset thisError.field = "ApprovedFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ApprovedFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getApprovedFlag())) GT 1)>
			<cfset thisError.field = "ApprovedFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ApprovedFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ApprovedDate --->
		<cfif (len(trim(getApprovedDate())) AND NOT isDate(trim(getApprovedDate())))>
			<cfset thisError.field = "ApprovedDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ApprovedDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- NeedsFlag --->
		<cfif (len(trim(getNeedsFlag())) AND NOT IsSimpleValue(trim(getNeedsFlag())))>
			<cfset thisError.field = "NeedsFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "NeedsFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getNeedsFlag())) GT 1)>
			<cfset thisError.field = "NeedsFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "NeedsFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- NeedsDate --->
		<cfif (len(trim(getNeedsDate())) AND NOT isDate(trim(getNeedsDate())))>
			<cfset thisError.field = "NeedsDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "NeedsDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ObjFlag --->
		<cfif (len(trim(getObjFlag())) AND NOT IsSimpleValue(trim(getObjFlag())))>
			<cfset thisError.field = "ObjFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ObjFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getObjFlag())) GT 1)>
			<cfset thisError.field = "ObjFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ObjFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ObjDate --->
		<cfif (len(trim(getObjDate())) AND NOT isDate(trim(getObjDate())))>
			<cfset thisError.field = "ObjDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ObjDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SuppFlag --->
		<cfif (len(trim(getSuppFlag())) AND NOT IsSimpleValue(trim(getSuppFlag())))>
			<cfset thisError.field = "SuppFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SuppFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSuppFlag())) GT 1)>
			<cfset thisError.field = "SuppFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SuppFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SuppDate --->
		<cfif (len(trim(getSuppDate())) AND NOT isDate(trim(getSuppDate())))>
			<cfset thisError.field = "SuppDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SuppDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AttendFlag --->
		<cfif (len(trim(getAttendFlag())) AND NOT IsSimpleValue(trim(getAttendFlag())))>
			<cfset thisError.field = "AttendFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AttendFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getAttendFlag())) GT 1)>
			<cfset thisError.field = "AttendFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "AttendFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AttendDate --->
		<cfif (len(trim(getAttendDate())) AND NOT isDate(trim(getAttendDate())))>
			<cfset thisError.field = "AttendDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AttendDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CVFlag --->
		<cfif (len(trim(getCVFlag())) AND NOT IsSimpleValue(trim(getCVFlag())))>
			<cfset thisError.field = "CVFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CVFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCVFlag())) GT 1)>
			<cfset thisError.field = "CVFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CVFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CVDate --->
		<cfif (len(trim(getCVDate())) AND NOT isDate(trim(getCVDate())))>
			<cfset thisError.field = "CVDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CVDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- BrochFlag --->
		<cfif (len(trim(getBrochFlag())) AND NOT IsSimpleValue(trim(getBrochFlag())))>
			<cfset thisError.field = "BrochFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "BrochFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getBrochFlag())) GT 1)>
			<cfset thisError.field = "BrochFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "BrochFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- BrochDate --->
		<cfif (len(trim(getBrochDate())) AND NOT isDate(trim(getBrochDate())))>
			<cfset thisError.field = "BrochDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "BrochDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MembApprFlag --->
		<cfif (len(trim(getMembApprFlag())) AND NOT IsSimpleValue(trim(getMembApprFlag())))>
			<cfset thisError.field = "MembApprFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MembApprFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getMembApprFlag())) GT 1)>
			<cfset thisError.field = "MembApprFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "MembApprFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MembApprDate --->
		<cfif (len(trim(getMembApprDate())) AND NOT isDate(trim(getMembApprDate())))>
			<cfset thisError.field = "MembApprDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MembApprDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ConflictFlag --->
		<cfif (len(trim(getConflictFlag())) AND NOT IsSimpleValue(trim(getConflictFlag())))>
			<cfset thisError.field = "ConflictFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ConflictFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getConflictFlag())) GT 1)>
			<cfset thisError.field = "ConflictFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ConflictFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ConflictDate --->
		<cfif (len(trim(getConflictDate())) AND NOT isDate(trim(getConflictDate())))>
			<cfset thisError.field = "ConflictDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ConflictDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- EvalFlag --->
		<cfif (len(trim(getEvalFlag())) AND NOT IsSimpleValue(trim(getEvalFlag())))>
			<cfset thisError.field = "EvalFlag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "EvalFlag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getEvalFlag())) GT 1)>
			<cfset thisError.field = "EvalFlag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "EvalFlag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- EvalDate --->
		<cfif (len(trim(getEvalDate())) AND NOT isDate(trim(getEvalDate())))>
			<cfset thisError.field = "EvalDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "EvalDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setApplicationID" access="public" returntype="void" output="false">
		<cfargument name="ApplicationID" type="string" required="true" />
		<cfset variables.instance.ApplicationID = arguments.ApplicationID />
	</cffunction>
	<cffunction name="getApplicationID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ApplicationID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setReceivedFlag" access="public" returntype="void" output="false">
		<cfargument name="ReceivedFlag" type="string" required="true" />
		<cfset variables.instance.ReceivedFlag = arguments.ReceivedFlag />
	</cffunction>
	<cffunction name="getReceivedFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReceivedFlag />
	</cffunction>

	<cffunction name="setReceivedDate" access="public" returntype="void" output="false">
		<cfargument name="ReceivedDate" type="string" required="true" />
		<cfset variables.instance.ReceivedDate = arguments.ReceivedDate />
	</cffunction>
	<cffunction name="getReceivedDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ReceivedDate />
	</cffunction>

	<cffunction name="setSentFlag" access="public" returntype="void" output="false">
		<cfargument name="SentFlag" type="string" required="true" />
		<cfset variables.instance.SentFlag = arguments.SentFlag />
	</cffunction>
	<cffunction name="getSentFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SentFlag />
	</cffunction>

	<cffunction name="setSentDate" access="public" returntype="void" output="false">
		<cfargument name="SentDate" type="string" required="true" />
		<cfset variables.instance.SentDate = arguments.SentDate />
	</cffunction>
	<cffunction name="getSentDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SentDate />
	</cffunction>

	<cffunction name="setApprovedFlag" access="public" returntype="void" output="false">
		<cfargument name="ApprovedFlag" type="string" required="true" />
		<cfset variables.instance.ApprovedFlag = arguments.ApprovedFlag />
	</cffunction>
	<cffunction name="getApprovedFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ApprovedFlag />
	</cffunction>

	<cffunction name="setApprovedDate" access="public" returntype="void" output="false">
		<cfargument name="ApprovedDate" type="string" required="true" />
		<cfset variables.instance.ApprovedDate = arguments.ApprovedDate />
	</cffunction>
	<cffunction name="getApprovedDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ApprovedDate />
	</cffunction>

	<cffunction name="setNeedsFlag" access="public" returntype="void" output="false">
		<cfargument name="NeedsFlag" type="string" required="true" />
		<cfset variables.instance.NeedsFlag = arguments.NeedsFlag />
	</cffunction>
	<cffunction name="getNeedsFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.NeedsFlag />
	</cffunction>

	<cffunction name="setNeedsDate" access="public" returntype="void" output="false">
		<cfargument name="NeedsDate" type="string" required="true" />
		<cfset variables.instance.NeedsDate = arguments.NeedsDate />
	</cffunction>
	<cffunction name="getNeedsDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.NeedsDate />
	</cffunction>

	<cffunction name="setObjFlag" access="public" returntype="void" output="false">
		<cfargument name="ObjFlag" type="string" required="true" />
		<cfset variables.instance.ObjFlag = arguments.ObjFlag />
	</cffunction>
	<cffunction name="getObjFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ObjFlag />
	</cffunction>

	<cffunction name="setObjDate" access="public" returntype="void" output="false">
		<cfargument name="ObjDate" type="string" required="true" />
		<cfset variables.instance.ObjDate = arguments.ObjDate />
	</cffunction>
	<cffunction name="getObjDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ObjDate />
	</cffunction>

	<cffunction name="setSuppFlag" access="public" returntype="void" output="false">
		<cfargument name="SuppFlag" type="string" required="true" />
		<cfset variables.instance.SuppFlag = arguments.SuppFlag />
	</cffunction>
	<cffunction name="getSuppFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SuppFlag />
	</cffunction>

	<cffunction name="setSuppDate" access="public" returntype="void" output="false">
		<cfargument name="SuppDate" type="string" required="true" />
		<cfset variables.instance.SuppDate = arguments.SuppDate />
	</cffunction>
	<cffunction name="getSuppDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SuppDate />
	</cffunction>

	<cffunction name="setAttendFlag" access="public" returntype="void" output="false">
		<cfargument name="AttendFlag" type="string" required="true" />
		<cfset variables.instance.AttendFlag = arguments.AttendFlag />
	</cffunction>
	<cffunction name="getAttendFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AttendFlag />
	</cffunction>

	<cffunction name="setAttendDate" access="public" returntype="void" output="false">
		<cfargument name="AttendDate" type="string" required="true" />
		<cfset variables.instance.AttendDate = arguments.AttendDate />
	</cffunction>
	<cffunction name="getAttendDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AttendDate />
	</cffunction>

	<cffunction name="setCVFlag" access="public" returntype="void" output="false">
		<cfargument name="CVFlag" type="string" required="true" />
		<cfset variables.instance.CVFlag = arguments.CVFlag />
	</cffunction>
	<cffunction name="getCVFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CVFlag />
	</cffunction>

	<cffunction name="setCVDate" access="public" returntype="void" output="false">
		<cfargument name="CVDate" type="string" required="true" />
		<cfset variables.instance.CVDate = arguments.CVDate />
	</cffunction>
	<cffunction name="getCVDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CVDate />
	</cffunction>

	<cffunction name="setBrochFlag" access="public" returntype="void" output="false">
		<cfargument name="BrochFlag" type="string" required="true" />
		<cfset variables.instance.BrochFlag = arguments.BrochFlag />
	</cffunction>
	<cffunction name="getBrochFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.BrochFlag />
	</cffunction>

	<cffunction name="setBrochDate" access="public" returntype="void" output="false">
		<cfargument name="BrochDate" type="string" required="true" />
		<cfset variables.instance.BrochDate = arguments.BrochDate />
	</cffunction>
	<cffunction name="getBrochDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.BrochDate />
	</cffunction>

	<cffunction name="setMembApprFlag" access="public" returntype="void" output="false">
		<cfargument name="MembApprFlag" type="string" required="true" />
		<cfset variables.instance.MembApprFlag = arguments.MembApprFlag />
	</cffunction>
	<cffunction name="getMembApprFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MembApprFlag />
	</cffunction>

	<cffunction name="setMembApprDate" access="public" returntype="void" output="false">
		<cfargument name="MembApprDate" type="string" required="true" />
		<cfset variables.instance.MembApprDate = arguments.MembApprDate />
	</cffunction>
	<cffunction name="getMembApprDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MembApprDate />
	</cffunction>

	<cffunction name="setConflictFlag" access="public" returntype="void" output="false">
		<cfargument name="ConflictFlag" type="string" required="true" />
		<cfset variables.instance.ConflictFlag = arguments.ConflictFlag />
	</cffunction>
	<cffunction name="getConflictFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ConflictFlag />
	</cffunction>

	<cffunction name="setConflictDate" access="public" returntype="void" output="false">
		<cfargument name="ConflictDate" type="string" required="true" />
		<cfset variables.instance.ConflictDate = arguments.ConflictDate />
	</cffunction>
	<cffunction name="getConflictDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ConflictDate />
	</cffunction>

	<cffunction name="setEvalFlag" access="public" returntype="void" output="false">
		<cfargument name="EvalFlag" type="string" required="true" />
		<cfset variables.instance.EvalFlag = arguments.EvalFlag />
	</cffunction>
	<cffunction name="getEvalFlag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.EvalFlag />
	</cffunction>

	<cffunction name="setEvalDate" access="public" returntype="void" output="false">
		<cfargument name="EvalDate" type="string" required="true" />
		<cfset variables.instance.EvalDate = arguments.EvalDate />
	</cffunction>
	<cffunction name="getEvalDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.EvalDate />
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
