
<cfcomponent displayname="Support" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.ActivityFinance.Support" output="false">
		<cfargument name="SupportID" type="string" required="false" default="" />
		<cfargument name="ActivityID" type="string" required="false" default="" />
		<cfargument name="SupporterID" type="string" required="false" default="" />
		<cfargument name="SupportTypeID" type="string" required="false" default="" />
		<cfargument name="Amount" type="string" required="false" default="" />
		<cfargument name="ContractNum" type="string" required="false" default="" />
		<cfargument name="BudgetRequested" type="string" required="false" default="" />
		<cfargument name="BudgetDueDate" type="string" required="false" default="" />
		<cfargument name="BudgetSentDate" type="string" required="false" default="" />
		<cfargument name="SentDate" type="string" required="false" default="" />
		<cfargument name="FundsReturned" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setSupportID(arguments.SupportID) />
		<cfset setActivityID(arguments.ActivityID) />
		<cfset setSupporterID(arguments.SupporterID) />
		<cfset setSupportTypeID(arguments.SupportTypeID) />
		<cfset setAmount(arguments.Amount) />
		<cfset setContractNum(arguments.ContractNum) />
		<cfset setBudgetRequested(arguments.BudgetRequested) />
		<cfset setBudgetDueDate(arguments.BudgetDueDate) />
		<cfset setBudgetSentDate(arguments.BudgetSentDate) />
		<cfset setSentDate(arguments.SentDate) />
		<cfset setFundsReturned(arguments.FundsReturned) />
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
	<cffunction name="setMemento" access="public" returntype="_com.ActivityFinance.Support" output="false">
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
		
		<!--- SupportID --->
		<cfif (len(trim(getSupportID())) AND NOT isNumeric(trim(getSupportID())))>
			<cfset thisError.field = "SupportID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SupportID is not numeric" />
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
		
		<!--- SupporterID --->
		<cfif (NOT len(trim(getSupporterID())))>
			<cfset thisError.field = "SupporterID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "SupporterID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSupporterID())) AND NOT isNumeric(trim(getSupporterID())))>
			<cfset thisError.field = "SupporterID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SupporterID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SupportTypeID --->
		<cfif (NOT len(trim(getSupportTypeID())))>
			<cfset thisError.field = "SupportTypeID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "SupportTypeID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSupportTypeID())) AND NOT isNumeric(trim(getSupportTypeID())))>
			<cfset thisError.field = "SupportTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SupportTypeID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Amount --->
		<cfif (len(trim(getAmount())) AND NOT isNumeric(trim(getAmount())))>
			<cfset thisError.field = "Amount" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Amount is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ContractNum --->
		<cfif (len(trim(getContractNum())) AND NOT IsSimpleValue(trim(getContractNum())))>
			<cfset thisError.field = "ContractNum" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ContractNum is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getContractNum())) GT 50)>
			<cfset thisError.field = "ContractNum" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ContractNum is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- BudgetRequested --->
		<cfif (len(trim(getBudgetRequested())) AND NOT IsSimpleValue(trim(getBudgetRequested())))>
			<cfset thisError.field = "BudgetRequested" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "BudgetRequested is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getBudgetRequested())) GT 1)>
			<cfset thisError.field = "BudgetRequested" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "BudgetRequested is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- BudgetDueDate --->
		<cfif (len(trim(getBudgetDueDate())) AND NOT isDate(trim(getBudgetDueDate())))>
			<cfset thisError.field = "BudgetDueDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "BudgetDueDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- BudgetSentDate --->
		<cfif (len(trim(getBudgetSentDate())) AND NOT isDate(trim(getBudgetSentDate())))>
			<cfset thisError.field = "BudgetSentDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "BudgetSentDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SentDate --->
		<cfif (len(trim(getSentDate())) AND NOT isDate(trim(getSentDate())))>
			<cfset thisError.field = "SentDate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SentDate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FundsReturned --->
		<cfif (len(trim(getFundsReturned())) AND NOT isNumeric(trim(getFundsReturned())))>
			<cfset thisError.field = "FundsReturned" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FundsReturned is not numeric" />
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
	<cffunction name="setSupportID" access="public" returntype="void" output="false">
		<cfargument name="SupportID" type="string" required="true" />
		<cfset variables.instance.SupportID = arguments.SupportID />
	</cffunction>
	<cffunction name="getSupportID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SupportID />
	</cffunction>

	<cffunction name="setActivityID" access="public" returntype="void" output="false">
		<cfargument name="ActivityID" type="string" required="true" />
		<cfset variables.instance.ActivityID = arguments.ActivityID />
	</cffunction>
	<cffunction name="getActivityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ActivityID />
	</cffunction>

	<cffunction name="setSupporterID" access="public" returntype="void" output="false">
		<cfargument name="SupporterID" type="string" required="true" />
		<cfset variables.instance.SupporterID = arguments.SupporterID />
	</cffunction>
	<cffunction name="getSupporterID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SupporterID />
	</cffunction>

	<cffunction name="setSupportTypeID" access="public" returntype="void" output="false">
		<cfargument name="SupportTypeID" type="string" required="true" />
		<cfset variables.instance.SupportTypeID = arguments.SupportTypeID />
	</cffunction>
	<cffunction name="getSupportTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SupportTypeID />
	</cffunction>

	<cffunction name="setAmount" access="public" returntype="void" output="false">
		<cfargument name="Amount" type="string" required="true" />
		<cfset variables.instance.Amount = arguments.Amount />
	</cffunction>
	<cffunction name="getAmount" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Amount />
	</cffunction>

	<cffunction name="setContractNum" access="public" returntype="void" output="false">
		<cfargument name="ContractNum" type="string" required="true" />
		<cfset variables.instance.ContractNum = arguments.ContractNum />
	</cffunction>
	<cffunction name="getContractNum" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ContractNum />
	</cffunction>

	<cffunction name="setBudgetRequested" access="public" returntype="void" output="false">
		<cfargument name="BudgetRequested" type="string" required="true" />
		<cfset variables.instance.BudgetRequested = arguments.BudgetRequested />
	</cffunction>
	<cffunction name="getBudgetRequested" access="public" returntype="string" output="false">
		<cfreturn variables.instance.BudgetRequested />
	</cffunction>

	<cffunction name="setBudgetDueDate" access="public" returntype="void" output="false">
		<cfargument name="BudgetDueDate" type="string" required="true" />
		<cfset variables.instance.BudgetDueDate = arguments.BudgetDueDate />
	</cffunction>
	<cffunction name="getBudgetDueDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.BudgetDueDate />
	</cffunction>

	<cffunction name="setBudgetSentDate" access="public" returntype="void" output="false">
		<cfargument name="BudgetSentDate" type="string" required="true" />
		<cfset variables.instance.BudgetSentDate = arguments.BudgetSentDate />
	</cffunction>
	<cffunction name="getBudgetSentDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.BudgetSentDate />
	</cffunction>

	<cffunction name="setSentDate" access="public" returntype="void" output="false">
		<cfargument name="SentDate" type="string" required="true" />
		<cfset variables.instance.SentDate = arguments.SentDate />
	</cffunction>
	<cffunction name="getSentDate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SentDate />
	</cffunction>

	<cffunction name="setFundsReturned" access="public" returntype="void" output="false">
		<cfargument name="FundsReturned" type="string" required="true" />
		<cfset variables.instance.FundsReturned = arguments.FundsReturned />
	</cffunction>
	<cffunction name="getFundsReturned" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FundsReturned />
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
