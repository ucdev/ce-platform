<cfcomponent displayname="Person" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.Person.Person" output="false">
		<cfargument name="PersonID" type="string" required="false" default="" />
		<cfargument name="Prefix" type="string" required="false" default="" />
		<cfargument name="FirstName" type="string" required="false" default="" />
		<cfargument name="MiddleName" type="string" required="false" default="" />
		<cfargument name="LastName" type="string" required="false" default="" />
		<cfargument name="Suffix" type="string" required="false" default="" />
		<cfargument name="CertName" type="string" required="false" default="" />
		<cfargument name="DisplayName" type="string" required="false" default="" />
		<cfargument name="EthnicityID" type="string" required="false" default="" />
		<cfargument name="OMBEthnicityID" type="string" required="false" default="" />
		<cfargument name="Email" type="string" required="false" default="" />
		<cfargument name="Password" type="string" required="false" default="" />
		<cfargument name="PrimaryAddressID" type="string" required="false" default="" />
		<cfargument name="Birthdate" type="string" required="false" default="" />
		<cfargument name="SSN" type="string" required="false" default="" />
		<cfargument name="Gender" type="string" required="false" default="" />
		<cfargument name="StatusID" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		<cfargument name="Deleted" type="string" required="false" default="" />
		<cfargument name="DeletedFlag" type="string" required="false" default="" />
		<cfargument name="DeletedBy" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setPersonID(arguments.PersonID) />
		<cfset setPrefix(arguments.Prefix) />
		<cfset setFirstName(arguments.FirstName) />
		<cfset setMiddleName(arguments.MiddleName) />
		<cfset setLastName(arguments.LastName) />
		<cfset setSuffix(arguments.Suffix) />
		<cfset setCertName(arguments.CertName) />
		<cfset setDisplayName(arguments.DisplayName) />
		<cfset setEthnicityID(arguments.EthnicityID) />
		<cfset setOMBEthnicityID(arguments.OMBEthnicityID) />
		<cfset setEmail(arguments.Email) />
		<cfset setPassword(arguments.Password) />
		<cfset setPrimaryAddressID(arguments.PrimaryAddressID) />
		<cfset setBirthdate(arguments.Birthdate) />
		<cfset setSSN(arguments.SSN) />
		<cfset setGender(arguments.Gender) />
		<cfset setStatusID(arguments.StatusID) />
		<cfset setCreated(arguments.Created) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setUpdatedBy(arguments.UpdatedBy) />
		<cfset setDeleted(arguments.Deleted) />
		<cfset setDeletedFlag(arguments.DeletedFlag) />
		<cfset setDeletedBy(arguments.DeletedBy) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.Person.Person" output="false">
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
		
		<!--- PersonID --->
		<cfif (len(trim(getPersonID())) AND NOT isNumeric(trim(getPersonID())))>
			<cfset thisError.field = "PersonID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PersonID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Prefix --->
		<cfif (len(trim(getPrefix())) AND NOT IsSimpleValue(trim(getPrefix())))>
			<cfset thisError.field = "Prefix" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Prefix is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPrefix())) GT 50)>
			<cfset thisError.field = "Prefix" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Prefix is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- FirstName --->
		<cfif (NOT len(trim(getFirstName())))>
			<cfset thisError.field = "FirstName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "FirstName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFirstName())) AND NOT IsSimpleValue(trim(getFirstName())))>
			<cfset thisError.field = "FirstName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "FirstName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getFirstName())) GT 150)>
			<cfset thisError.field = "FirstName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "FirstName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- MiddleName --->
		<cfif (len(trim(getMiddleName())) AND NOT IsSimpleValue(trim(getMiddleName())))>
			<cfset thisError.field = "MiddleName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "MiddleName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getMiddleName())) GT 150)>
			<cfset thisError.field = "MiddleName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "MiddleName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- LastName --->
		<cfif (NOT len(trim(getLastName())))>
			<cfset thisError.field = "LastName" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "LastName is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLastName())) AND NOT IsSimpleValue(trim(getLastName())))>
			<cfset thisError.field = "LastName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "LastName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getLastName())) GT 150)>
			<cfset thisError.field = "LastName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "LastName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Suffix --->
		<cfif (len(trim(getSuffix())) AND NOT IsSimpleValue(trim(getSuffix())))>
			<cfset thisError.field = "Suffix" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Suffix is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSuffix())) GT 50)>
			<cfset thisError.field = "Suffix" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Suffix is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- CertName --->
		<cfif (len(trim(getCertName())) AND NOT IsSimpleValue(trim(getCertName())))>
			<cfset thisError.field = "CertName" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "CertName is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCertName())) GT 255)>
			<cfset thisError.field = "CertName" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "CertName is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- DisplayName --->
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
		
		<!--- EthnicityID --->
		<cfif (len(trim(getEthnicityID())) AND NOT isNumeric(trim(getEthnicityID())))>
			<cfset thisError.field = "EthnicityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "EthnicityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- OMBEthnicityID --->
		<cfif (len(trim(getOMBEthnicityID())) AND NOT isNumeric(trim(getOMBEthnicityID())))>
			<cfset thisError.field = "OMBEthnicityID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "OMBEthnicityID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Email --->
		<cfif (len(trim(getEmail())) AND NOT IsSimpleValue(trim(getEmail())))>
			<cfset thisError.field = "Email" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Email is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getEmail())) GT 175)>
			<cfset thisError.field = "Email" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Email is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Password --->
		<cfif (len(trim(getPassword())) AND NOT IsSimpleValue(trim(getPassword())))>
			<cfset thisError.field = "Password" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Password is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPassword())) GT 150)>
			<cfset thisError.field = "Password" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Password is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PrimaryAddressID --->
		<cfif (len(trim(getPrimaryAddressID())) AND NOT isNumeric(trim(getPrimaryAddressID())))>
			<cfset thisError.field = "PrimaryAddressID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PrimaryAddressID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Birthdate --->
		<cfif (len(trim(getBirthdate())) AND NOT isDate(trim(getBirthdate())))>
			<cfset thisError.field = "Birthdate" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Birthdate is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- SSN --->
		<cfif (len(trim(getSSN())) AND NOT IsSimpleValue(trim(getSSN())))>
			<cfset thisError.field = "SSN" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "SSN is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getSSN())) GT 5)>
			<cfset thisError.field = "SSN" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "SSN is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Gender --->
		<cfif (len(trim(getGender())) AND NOT IsSimpleValue(trim(getGender())))>
			<cfset thisError.field = "Gender" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Gender is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getGender())) GT 1)>
			<cfset thisError.field = "Gender" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Gender is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- StatusID --->
		<cfif (len(trim(getStatusID())) AND NOT isNumeric(trim(getStatusID())))>
			<cfset thisError.field = "StatusID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "StatusID is not numeric" />
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
		
		<!--- DeletedBy --->
		<cfif (len(trim(getDeletedBy())) AND NOT isNumeric(trim(getDeletedBy())))>
			<cfset thisError.field = "DeletedBy" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "DeletedBy is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setPersonID" access="public" returntype="void" output="false">
		<cfargument name="PersonID" type="string" required="true" />
		<cfset variables.instance.PersonID = arguments.PersonID />
	</cffunction>
	<cffunction name="getPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonID />
	</cffunction>

	<cffunction name="setPrefix" access="public" returntype="void" output="false">
		<cfargument name="Prefix" type="string" required="true" />
		<cfset variables.instance.Prefix = arguments.Prefix />
	</cffunction>
	<cffunction name="getPrefix" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Prefix />
	</cffunction>

	<cffunction name="setFirstName" access="public" returntype="void" output="false">
		<cfargument name="FirstName" type="string" required="true" />
		<cfset variables.instance.FirstName = arguments.FirstName />
	</cffunction>
	<cffunction name="getFirstName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.FirstName />
	</cffunction>

	<cffunction name="setMiddleName" access="public" returntype="void" output="false">
		<cfargument name="MiddleName" type="string" required="true" />
		<cfset variables.instance.MiddleName = arguments.MiddleName />
	</cffunction>
	<cffunction name="getMiddleName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.MiddleName />
	</cffunction>

	<cffunction name="setLastName" access="public" returntype="void" output="false">
		<cfargument name="LastName" type="string" required="true" />
		<cfset variables.instance.LastName = arguments.LastName />
	</cffunction>
	<cffunction name="getLastName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.LastName />
	</cffunction>

	<cffunction name="setSuffix" access="public" returntype="void" output="false">
		<cfargument name="Suffix" type="string" required="true" />
		<cfset variables.instance.Suffix = arguments.Suffix />
	</cffunction>
	<cffunction name="getSuffix" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Suffix />
	</cffunction>

	<cffunction name="setCertName" access="public" returntype="void" output="false">
		<cfargument name="CertName" type="string" required="true" />
		<cfset variables.instance.CertName = arguments.CertName />
	</cffunction>
	<cffunction name="getCertName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.CertName />
	</cffunction>

	<cffunction name="setDisplayName" access="public" returntype="void" output="false">
		<cfargument name="DisplayName" type="string" required="true" />
		<cfset variables.instance.DisplayName = arguments.DisplayName />
	</cffunction>
	<cffunction name="getDisplayName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DisplayName />
	</cffunction>

	<cffunction name="setEthnicityID" access="public" returntype="void" output="false">
		<cfargument name="EthnicityID" type="string" required="true" />
		<cfset variables.instance.EthnicityID = arguments.EthnicityID />
	</cffunction>
	<cffunction name="getEthnicityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.EthnicityID />
	</cffunction>

	<cffunction name="setOMBEthnicityID" access="public" returntype="void" output="false">
		<cfargument name="OMBEthnicityID" type="string" required="true" />
		<cfset variables.instance.OMBEthnicityID = arguments.OMBEthnicityID />
	</cffunction>
	<cffunction name="getOMBEthnicityID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.OMBEthnicityID />
	</cffunction>

	<cffunction name="setEmail" access="public" returntype="void" output="false">
		<cfargument name="Email" type="string" required="true" />
		<cfset variables.instance.Email = arguments.Email />
	</cffunction>
	<cffunction name="getEmail" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Email />
	</cffunction>

	<cffunction name="setPassword" access="public" returntype="void" output="false">
		<cfargument name="Password" type="string" required="true" />
		<cfset variables.instance.Password = arguments.Password />
	</cffunction>
	<cffunction name="getPassword" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Password />
	</cffunction>

	<cffunction name="setPrimaryAddressID" access="public" returntype="void" output="false">
		<cfargument name="PrimaryAddressID" type="string" required="true" />
		<cfset variables.instance.PrimaryAddressID = arguments.PrimaryAddressID />
	</cffunction>
	<cffunction name="getPrimaryAddressID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PrimaryAddressID />
	</cffunction>

	<cffunction name="setBirthdate" access="public" returntype="void" output="false">
		<cfargument name="Birthdate" type="string" required="true" />
		<cfset variables.instance.Birthdate = arguments.Birthdate />
	</cffunction>
	<cffunction name="getBirthdate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Birthdate />
	</cffunction>

	<cffunction name="setSSN" access="public" returntype="void" output="false">
		<cfargument name="SSN" type="string" required="true" />
		<cfset variables.instance.SSN = arguments.SSN />
	</cffunction>
	<cffunction name="getSSN" access="public" returntype="string" output="false">
		<cfreturn variables.instance.SSN />
	</cffunction>

	<cffunction name="setGender" access="public" returntype="void" output="false">
		<cfargument name="Gender" type="string" required="true" />
		<cfset variables.instance.Gender = arguments.Gender />
	</cffunction>
	<cffunction name="getGender" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Gender />
	</cffunction>

	<cffunction name="setStatusID" access="public" returntype="void" output="false">
		<cfargument name="StatusID" type="string" required="true" />
		<cfset variables.instance.StatusID = arguments.StatusID />
	</cffunction>
	<cffunction name="getStatusID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.StatusID />
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

	<cffunction name="setDeletedBy" access="public" returntype="void" output="false">
		<cfargument name="DeletedBy" type="string" required="true" />
		<cfset variables.instance.DeletedBy = arguments.DeletedBy />
	</cffunction>
	<cffunction name="getDeletedBy" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DeletedBy />
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