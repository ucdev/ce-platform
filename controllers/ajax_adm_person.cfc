<cfcomponent extends="controller">
	<cffunction name="createPerson"  output="false" returntype="string">
		<cfparam name="params.PersonID" type="numeric" required="yes">
        <cfparam name="params.Birthdate" type="string" required="no">
        <cfparam name="params.FirstName" type="string" required="yes">
        <cfparam name="params.MiddleName" type="string" required="no" default="">
        <cfparam name="params.LastName" type="string" required="yes">
        <cfparam name="params.CertName" type="string" required="no" default="#Arguments.FirstName# #Arguments.LastName#">
        <cfparam name="params.CertNameCustom" type="string" required="no" default="">
        <cfparam name="params.DisplayName" type="string" required="no" default="#Arguments.FirstName# #Arguments.LastName#">
        <cfparam name="params.Suffix" type="string" required="no" default="">
        <cfparam name="params.Email" type="string" required="yes">
        <cfparam name="params.Gender" type="string" required="no" default="">
        <cfparam name="params.SSN" type="string" required="yes">
        <cfparam name="params.Password" type="string" required="yes">
        <cfparam name="params.DegreeID" type="numeric" required="yes">
        <cfparam name="params.SkipDuplicates" type="string" required="no" default="N">
        <cfparam name="params.ChangedFields" type="string" required="no" default="">
        <cfparam name="params.ChangedValues" type="string" required="no" default="">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access create function for person information.")>
        
        <cfset Status = Application.Person.savePerson(
							PersonID=Arguments.PersonID,
							Birthdate=Arguments.Birthdate,
							FirstName=Arguments.FirstName,
							MiddleName=Arguments.MiddleName,
							LastName=Arguments.LastName,
							CertName=Arguments.CertName,
							CertNameCustom=Arguments.CertNameCustom,
							DisplayName=Arguments.DisplayName,
							Suffix=Arguments.Suffix,
							Email=Arguments.Email,
							Gender=Arguments.Gender,
							SSN=Arguments.SSN,
							Password=Arguments.Password,
							SkipDuplicates=Arguments.SkipDuplicates,
							ChangedFields=Arguments.ChangedFields,
							ChangedValues=Arguments.ChangedValues)>
                            
		<cfif status.getStatus()>
			<cfset Application.Person.saveDegree(status.getStatusMsg(),Arguments.DegreeID)>
        </cfif>
        
        <cfreturn Status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteAddress"  output="false" returnFormat="plain">
    	<cfparam name="params.AddressID" type="numeric" required="yes">
        <cfparam name="params.PersonID" type="numeric" required="yes">
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete address for unknown reasons.")>
        
        <cfset status = Application.Person.deleteAddress(Arguments.AddressID,Arguments.PersonID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteEmail"  output="false" returnFormat="plain">
    	<cfparam name="params.email_id" type="numeric" required="yes">
        <cfparam name="params.person_id" type="numeric" required="yes">
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete email address for unknown reasons.")>
        
        <cfset status = Application.Person.deleteEmail(Arguments.email_id,Arguments.person_id)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deleteNote"  output="true" returnFormat="plain">
		<cfparam name="params.NoteID" type="numeric">
    	
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access delete function for notes.")>
        
        <cfset status = Application.Person.deleteNote(Arguments.NoteID)>
    
    	<cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="deletePerson"  output="true" returntype="string">
		<cfparam name="params.PersonID" type="numeric">
        <cfparam name="params.Reason" type="string">
    	
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>

		<cfcontent type="text/javascript" />

        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access delete function for people.")>
        
        <cfset status = Application.Person.deletePerson(Arguments.PersonID,Arguments.Reason)>
    
    	<cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="getNameByID"  output="no" returntype="string">
		<cfparam name="params.PersonID" type="numeric" required="yes">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset var fullName = "">
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access person name by ID functionality.")>
        
        <cfset fullName = Application.Person.getNameByID1(Arguments.PersonID)>
        
        <cfif isArray(fullName)>
	        <cfset status.setData(fullName)>
        	<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Person Name retrieved.")>
        </cfif>
        
        <cfreturn Status.getJSON() />
    </cffunction>
    
    <cffunction name="getPersonSpecialties"  output="no" returntype="string">
    	<cfparam name="params.personId" type="numeric" required="yes">
        
    	<cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("There are no specialties selected for this person.")>
        
        <cfset aPersonSpecialties = Application.Person.getPersonSpecialties(arguments.PersonID)>
        
        <cfif arrayLen(aPersonSpecialties) GT 0>
        	<cfset status.setData(aPersonSpecialties)>
        </cfif>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="moveActivities"  output="no" returntype="string">
    	<cfparam name="params.MoveFromPersonID" type="numeric" />
    	<cfparam name="params.MoveFromName" type="string" />
        <cfparam name="params.MoveToPersonID" type="numeric" />
    	<cfparam name="params.MoveToName" type="string" />
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the activity move functionality.")>
        
        <cfset Status = Application.Person.moveActivities(Arguments.MoveFromPersonID,Arguments.MoveFromName,Arguments.MoveToPersonID,Arguments.MoveToName)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="requestPassword"  returntype="string">
    	<cfparam name="params.Email" type="string" required="yes">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the activity move functionality.")>
        
        <cfset status = Application.Person.requestPassword(Arguments.Email)>
        
        <cfreturn status.getJSON() />
    </cffunction>
        
	<cffunction name="saveAddress"  output="false" returnFormat="plain">
		<cfparam name="params.AddressID" type="numeric" required="yes">
        <cfparam name="params.PersonID" type="numeric" required="yes">
        <cfparam name="params.AddressTypeID" type="numeric" required="yes">
        <cfparam name="params.PrimaryFlag" type="string" required="yes">
        <cfparam name="params.Address1" type="string" required="yes">
        <cfparam name="params.Address2" type="string" required="yes">
        <cfparam name="params.City" type="string" required="yes">
        <cfparam name="params.State" type="string" required="yes">
        <cfparam name="params.Province" type="string" required="yes">
        <cfparam name="params.Country" type="string" required="yes">
        <cfparam name="params.Zipcode" type="string" required="yes">
        <cfparam name="params.Phone1" type="string" required="yes">
        <cfparam name="params.Phone1ext" type="string" required="yes">
        <cfparam name="params.Phone2" type="string" required="yes">
        <cfparam name="params.Phone2ext" type="string" required="yes">
        <cfparam name="params.Phone3" type="string" required="yes">
        <cfparam name="params.Phone3ext" type="string" required="yes">
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for address information.")>
        
        <cfset status = Application.Person.saveAddress(
							addressId = Arguments.AddressID,
							personId = arguments.PersonID,
							AddressTypeID = Arguments.AddressTypeID,
							PrimaryFlag = Arguments.PrimaryFlag,
							Address1 = Arguments.Address1,
							Address2 = Arguments.Address2,
							city = Arguments.City,
							state = Arguments.State,
							province = Arguments.Province,
							country = Arguments.Country,
                            zipcode = Arguments.Zipcode,
							phone1 = Arguments.Phone1,
							phone1ext = Arguments.Phone1ext,
							phone2 = Arguments.Phone2,
							phone2ext = Arguments.Phone2ext,
							phone3 = Arguments.Phone3,
							phone3ext = Arguments.Phone3ext)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="saveCredentials" hint=""  output="false" returnFormat="plain">
    	<cfparam name="params.PersonID" type="numeric" required="yes">
        <cfparam name="params.Pass" type="string" required="yes">
        <cfparam name="params.ConPass" type="string" required="yes">
        
        <cfset var Status = createObject("component", "#Application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for credentials.")>
        
        <cfset Status = Application.Person.saveCredentials(PersonId=Arguments.PersonID,Pass=Arguments.Pass,ConPass=Arguments.ConPass)>
	
    	<cfreturn Status.getJSON() />
    </cffunction>
    
    <cffunction name="saveDegree" hint="New Person Degree Info - saves using new degree information."  output="false" returntype="string">
    	<cfparam name="params.PersonID" type="numeric" required="yes">
        <cfparam name="params.DegreeID" type="numeric" required="yes">
        
        <cfset var Status = createObject("component", "#Application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for education information.")>
        
        <cfset status = Application.Person.saveDegree(Arguments.PersonID,Arguments.DegreeID)>
	
    	<cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="saveEmail"  output="false" returntype="string">
    	<cfparam name="params.email_id" type="numeric" required="yes">
    	<cfparam name="params.person_id" type="numeric" required="yes">
    	<cfparam name="params.allow_login" type="numeric" required="yes">
    	<cfparam name="params.email_address" type="string" required="yes">
    	<cfparam name="params.is_primary" type="numeric" required="yes">
    	<cfparam name="params.is_verified" type="numeric" required="yes">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <!---<cfcontent type="text/javascript">--->
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for email addresses.")>
        
        <cfset status = application.person.saveEmail(
													arguments.email_id,
													arguments.person_id,
													arguments.allow_login,
													arguments.email_address,
													arguments.is_primary,
													arguments.is_verified)>
        
        <cfreturn status.getJSON() />
    </cffunction>

	<cffunction name="saveNote"  output="no" returnFormat="plain">
		<cfparam name="params.PersonID" type="numeric">
		<cfparam name="params.NoteBody" type="string">
		<cfparam name="params.NoteID" type="numeric" required="false" default="0">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript">
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for notes.")>
        
        <cfset status = Application.Person.saveNote(Arguments.PersonID,Arguments.NoteBody,Arguments.NoteID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="savePerson"  output="false" returnformat="plain">
		<cfparam name="params.PersonID" type="numeric" required="yes">
        <cfparam name="params.Birthdate" type="string" required="no">
        <cfparam name="params.FirstName" type="string" required="yes">
        <cfparam name="params.MiddleName" type="string" required="no" default="">
        <cfparam name="params.LastName" type="string" required="yes">
        <cfparam name="params.CertName" type="string" required="no" default="#Arguments.FirstName# #Arguments.LastName#">
        <cfparam name="params.CertNameCustom" type="string" required="no" default="">
        <cfparam name="params.DisplayName" type="string" required="no" default="#Arguments.FirstName# #Arguments.LastName#">
        <cfparam name="params.Suffix" type="string" required="no" default="">
        <cfparam name="params.Email" type="string" required="yes">
        <cfparam name="params.Gender" type="string" required="no" default="">
        <cfparam name="params.SSN" type="string" required="yes">
        <cfparam name="params.Password" type="string" required="yes">
        <cfparam name="params.SkipDuplicates" type="string" required="no" default="N">
        <cfparam name="params.ChangedFields" type="string" required="no" default="">
        <cfparam name="params.ChangedValues" type="string" required="no" default="">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript">
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for person information.")>
        
        <cfset Status = Application.Person.savePerson(
							PersonID=Arguments.PersonID,
							Birthdate=Arguments.Birthdate,
							FirstName=Arguments.FirstName,
							MiddleName=Arguments.MiddleName,
							LastName=Arguments.LastName,
							CertName=Arguments.CertName,
							CertNameCustom=Arguments.CertNameCustom,
							DisplayName=Arguments.DisplayName,
							Suffix=Arguments.Suffix,
							Email=Arguments.Email,
							Gender=Arguments.Gender,
							SSN=Arguments.SSN,
							Password=Arguments.Password,
							SkinDuplicates=Arguments.SkipDuplicates,
							ChangedFields=Arguments.ChangedFields,
							ChangedValues=Arguments.ChangedValues)>
        
        <cfreturn Status.getJSON() />
    </cffunction>
    
    <cffunction name="savePersonSpecialties"  output="false" description="Saves specialties for provided person." returnFormat="plain">
    	<cfparam name="params.PersonID" type="numeric" required="yes">
        <cfparam name="params.Specialties" type="string" required="yes">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for person specialties.")>
        
        <cfset Status = Application.Person.saveSpecialties(Arguments.PersonID,Arguments.Specialties)>
        
        <cfreturn Status.getJSON() />
    </cffunction>
    
    <cffunction name="sendVerificationEmail" hint="Sends an email to verify email address."  output="false" returntype="string">
    	<cfparam name="params.email_id" type="numeric" required="yes">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access send verification email function.")>
        
        <cfset Status = Application.Person.sendVerificationEmail(Arguments.email_id)>
        
        <cfreturn status.getJSON() />
    </cffunction>
	
    <cffunction name="setAuthLevel"  output="false" description="Set Authority Level" returntype="string">
    	<cfparam name="params.AccountID" type="numeric" required="yes" />
        <cfparam name="params.AuthorityID" type="numeric" required="yes" />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("You do not have permission to administer this feature.")>
        
        <cfset status = Application.Person.setAuthLevel(Arguments.AccountID,Arguments.AuthorityID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
	
    <cffunction name="setPrimaryEmail"  output="false" description="Set Authority Level" returntype="string">
    	<cfparam name="params.email_id" type="numeric" required="yes" />
    	<cfparam name="params.person_id" type="numeric" required="yes" />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the primary email update functionality.")>
        
        <cfset status = Application.Person.setPrimaryEmail(email_id=Arguments.email_id,person_id=arguments.person_id)>
        
        <cfreturn status.getJSON() />
    </cffunction>
	
	<cffunction name="setStatus"  output="no" displayname="Set Activity Status" returntype="string">
		<cfparam name="params.PersonID" type="numeric" required="yes" />
		<cfparam name="params.StatusID" type="numeric" required="yes" />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("You do not have permission to administer this feature.")>
        
        <cfset status = Application.Person.setStatus(Arguments.PersonID,Arguments.StatusID)>
        
        <cfreturn status.getJSON() />
    </cffunction>
</cfcomponent>