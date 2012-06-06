<cfcomponent extends="controller">
	<cffunction name="createPerson"  output="false">
		<cfparam name="params.PersonID" type="numeric" >
        <cfparam name="params.Birthdate" type="string" >
        <cfparam name="params.FirstName" type="string" >
        <cfparam name="params.MiddleName" type="string"  default="">
        <cfparam name="params.LastName" type="string" >
        <cfparam name="params.CertName" type="string"  default="#params.FirstName# #params.LastName#">
        <cfparam name="params.CertNameCustom" type="string"  default="">
        <cfparam name="params.DisplayName" type="string"  default="#params.FirstName# #params.LastName#">
        <cfparam name="params.Suffix" type="string"  default="">
        <cfparam name="params.Email" type="string" >
        <cfparam name="params.Gender" type="string"  default="">
        <cfparam name="params.SSN" type="string" >
        <cfparam name="params.Password" type="string" >
        <cfparam name="params.DegreeID" type="numeric" >
        <cfparam name="params.SkipDuplicates" type="string"  default="N">
        <cfparam name="params.ChangedFields" type="string"  default="">
        <cfparam name="params.ChangedValues" type="string"  default="">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access create function for person information.")>
        
        <cfset Status = Application.Person.savePerson(
							PersonID=params.PersonID,
							Birthdate=params.Birthdate,
							FirstName=params.FirstName,
							MiddleName=params.MiddleName,
							LastName=params.LastName,
							CertName=params.CertName,
							CertNameCustom=params.CertNameCustom,
							DisplayName=params.DisplayName,
							Suffix=params.Suffix,
							Email=params.Email,
							Gender=params.Gender,
							SSN=params.SSN,
							Password=params.Password,
							SkipDuplicates=params.SkipDuplicates,
							ChangedFields=params.ChangedFields,
							ChangedValues=params.ChangedValues)>
                            
		<cfif status.getStatus()>
			<cfset Application.Person.saveDegree(status.getStatusMsg(),params.DegreeID)>
        </cfif>
        
        <cfset renderText(Status.getJSON()) />
    </cffunction>
    
	<cffunction name="deleteAddress"  output="false" returnFormat="plain">
    	<cfparam name="params.AddressID" type="numeric" >
        <cfparam name="params.PersonID" type="numeric" >
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete address for unknown reasons.")>
        
        <cfset status = Application.Person.deleteAddress(params.AddressID,params.PersonID)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="deleteEmail"  output="false" returnFormat="plain">
    	<cfparam name="params.email_id" type="numeric" >
        <cfparam name="params.person_id" type="numeric" >
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete email address for unknown reasons.")>
        
        <cfset status = Application.Person.deleteEmail(params.email_id,params.person_id)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="deleteNote"  output="true" returnFormat="plain">
		<cfparam name="params.NoteID" type="numeric">
    	
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access delete function for notes.")>
        
        <cfset status = Application.Person.deleteNote(params.NoteID)>
    
    	<cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="deletePerson"  output="true">
		<cfparam name="params.PersonID" type="numeric">
        <cfparam name="params.Reason" type="string">
    	
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>

		<cfcontent type="text/javascript" />

        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access delete function for people.")>
        
        <cfset status = Application.Person.deletePerson(params.PersonID,params.Reason)>
    
    	<cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="getNameByID"  output="no">
		<cfparam name="params.PersonID" type="numeric" >
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset var fullName = "">
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access person name by ID functionality.")>
        
        <cfset fullName = Application.Person.getNameByID1(params.PersonID)>
        
        <cfif isArray(fullName)>
	        <cfset status.setData(fullName)>
        	<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Person Name retrieved.")>
        </cfif>
        
        <cfset renderText(Status.getJSON()) />
    </cffunction>
    
    <cffunction name="getPersonSpecialties"  output="no">
    	<cfparam name="params.personId" type="numeric" >
        
    	<cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("There are no specialties selected for this person.")>
        
        <cfset aPersonSpecialties = Application.Person.getPersonSpecialties(params.PersonID)>
        
        <cfif arrayLen(aPersonSpecialties) GT 0>
        	<cfset status.setData(aPersonSpecialties)>
        </cfif>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
    <cffunction name="moveActivities"  output="no">
    	<cfparam name="params.MoveFromPersonID" type="numeric" />
    	<cfparam name="params.MoveFromName" type="string" />
        <cfparam name="params.MoveToPersonID" type="numeric" />
    	<cfparam name="params.MoveToName" type="string" />
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the activity move functionality.")>
        
        <cfset Status = Application.Person.moveActivities(params.MoveFromPersonID,params.MoveFromName,params.MoveToPersonID,params.MoveToName)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="requestPassword" >
    	<cfparam name="params.Email" type="string" >
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the activity move functionality.")>
        
        <cfset status = Application.Person.requestPassword(params.Email)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
        
	<cffunction name="saveAddress"  output="false" returnFormat="plain">
		<cfparam name="params.AddressID" type="numeric" >
        <cfparam name="params.PersonID" type="numeric" >
        <cfparam name="params.AddressTypeID" type="numeric" >
        <cfparam name="params.PrimaryFlag" type="string" >
        <cfparam name="params.Address1" type="string" >
        <cfparam name="params.Address2" type="string" >
        <cfparam name="params.City" type="string" >
        <cfparam name="params.State" type="string" >
        <cfparam name="params.Province" type="string" >
        <cfparam name="params.Country" type="string" >
        <cfparam name="params.Zipcode" type="string" >
        <cfparam name="params.Phone1" type="string" >
        <cfparam name="params.Phone1ext" type="string" >
        <cfparam name="params.Phone2" type="string" >
        <cfparam name="params.Phone2ext" type="string" >
        <cfparam name="params.Phone3" type="string" >
        <cfparam name="params.Phone3ext" type="string" >
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for address information.")>
        
        <cfset status = Application.Person.saveAddress(
							addressId = params.AddressID,
							personId = params.PersonID,
							AddressTypeID = params.AddressTypeID,
							PrimaryFlag = params.PrimaryFlag,
							Address1 = params.Address1,
							Address2 = params.Address2,
							city = params.City,
							state = params.State,
							province = params.Province,
							country = params.Country,
                            zipcode = params.Zipcode,
							phone1 = params.Phone1,
							phone1ext = params.Phone1ext,
							phone2 = params.Phone2,
							phone2ext = params.Phone2ext,
							phone3 = params.Phone3,
							phone3ext = params.Phone3ext)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
    <cffunction name="saveCredentials" hint=""  output="false" returnFormat="plain">
    	<cfparam name="params.PersonID" type="numeric" >
        <cfparam name="params.Pass" type="string" >
        <cfparam name="params.ConPass" type="string" >
        
        <cfset var Status = createObject("component", "#Application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for credentials.")>
        
        <cfset Status = Application.Person.saveCredentials(PersonId=params.PersonID,Pass=params.Pass,ConPass=params.ConPass)>
	
    	<cfset renderText(Status.getJSON()) />
    </cffunction>
    
    <cffunction name="saveDegree" hint="New Person Degree Info - saves using new degree information."  output="false">
    	<cfparam name="params.PersonID" type="numeric" >
        <cfparam name="params.DegreeID" type="numeric" >
        
        <cfset var Status = createObject("component", "#Application.settings.com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for education information.")>
        
        <cfset status = Application.Person.saveDegree(params.PersonID,params.DegreeID)>
	
    	<cfset renderText(status.getJSON()) />
    </cffunction>
    
    <cffunction name="saveEmail"  output="false">
    	<cfparam name="params.email_id" type="numeric" >
    	<cfparam name="params.person_id" type="numeric" >
    	<cfparam name="params.allow_login" type="numeric" >
    	<cfparam name="params.email_address" type="string" >
    	<cfparam name="params.is_primary" type="numeric" >
    	<cfparam name="params.is_verified" type="numeric" >
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <!---<cfcontent type="text/javascript">--->
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for email addresses.")>
        
        <cfset status = application.person.saveEmail(
													params.email_id,
													params.person_id,
													params.allow_login,
													params.email_address,
													params.is_primary,
													params.is_verified)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>

	<cffunction name="saveNote"  output="no" returnFormat="plain">
		<cfparam name="params.PersonID" type="numeric">
		<cfparam name="params.NoteBody" type="string">
		<cfparam name="params.NoteID" type="numeric"  default="0">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript">
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for notes.")>
        
        <cfset status = Application.Person.saveNote(params.PersonID,params.NoteBody,params.NoteID)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="savePerson"  output="false" returnformat="plain">
		<cfparam name="params.PersonID" type="numeric" >
        <cfparam name="params.Birthdate" type="string" >
        <cfparam name="params.FirstName" type="string" >
        <cfparam name="params.MiddleName" type="string"  default="">
        <cfparam name="params.LastName" type="string" >
        <cfparam name="params.CertName" type="string"  default="#params.FirstName# #params.LastName#">
        <cfparam name="params.CertNameCustom" type="string"  default="">
        <cfparam name="params.DisplayName" type="string"  default="#params.FirstName# #params.LastName#">
        <cfparam name="params.Suffix" type="string"  default="">
        <cfparam name="params.Email" type="string" >
        <cfparam name="params.Gender" type="string"  default="">
        <cfparam name="params.SSN" type="string" >
        <cfparam name="params.Password" type="string" >
        <cfparam name="params.SkipDuplicates" type="string"  default="N">
        <cfparam name="params.ChangedFields" type="string"  default="">
        <cfparam name="params.ChangedValues" type="string"  default="">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript">
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for person information.")>
        
        <cfset Status = Application.Person.savePerson(
							PersonID=params.PersonID,
							Birthdate=params.Birthdate,
							FirstName=params.FirstName,
							MiddleName=params.MiddleName,
							LastName=params.LastName,
							CertName=params.CertName,
							CertNameCustom=params.CertNameCustom,
							DisplayName=params.DisplayName,
							Suffix=params.Suffix,
							Email=params.Email,
							Gender=params.Gender,
							SSN=params.SSN,
							Password=params.Password,
							SkinDuplicates=params.SkipDuplicates,
							ChangedFields=params.ChangedFields,
							ChangedValues=params.ChangedValues)>
        
        <cfset renderText(Status.getJSON()) />
    </cffunction>
    
    <cffunction name="savePersonSpecialties"  output="false" description="Saves specialties for provided person." returnFormat="plain">
    	<cfparam name="params.PersonID" type="numeric" >
        <cfparam name="params.Specialties" type="string" >
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access save function for person specialties.")>
        
        <cfset Status = Application.Person.saveSpecialties(params.PersonID,params.Specialties)>
        
        <cfset renderText(Status.getJSON()) />
    </cffunction>
    
    <cffunction name="sendVerificationEmail" hint="Sends an email to verify email address."  output="false">
    	<cfparam name="params.email_id" type="numeric" >
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access send verification email function.")>
        
        <cfset Status = Application.Person.sendVerificationEmail(params.email_id)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
	
    <cffunction name="setAuthLevel"  output="false" description="Set Authority Level">
    	<cfparam name="params.AccountID" type="numeric"  />
        <cfparam name="params.AuthorityID" type="numeric"  />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("You do not have permission to administer this feature.")>
        
        <cfset status = Application.Person.setAuthLevel(params.AccountID,params.AuthorityID)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
	
    <cffunction name="setPrimaryEmail"  output="false" description="Set Authority Level">
    	<cfparam name="params.email_id" type="numeric"  />
    	<cfparam name="params.person_id" type="numeric"  />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the primary email update functionality.")>
        
        <cfset status = Application.Person.setPrimaryEmail(email_id=params.email_id,person_id=params.person_id)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
	
	<cffunction name="setStatus"  output="no" displayname="Set Activity Status">
		<cfparam name="params.PersonID" type="numeric"  />
		<cfparam name="params.StatusID" type="numeric"  />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("You do not have permission to administer this feature.")>
        
        <cfset status = Application.Person.setStatus(params.PersonID,params.StatusID)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
</cfcomponent>