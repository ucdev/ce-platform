
<cfcomponent displayname="PersonAddress" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="_com.PersonAddress.PersonAddress" output="false">
		<cfargument name="AddressID" type="string" required="false" default="" />
		<cfargument name="PersonID" type="string" required="false" default="" />
		<cfargument name="AddressTypeID" type="string" required="false" default="" />
		<cfargument name="Address1" type="string" required="false" default="" />
		<cfargument name="Address2" type="string" required="false" default="" />
		<cfargument name="City" type="string" required="false" default="" />
		<cfargument name="State" type="string" required="false" default="" />
		<cfargument name="Province" type="string" required="false" default="" />
		<cfargument name="Country" type="string" required="false" default="" />
		<cfargument name="ZipCode" type="string" required="false" default="" />
		<cfargument name="GeonameId" type="string" required="false" default="" />
		<cfargument name="Phone1" type="string" required="false" default="" />
		<cfargument name="Phone1ext" type="string" required="false" default="" />
		<cfargument name="Phone2" type="string" required="false" default="" />
		<cfargument name="Phone2ext" type="string" required="false" default="" />
		<cfargument name="Phone3" type="string" required="false" default="" />
		<cfargument name="Phone3ext" type="string" required="false" default="" />
		<cfargument name="Created" type="string" required="false" default="" />
		<cfargument name="CreatedBy" type="string" required="false" default="" />
		<cfargument name="Updated" type="string" required="false" default="" />
		<cfargument name="UpdatedBy" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setAddressID(arguments.AddressID) />
		<cfset setPersonID(arguments.PersonID) />
		<cfset setAddressTypeID(arguments.AddressTypeID) />
		<cfset setAddress1(arguments.Address1) />
		<cfset setAddress2(arguments.Address2) />
		<cfset setCity(arguments.City) />
		<cfset setGeonameid(arguments.geonameid) />
		<cfset setState(arguments.State) />
		<cfset setProvince(arguments.Province) />
		<cfset setCountry(arguments.Country) />
		<cfset setZipCode(arguments.ZipCode) />
		<cfset setPhone1(arguments.Phone1) />
		<cfset setPhone1ext(arguments.Phone1ext) />
		<cfset setPhone2(arguments.Phone2) />
		<cfset setPhone2ext(arguments.Phone2ext) />
		<cfset setPhone3(arguments.Phone3) />
		<cfset setPhone3ext(arguments.Phone3ext) />
		<cfset setCreated(arguments.Created) />
		<cfset setCreatedBy(arguments.CreatedBy) />
		<cfset setUpdated(arguments.Updated) />
		<cfset setUpdatedBy(arguments.UpdatedBy) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="_com.PersonAddress.PersonAddress" output="false">
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
		
		<!--- AddressID --->
		<cfif (len(trim(getAddressID())) AND NOT isNumeric(trim(getAddressID())))>
			<cfset thisError.field = "AddressID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AddressID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- PersonID --->
		<cfif (NOT len(trim(getPersonID())))>
			<cfset thisError.field = "PersonID" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "PersonID is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPersonID())) AND NOT isNumeric(trim(getPersonID())))>
			<cfset thisError.field = "PersonID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "PersonID is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- AddressTypeID --->
		<cfif (len(trim(getAddressTypeID())) AND NOT isNumeric(trim(getAddressTypeID())))>
			<cfset thisError.field = "AddressTypeID" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "AddressTypeID is not numeric" />
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
		<cfif (len(trim(getCity())) GT 150)>
			<cfset thisError.field = "City" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "City is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- State --->
		<cfif (len(trim(getState())) AND NOT IsSimpleValue(trim(getState())))>
			<cfset thisError.field = "State" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "State is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getState())) GT 2)>
			<cfset thisError.field = "State" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "State is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Province --->
		<cfif (len(trim(getProvince())) AND NOT IsSimpleValue(trim(getProvince())))>
			<cfset thisError.field = "Province" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Province is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getProvince())) GT 500)>
			<cfset thisError.field = "Province" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Province is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Country --->
		<cfif (len(trim(getCountry())) AND NOT IsSimpleValue(trim(getCountry())))>
			<cfset thisError.field = "Country" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Country is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getCountry())) GT 500)>
			<cfset thisError.field = "Country" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Country is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- ZipCode --->
		<cfif (len(trim(getZipCode())) AND NOT IsSimpleValue(trim(getZipCode())))>
			<cfset thisError.field = "ZipCode" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "ZipCode is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getZipCode())) GT 15)>
			<cfset thisError.field = "ZipCode" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "ZipCode is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Phone1 --->
		<cfif (len(trim(getPhone1())) AND NOT IsSimpleValue(trim(getPhone1())))>
			<cfset thisError.field = "Phone1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Phone1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPhone1())) GT 25)>
			<cfset thisError.field = "Phone1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Phone1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Phone1ext --->
		
		<!--- Phone2 --->
		<cfif (len(trim(getPhone2())) AND NOT IsSimpleValue(trim(getPhone2())))>
			<cfset thisError.field = "Phone2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Phone2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPhone2())) GT 25)>
			<cfset thisError.field = "Phone2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Phone2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Phone2ext --->
		
		<!--- Phone3 --->
		<cfif (len(trim(getPhone3())) AND NOT IsSimpleValue(trim(getPhone3())))>
			<cfset thisError.field = "Phone3" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "Phone3 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getPhone3())) GT 25)>
			<cfset thisError.field = "Phone3" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "Phone3 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- Phone3ext --->
		
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
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setGeonameId" access="public" returntype="void" output="false">
		<cfargument name="GeonameId" type="string" required="true" />
		<cfset variables.instance.GeonameId = arguments.GeonameId />
	</cffunction>
	<cffunction name="getGeonameId" access="public" returntype="string" output="false">
		<cfreturn variables.instance.GeonameId />
	</cffunction>
	
	<cffunction name="setAddressID" access="public" returntype="void" output="false">
		<cfargument name="AddressID" type="string" required="true" />
		<cfset variables.instance.AddressID = arguments.AddressID />
	</cffunction>
	<cffunction name="getAddressID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AddressID />
	</cffunction>

	<cffunction name="setPersonID" access="public" returntype="void" output="false">
		<cfargument name="PersonID" type="string" required="true" />
		<cfset variables.instance.PersonID = arguments.PersonID />
	</cffunction>
	<cffunction name="getPersonID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PersonID />
	</cffunction>

	<cffunction name="setAddressTypeID" access="public" returntype="void" output="false">
		<cfargument name="AddressTypeID" type="string" required="true" />
		<cfset variables.instance.AddressTypeID = arguments.AddressTypeID />
	</cffunction>
	<cffunction name="getAddressTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.AddressTypeID />
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

	<cffunction name="setProvince" access="public" returntype="void" output="false">
		<cfargument name="Province" type="string" required="true" />
		<cfset variables.instance.Province = arguments.Province />
	</cffunction>
	<cffunction name="getProvince" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Province />
	</cffunction>

	<cffunction name="setCountry" access="public" returntype="void" output="false">
		<cfargument name="Country" type="string" required="true" />
		<cfset variables.instance.Country = arguments.Country />
	</cffunction>
	<cffunction name="getCountry" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Country />
	</cffunction>

	<cffunction name="setZipCode" access="public" returntype="void" output="false">
		<cfargument name="ZipCode" type="string" required="true" />
		<cfset variables.instance.ZipCode = arguments.ZipCode />
	</cffunction>
	<cffunction name="getZipCode" access="public" returntype="string" output="false">
		<cfreturn variables.instance.ZipCode />
	</cffunction>

	<cffunction name="setPhone1" access="public" returntype="void" output="false">
		<cfargument name="Phone1" type="string" required="true" />
		<cfset variables.instance.Phone1 = arguments.Phone1 />
	</cffunction>
	<cffunction name="getPhone1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Phone1 />
	</cffunction>

	<cffunction name="setPhone1ext" access="public" returntype="void" output="false">
		<cfargument name="Phone1ext" type="string" required="true" />
		<cfset variables.instance.Phone1ext = arguments.Phone1ext />
	</cffunction>
	<cffunction name="getPhone1ext" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Phone1ext />
	</cffunction>

	<cffunction name="setPhone2" access="public" returntype="void" output="false">
		<cfargument name="Phone2" type="string" required="true" />
		<cfset variables.instance.Phone2 = arguments.Phone2 />
	</cffunction>
	<cffunction name="getPhone2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Phone2 />
	</cffunction>

	<cffunction name="setPhone2ext" access="public" returntype="void" output="false">
		<cfargument name="Phone2ext" type="string" required="true" />
		<cfset variables.instance.Phone2ext = arguments.Phone2ext />
	</cffunction>
	<cffunction name="getPhone2ext" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Phone2ext />
	</cffunction>

	<cffunction name="setPhone3" access="public" returntype="void" output="false">
		<cfargument name="Phone3" type="string" required="true" />
		<cfset variables.instance.Phone3 = arguments.Phone3 />
	</cffunction>
	<cffunction name="getPhone3" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Phone3 />
	</cffunction>

	<cffunction name="setPhone3ext" access="public" returntype="void" output="false">
		<cfargument name="Phone3ext" type="string" required="true" />
		<cfset variables.instance.Phone3ext = arguments.Phone3ext />
	</cffunction>
	<cffunction name="getPhone3ext" access="public" returntype="string" output="false">
		<cfreturn variables.instance.Phone3ext />
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
