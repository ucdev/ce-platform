<cfcomponent displayname="Person">
	<cfinclude template="#Application.Settings.ComPath#/_UDF/isEmail.cfm" />
    
	<cffunction name="init" access="public" output="no" returntype="_com.Public_Person">
		<cfreturn this />
	</cffunction>
    
    <cffunction name="checkDuplicates" access="public" output="false" returnFormat="plain">
    	<cfargument name="FirstName" type="string" required="yes">
        <cfargument name="LastName" type="string" required="yes">
        <cfargument name="Birthdate" type="string" required="yes">
        <cfargument name="Email" type="string" required="yes">
        
        <cfset var Status = false>
        
		<!--- Check Person DB table for LIKE last names --->
        <cfquery name="DuplicateCheck" datasource="#Application.Settings.DSN#">
            SELECT 	P.PersonID, 
            		P.FirstName, 
                    P.MiddleName, 
                    P.LastName, 
                    CONVERT(varchar, P.Birthdate, 101) AS Birthdate,
                    PE.Email
            FROM ce_Person AS P 
            INNER JOIN ce_Person_Email AS PE ON PE.Person_Id = P.PersonID
            WHERE 0 = 0
            
            <cfif len(Arguments.FirstName)>
                AND FirstName LIKE '#Arguments.FirstName#%' 
            </cfif>
            
            <cfif len(Arguments.LastName)>
                AND LastName LIKE '#Arguments.LastName#%' 
            </cfif>
            
            <cfif len(Arguments.Email)>
                AND PE.Email_Address LIKE '#Arguments.Email#%'
            </cfif>
            
            <cfif len(Arguments.BirthDate)>
                AND P.Birthdate BETWEEN '#DateFormat(Arguments.Birthdate,"mm/dd/yyyy")# 00:00:00' AND '#DateFormat(Arguments.Birthdate,"mm/dd/yyyy")# 23:59:59'
            </cfif>
        </cfquery>
        
        <cfif DuplicateCheck.RecordCount GT 0>
        	<cfset status = application.udf.queryToStruct(DuplicateCheck)>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="deleteAddress" access="public" output="false" returntype="struct">
    	<cfargument name="AddressID" type="numeric" required="yes">
		<cfargument name="PersonID" type="numeric" required="yes">
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete this address due to unknown reasons.")>
        
        <!--- CREATE PERSONADDRESS BEAN --->
        <cfset PersonAddressBean = CreateObject("component","#Application.Settings.Com#PersonAddress.PersonAddress").Init(AddressID=Arguments.AddressID)>
        
        <!--- CHECK IF PERSONADDRESS EXISTS --->
		<cfset PersonAddressExists = Application.Com.PersonAddressDAO.Exists(PersonAddressBean)>
        <cfif PersonAddressExists>
        	<cfset PersonAddressBean = Application.Com.PersonAddressDAO.Read(PersonAddressBean)>
            
            <!--- MAKE SURE ARGUMENTS.PERSONID MATCHES THE PERSON SAVED IN THE RECORD --->
            <cfif PersonAddressBean.getPersonID() EQ Arguments.PersonID>
            	<!--- DELETE ADDRESS RECORD --->
            	<cfquery name="DeleteAddress" datasource="#Application.Settings.DSN#">
                	DELETE FROM ce_Person_Address
                    WHERE AddressID = <cfqueryparam value="#Arguments.AddressID#" cfsqltype="cf_sql_integer" />
                </cfquery>
            	
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Address has been deleted.")>
                
                <cfset Application.History.Add(
                            HistoryStyleID=77,
                            FromPersonID=Session.PersonID,
                            ToPersonID=Arguments.PersonID)>
            <cfelse>
                <cfset status.setStatusMsg("Provided address does not exist.")>
            </cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="deleteEmail" access="public" output="false" returntype="struct">
    	<cfargument name="email_id" type="numeric" required="yes">
        <cfargument name="person_id" type="numeric" required="yes">
		
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("More information is needed to delete this email address.")>
        
        <cfset emailBean = createObject("component", "#application.settings.com#personEmail.personEmail").init(email_id=arguments.email_id)>
        <cfset emailExists = application.com.personEmailDAO.exists(emailBean)>
        
        <cfif emailExists>
        	<cfset emailBean = application.com.personEmailDAO.read(emailBean)>
            
            <cfif emailBean.getPerson_id() EQ arguments.person_id>
            	<cfset emailDeleted = application.com.personEmailDAO.delete(emailBean)>
                
                <cfif emailDeleted>
                	<!--- CHECK IF DELETED EMAIL WAS PRIMARY EMAIL --->
                	<cfset personBean = createObject("component", "#application.settings.com#person.person").init(personId=arguments.person_id)>
                	<cfset personBean = application.com.personDAO.read(personBean)>
                	<cfset personPrefBean = createObject("component", "#application.settings.com#personPref.personPref").init(personId=arguments.person_id)>
                	<cfset personPrefBean = application.com.personPrefDAO.read(personPrefBean)>
                    
                    <!--- DETERMINE IF THE DELETED EMAIL IS THE PRIMARY ADDRESS --->
                    <cfif personPrefBean.getPrimaryEmailId() EQ emailBean.getEmail_id()>
                    	<!--- GET ALL EMAIL ADDRESSES FOR CURRENT PERSON --->
						<cfset emailList = application.com.personEmailGateway.getByAttributesQuery(person_id=emailBean.getPerson_id())>
                        
                        <!--- DETERMINE IF THERE IS AN ADDRESS TO REPLACE CURRENT PRIMARY ADDRESS --->
                        <cfif emailList.recordCount GT 0>
                        	<!--- FILL IN WITH NEXT EMAIL IN LINE --->
	                    	<cfset personBean.setEmail(emailList.email_address)>
	                    	<cfset personPrefBean.setPrimaryEmailId(emailList.email_id)>
                        <cfelse>
                        	<!--- CLEAR PRIMARY ADDRESS INFO --->
	                    	<cfset personBean.setEmail('')>
	                    	<cfset personPrefBean.setPrimaryEmailId('')>
                        </cfif>
                        
                        <!--- SAVE PERSON AND PERSON PREFERENCE BEANS --->
                        <cfset personSaved = application.com.personDAO.save(personBean)>
                        <cfset personPrefSaved = application.com.personPrefDAO.save(personPrefBean)>
					</cfif>
                    
                	<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("'" & emailBean.getEmail_address() & "' has been deleted.")>
                <cfelse>
                	<cfset status.setStatusMsg("Email could not be deleted due to unknown issues.")>
                </cfif>
            <cfelse>
            	<cfset status.addError("email_address", "You do not have permission to delete this address.")>
            </cfif>
		<cfelse>
        	<cfset status.addError("email_address","This email address is not registered in the database.")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
	<cffunction name="deleteNote" access="public" output="true" returntype="struct">
		<cfargument name="NoteID" type="string" required="true">
		
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("More information is needed to delete this note.")>
		
		<cfif Arguments.NoteID EQ "">
        	<cfreturn status />
            <cfabort>
		</cfif>
        
        <cftry>
            <cfset Attributes.Deleted = CreateODBCDateTime(Now())>
            
            <cfquery name="qDeleteNote" datasource="#Application.Settings.DSN#">
                UPDATE ce_Person_Note
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char">,
                    Deleted = <cfqueryparam value="#Attributes.Deleted#" cfsqltype="cf_sql_timestamp">,
                    UpdatedBy = <cfqueryparam value="#Session.PersonID#" cfsqltype="cf_sql_integer">
                WHERE NoteID = <cfqueryparam value="#Arguments.NoteID#" cfsqltype="cf_sql_integer">
            </cfquery>
            
            <!--- NOTE INFO --->
            <cfset NoteBean = CreateObject("component","#Application.Settings.Com#PersonNote.PersonNote").init(NoteID=Arguments.NoteID)>
            <cfset NoteBean = Application.Com.PersonNoteDAO.read(NoteBean)>
            
            <cfset Application.History.Add(
                        HistoryStyleID=71,
                        FromPersonID=Session.PersonID,
                        ToPersonID=NoteBean.getPersonID())>
            
        	<cfset status.setStatus(true)>
            <cfset Status.setStatusMsg("Note has been deleted!")>
            
            <cfcatch type="any">
                <cfset status.addError("General","Error: #cfcatch.Message#")>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>
    
    <cffunction name="deletePerson" access="public" output="false" returntype="struct">
    	<cfargument name="PersonID" type="numeric" required="yes">
        <cfargument name="Reason" type="string" required="yes">
    	
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>

        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete this person due to unknown reasons.")>
        
        <cfif ListFind("2,3", Session.Account.getAuthorityID(), ",")>
        	<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.PersonID)>
            
            <!--- CHECK IF PERSON EXISTS --->
            <cfset PersonExists = Application.Com.PersonDAO.Exists(PersonBean)>
            <cfif PersonExists>
            	<!--- GATHER PERSON INFORMATION --->
            	<cfset PersonBean = Application.Com.PersonDAO.Read(PersonBean)>
                
                <!--- UPDATE PERSON INFORMATION --->
                <cfset PersonBean.setDeletedFlag("Y")>
                <cfset PersonBean.setDeleted(Now())>
                <cfset PersonBean.setDeletedBy(Session.person.getPersonID())>
                
                <!--- SAVE PERSON INFORMATION --->
                <cfset PersonSaved = Application.Com.PersonDAO.Save(PersonBean)>
                
                <cfif PersonSaved>
					<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("Person has been deleted.")>
                    
                    <!--- DELETE ALL EMAILS --->
                    <cfquery name="qDeleteEmails" datasource="#application.settings.dsn#">
                    	DELETE FROM ce_person_email
                        WHERE person_id = <cfqueryparam value="#arguments.personId#" cfsqltype="cf_sql_integer" />
                    </cfquery>
                    
                    <!--- DELETE PERSON PREFERENCES --->
                    <cfquery name="qDeletedPreferences" datasource="#application.settings.dsn#">
                    	DELETE FROM ce_person_pref
                        WHERE personId = <cfqueryparam value="#arguments.personId#" cfsqltype="cf_sql_integer" />
                    </cfquery>
                	
                    <cfif Len(Arguments.Reason)>
	                	<cfset OutputContent = "<strong>Reason:</strong> " & Arguments.Reason>
                
						<cfset Application.History.Add(
                                    HistoryStyleID=91,
                                    FromPersonID=Session.PersonID,
                                    ToPersonID=Arguments.PersonID,
                                    ToContent=OutputContent)>
                    <cfelse>
						<cfset Application.History.Add(
                                    HistoryStyleID=91,
                                    FromPersonID=Session.PersonID,
                                    ToPersonID=Arguments.PersonID)>
                    </cfif>
                </cfif>
            <cfelse>
                <cfset status.setStatusMsg("This person does not exist.")>
            </cfif>
        <cfelse>
            <cfset status.setStatusMsg("You do not have permission to delete this user.")>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="emailConvert" access="Public" output="no" returntype="string">
    	<cfargument name="Email" type="string" required="yes">
        
        <cfset var EmailPart1 = getToken(Arguments.Email, 1, "@")>
        <cfset var EmailPart2 = getToken(Arguments.Email, 2, "@")>
        <cfset var ConvertedEmailPart2 = "">
        
        <cfset ConvertedEmailPart2 = getToken(EmailPart2, ListLen(EmailPart2, ".")-1, ".") & "." & getToken(EmailPart2, ListLen(EmailPart2, "."), ".")>
        
        <cfset ConvertedEmail = EmailPart1 & "@" & ConvertedEmailPart2> 
        
        <cfreturn ConvertedEmail />
    </cffunction>
    
    <cffunction name="emailExists" hint="Determines if a provided email exists in the database." access="public" output="false" returntype="struct">
    	<cfargument name="email_address" type="string" required="yes">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        
        <cfset emailInfo = application.com.personEmailGateway.getByAttributesQuery(email_address=arguments.email_address)>
        
        <cfif emailInfo.recordCount GT 0>
        	<cfset status.setStatus(true)>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="getAuthorityInfo" hint="Returns the authority level for a provided person." access="public" output="false" returntype="string">
    	<cfargument name="PersonID" type="numeric" required="yes">
        
        <cfset Status = "0|0">
        
        <cfif Session.Account.getAuthorityID() EQ 3>
        	<cfquery name="AuthInfo" datasource="#Application.Settings.DSN#">
            	SELECT AccountID,AuthorityID
                FROM ce_Account
                WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfif AuthInfo.RecordCount GT 0>
            	<cfset Status = AuthInfo.AccountID & "|" & AuthInfo.AuthorityID>
            </cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="getCredentials" access="Public" output="no">
    	<cfargument name="PersonID" type="numeric" required="yes">
        
        <cfset var Credentials = StructNew()>
        
        <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
        	SELECT Email, Password
            FROM ce_Person
            WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
        </cfquery>
    
    	<cfif PersonInfo.RecordCount GT 0>
        	<cfset Credentials.Email = PersonInfo.Email>
        	<cfset Credentials.Password = PersonInfo.Password>
            
	    	<cfreturn Credentials />
        <cfelse>
        	<cfreturn false />
        </cfif>
    </cffunction>
    
	<cffunction name="getNameByID" access="public" output="no" returnFormat="plain">
		<cfargument name="PersonID" type="numeric" required="yes">
		
		<cfquery name="qGetName" datasource="#Application.Settings.DSN#">
			SELECT FirstName,LastName,MiddleName FROM ce_Person
			WHERE PersonID=<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfif qGetName.RecordCount GT 0>
			<cfset FullName = application.udf.queryToStruct(qGetName)>
		</cfif>
		
		<cfreturn FullName />
	</cffunction>
    
    <cffunction name="getPersonSpecialties" access="Public" output="no" returntype="array">
    	<cfargument name="PersonID" type="numeric" required="yes">
        
        <cfset var PersonSpecialties = arrayNew(1)>
        
        <cfquery name="qPersonSpecialties" datasource="#Application.Settings.DSN#">
        	SELECT SpecialtyID
            FROM ce_Person_SpecialtyLMS
            WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
        </cfquery>
        
        <cfif qPersonSpecialties.recordCount GT 0>
        	<cfset PersonSpecialties = application.udf.queryToStruct(qPersonSpecialties)>
        </cfif>
        
        <cfreturn PersonSpecialties />
    </cffunction>
    
    <cffunction name="isPrimaryAddress" hint="Checks if the provided AddressID of the provided PersonID is the primary address." access="public" output="false" returntype="boolean">
    	<cfargument name="AddressID" type="numeric" required="yes">
        <cfargument name="PersonID" type="numeric" required="yes">
        
        <cfset var Status = false>
        
        <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
        	SELECT PrimaryAddressID
            FROM ce_Person
            WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfif PersonInfo.RecordCount GT 0>
        	<cfif PersonInfo.PrimaryAddressID EQ Arguments.AddressID>
            	<cfset Status = true>
            </cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="moveActivities" access="public" output="no" returnType="struct">
    	<cfargument name="MoveFromPersonID" type="string" required="true" />
    	<cfargument name="MoveFromName" type="string" required="true" />
        <cfargument name="MoveToPersonID" type="string" required="true" />
    	<cfargument name="MoveToName" type="string" required="true" />
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access the activity move functionality.")>
        
        <cfquery name="qGetActivitiesFrom" datasource="#Application.Settings.DSN#">
        	UPDATE ce_Attendee
            SET PersonID = <cfqueryparam value="#Arguments.MoveToPersonID#" cfsqltype="cf_sql_integer" />
            WHERE PersonID = <cfqueryparam value="#Arguments.MoveFromPersonID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <!--- GET MOVEDFROM PERSON INFORMATION --->
        <cfset FromPersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.MoveFromPersonID)>
        <cfset FromPersonBean = Application.Com.PersonDAO.Read(FromPersonBean)>
        
        <!--- GET MOVEDTO PERSON INFORMATION --->
        <cfset ToPersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.MoveToPersonID)>
        <cfset ToPersonBean = Application.Com.PersonDAO.Read(ToPersonBean)>
        
        <!--- CREATE THE MOVEDFROM TOCONTENT VARIABLE --->
        <cfset MovedFromContent = "Person of Destination: <a href=""%WebPath%Person.Detail?PersonID=" & Arguments.MoveToPersonID & """>" & ToPersonBean.getFirstName() & " " & ToPersonBean.getLastName() & "</a>">
        
        <!--- CREATE THE MOVEDFROM TOCONTENT VARIABLE --->
        <cfset MovedToContent = "Person of Origin: <a href=""%WebPath%Person.Detail?PersonID=" & Arguments.MoveFromPersonID & """>" & FromPersonBean.getFirstName() & " " & FromPersonBean.getLastName() & "</a>">
        
        <cfset Application.History.Add(
					HistoryStyleID=80,
					FromPersonID=Session.PersonID,
					ToPersonID=Arguments.MoveFromPersonID,
					ToContent=MovedFromContent)>
        
        <cfset Application.History.Add(
					HistoryStyleID=82,
					FromPersonID=Session.PersonID,
					ToPersonID=Arguments.MoveToPersonID,
					ToContent=MovedToContent)>
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("The activities have been moved successfully.")>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="requestPassword" hint="Used for the forgot password functionality." access="remote" output="no" returntype="struct">
    	<cfargument name="Email" type="string" required="yes">
        
        <cfset var CurrEmail = Arguments.Email>
        <cfset var Status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Could not retrieve credential information due to unknown reasons.")>
        
        <cfif ListLen(getToken(CurrEmail,2,"@"),".") GT 2>
        	<cfset CurrEmail = this.EmailConvert(CurrEmail)>
        </cfif>
        
        <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
        	DECLARE @Email nvarchar(255)
            
            SET @Email = <cfqueryparam value="#CurrEmail#" cfsqltype="cf_sql_varchar" />
            
        	SELECT PersonID, Password
            FROM ce_Person
            WHERE ceschema.cleanEmailDomain(Email) = @Email AND DeletedFlag = 'N'
        </cfquery>
        
        <cfif PersonInfo.RecordCount GT 0>
        	<!--- TEST FOR BLANK PASSWORD --->
        	<cfif PersonInfo.Password EQ "">
            	<cfquery name="updatePersonInfo" datasource="#application.settings.dsn#">
                	UPDATE 
                    	ce_person
                    SET
                    	password = <cfqueryparam value="#Application.UDF.getRandomString()#" cfsqltype="cf_sql_varchar" />
                    WHERE personId = <cfqueryparam value="#PersonInfo.PersonId#" cfsqltype="cf_sql_integer" />
                </cfquery>
            </cfif>
            
        	<!--- SEND EMAIL --->
            <cfset Application.Email.Send( ToPersonID=PersonInfo.PersonID, EmailStyleID=1)>
            
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("An email has been sent to your email address.")>
            
            <cfreturn Status />
            <cfabort>
        <cfelse>
			<cfset status.setStatus(false)>
            <cfset status.setStatusMsg("The provided Email Address is not found in our system.")>
            
            <cfreturn Status />
            <cfabort>
        </cfif>
    </cffunction>

	<cffunction name="saveAddress" access="public" output="false" returntype="struct">
		<cfargument name="AddressID" type="numeric" required="yes">
        <cfargument name="PersonID" type="numeric" required="yes">
        <cfargument name="AddressTypeID" type="numeric" required="yes">
        <cfargument name="PrimaryFlag" type="string" required="yes">
        <cfargument name="Address1" type="string" required="yes">
        <cfargument name="Address2" type="string" required="yes">
        <cfargument name="City" type="string" required="yes">
        <cfargument name="State" type="string" required="yes">
        <cfargument name="Province" type="string" required="yes">
        <cfargument name="Country" type="string" required="yes">
        <cfargument name="geonameid" type="string" required="no" default="0">
        <cfargument name="Zipcode" type="string" required="yes">
        <cfargument name="Phone1" type="string" required="no" default="">
        <cfargument name="Phone1ext" type="string" required="no" default="">
        <cfargument name="Phone2" type="string"  required="no" default="">
        <cfargument name="Phone2ext" type="string" required="no" default="">
        <cfargument name="Phone3" type="string" required="no" default="">
        <cfargument name="Phone3ext" type="string" required="no" default="">
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Could not save address for unknown reasons.")>
        
        <!--- CREATE BEAN ---->
        <cfset PersonAddressBean = CreateObject("component","#Application.Settings.Com#PersonAddress.PersonAddress").Init(AddressID=AddressID)>
		
        <!--- CHECK IF ADDRESS EXISTS --->
        <cfset PersonAddressExists = Application.Com.PersonAddressDAO.Exists(PersonAddressBean)>
        <cfif PersonAddressExists>
        	<!--- GATHER ADDRESS INFORMATION --->
	        <cfset PersonAddressBean = Application.Com.PersonAddressDAO.Read(PersonAddressBean)>
            
            <!--- FILL UPDATED INFO --->
			<cfset PersonAddressBean.setUpdated(Now())>
            <cfset PersonAddressBean.setUpdatedBy(Session.PersonID)>
        <cfelse>
        	<!--- FILL CREATED INFO --->
			<cfset PersonAddressBean.setCreated(Now())>
            <cfset PersonAddressBean.setCreatedBy(Session.PersonID)>
        </cfif>
        
        <!--- UPDATE BEAN INFORMATION --->
        <cfset PersonAddressBean.setAddressTypeID(Arguments.AddressTypeID)>
        <cfset PersonAddressBean.setAddress1(Arguments.Address1)>
        <cfset PersonAddressBean.setAddress2(Arguments.Address2)>
        <cfset PersonAddressBean.setCity(Arguments.City)>
        <cfset PersonAddressBean.setCountry(Arguments.Country)>
        
        <cfset PersonAddressBean.setGeonameId(Arguments.geonameid)>
		
        <!--- CHECK IF THE COUNTRY IS CANADA --->
        <cfif PersonAddressBean.getCountry() EQ "Canada">
        	<cfset PersonAddressBean.setProvince(Arguments.Province)>
	        <cfset PersonAddressBean.setState("")>
        <!--- CHECK IF THE COUNTRY IS USA --->
       	<cfelseif PersonAddressBean.getCountry() EQ "United States of America">
        	<cfset PersonAddressBean.setProvince("")>
	        <cfset PersonAddressBean.setState(Arguments.State)>
        <cfelse>
        	<cfset PersonAddressBean.setProvince("")>
	        <cfset PersonAddressBean.setState("")>
        </cfif>
        
        <cfset PersonAddressBean.setZipcode(Arguments.Zipcode)>
        <cfset PersonAddressBean.setPersonID(Arguments.PersonID)>
        <cfset PersonAddressBean.setPhone1(Application.UDF.stripAllBut(Arguments.Phone1,"1234567890"))>
        <cfset PersonAddressBean.setPhone1ext(arguments.Phone1ext)>
        <cfset PersonAddressBean.setPhone2(Application.UDF.stripAllBut(Arguments.Phone2,"1234567890"))>
        <cfset PersonAddressBean.setPhone2ext(arguments.Phone2ext)>
        <cfset PersonAddressBean.setPhone3(Application.UDF.stripAllBut(Arguments.Phone3,"1234567890"))>
        <cfset PersonAddressBean.setPhone3ext(arguments.Phone3ext)>
        
        <!--- SAVE PERSONADDRESSBEAN --->
		<cfset PersonAddressSaved = Application.Com.PersonAddressDAO.Save(PersonAddressBean)>
        
        <cfif isNumeric(PersonAddressSaved)>
        	<cfset CurrentAddressID = PersonAddressSaved>
                
			<cfset Application.History.Add(
                        HistoryStyleID=78,
                        FromPersonID=Session.PersonID,
                        ToPersonID=Arguments.PersonID)>
        <cfelse>
        	<cfset CurrentAddressID = Arguments.AddressID>
                
			<cfset Application.History.Add(
                        HistoryStyleID=79,
                        FromPersonID=Session.PersonID,
                        ToPersonID=Arguments.PersonID)>
        </cfif>
        
        <!--- CHECK IF ADDRESS PROPERLY SAVED --->
        <cfif isNumeric(PersonAddressSaved) OR PersonAddressSaved>
        	<!--- CREATE ADDRESS CREATION COOKIE // USED FOR PREDETERMINATION OF ADDRESS TYPE --->
            <cfcookie name="address_type" value="#Arguments.AddressTypeID#" />
            
        	<!--- CHECK IF CURRENT ADDRESS IS BEING SET TO PRIMARY ADDRESS --->
        	<cfif Arguments.PrimaryFlag EQ "Y">
            	<!--- GATHER PERSON INFORMATION --->
            	<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.PersonID)>
                <cfset PersonBean = Application.Com.PersonDAO.Read(PersonBean)>
                
                <!--- UDPATE PRIMARY ADDRESS --->
	            <cfset PersonBean.setPrimaryAddressID(CurrentAddressID)>
                <cfset PersonBean.setUpdated(Now())>
                <cfset PersonBean.setUpdatedBy(Session.PersonID)>
                
                <!--- SAVE PERSON INFORMATION --->
                <cfset PersonSaved = Application.Com.PersonDAO.Update(PersonBean)>
                <cfif PersonSaved>
                	<cfif Session.PersonID NEQ Arguments.PersonID>
						<cfset Application.History.Add(
                                    HistoryStyleID=84,
                                    FromPersonID=Session.PersonID,
                                    ToPersonID=Arguments.PersonID)>
              		<cfelse>
						<cfset Application.History.Add(
                                    HistoryStyleID=90,
                                    FromPersonID=Session.PersonID,
                                    ToPersonID=Arguments.PersonID)>
                	</cfif>
            	</cfif>
            <cfelseif Arguments.PrimaryFlag EQ "N" AND Arguments.AddressID GT 0>
            	<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.PersonID)>
                <cfset PersonBean = Application.Com.PersonDAO.Read(PersonBean)>
                
                <cfif PersonBean.getPrimaryAddressID() EQ CurrentAddressID>
                	<!--- UDPATE PRIMARY ADDRESS --->
					<cfset PersonBean.setPrimaryAddressID("")>
                    <cfset PersonBean.setUpdated(Now())>
                    <cfset PersonBean.setUpdatedBy(Session.PersonID)>
					
					<!--- SAVE PERSON INFORMATION --->
                    <cfset PersonSaved = Application.Com.PersonDAO.Update(PersonBean)>
                </cfif>
            </cfif>
        
        	<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Address has been saved.")>
        </cfif>
                
		<cfreturn Status />
	</cffunction>
    
    <cffunction name="saveCredentials" access="public" output="false" returntype="struct">
    	<cfargument name="PersonID" type="numeric" required="yes">
        <cfargument name="Pass" type="string" required="no" default="">
        <cfargument name="ConPass" type="string" required="no" default="">
        <cfargument name="Email" type="string" required="no" default="">
        <cfargument name="ConEmail" type="string" required="no" default="">
        
        <cfset var Status = createObject("component", "#Application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save credential information due to unknown reasons.")>
        
        <cfif Arguments.Pass NEQ "">
			<cfif Arguments.ConPass EQ "">
                <cfset Status.addError("ConfirmPassword","More information is needed to update credentials.")>
            <cfelseif Compare(Arguments.Pass,Arguments.ConPass) NEQ 0>
                <cfset Status.addError("NewPassword:ConfirmPassword","Provided Password does not match the Provided Confirmed Password.")>
            </cfif>
        </cfif>
        
        <!---<cfif Arguments.Pass EQ "">
			<cfset Status.addError("NewPassword:ConfirmPassword","Please provide more information to update your credentials.")>
        </cfif>--->
            
        <cfif arrayLen(status.getErrors()) EQ 0>
        	<!--- CREATE PERSON BEAN --->
			<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=Arguments.PersonID)>
            
            <!--- CHECK IF THE PERSON EXISTS --->
            <cfset PersonExists = Application.Com.PersonDAO.Exists(PersonBean)>
            <cfif PersonExists>
            	<!--- FILL PERSON BEAN --->
            	<cfset PersonBean = Application.Com.PersonDAO.Read(PersonBean)>
                
                <!--- CHECK IF PASSWORD NEEDS SAVED --->
                <cfif Arguments.Pass NEQ "">
                	<cfset PersonBean.setPassword(Arguments.Pass)>
                </cfif>
                
                <!--- UPDATE PERSON BEAN --->
                <cfset PersonBean.setUpdated(Now())>
                <cfset PersonBean.setUpdatedBy(Session.PersonID)>
                
                <!--- SAVE PERSON INFORMATION --->
                <cfset PersonSaved = Application.Com.PersonDAO.Update(PersonBean)>
                
                <cfif PersonSaved>
                	<!--- EMAIL USER ABOUT CREDENTIAL UPDATE --->
                	<cfset Status.setStatus(true)>
                    <cfset status.setStatusMsg("Credentials have been updated.")>
                    
                    <cfif Session.PersonID NEQ Arguments.PersonID>
						<cfset Application.History.Add(
                                    HistoryStyleID=83,
                                    FromPersonID=Session.PersonID,
                                    ToPersonID=Arguments.PersonID)>
                	<cfelse>
						<cfset Application.History.Add(
                                    HistoryStyleID=85,
                                    FromPersonID=Session.PersonID,
                                    ToPersonID=Arguments.PersonID)>
                	</cfif>
                </cfif>
            <cfelse>
            	<cfset status.setStatusMsg("The provided person does not exist.")>
            </cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="saveDegree" access="Public" output="false" returntype="struct">
    	<cfargument name="PersonID" type="numeric" required="yes">
        <cfargument name="DegreeID" type="numeric" required="yes">
        
        <cfset var Status = createObject("component", "#Application.settings.com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save education information for unknown reasons.")>
        
        <!--- UPDATE ALL CURRENT PERSON DEGREE RECORDS TO DELETED --->
        <cfquery name="qDelete" datasource="#Application.Settings.DSN#">
            UPDATE ce_Person_Degree
            SET DeletedFlag='Y'
            WHERE PersonID= <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfset PersonDegreeInfo = Application.Com.PersonDegreeGateway.getByAttributes(PersonID=Arguments.PersonID,DegreeID=Arguments.DegreeID)>
        
        <cfif PersonDegreeInfo.RecordCount GT 0>
			<cfset PersonDegree = CreateObject("component","#Application.Settings.Com#PersonDegree.PersonDegree").init(PersonID=Arguments.PersonID, DegreeID=Arguments.DegreeID)>
            <cfset PersonDegree = Application.Com.PersonDegreeDAO.Read(PersonDegree)>
        <cfelse>
			<cfset PersonDegree = CreateObject("component","#Application.Settings.Com#PersonDegree.PersonDegree").init()>
			<cfset PersonDegree.setPersonID(Arguments.PersonID)>
            <cfset PersonDegree.setDegreeID(Arguments.DegreeID)>
        </cfif>
        <cfset PersonDegree.setDeletedFlag("N")>
        <cfset PersonDegreeSaved = Application.Com.PersonDegreeDAO.Save(PersonDegree)>
        
        <cfif isNumeric(PersonDegreeSaved) OR PersonDegreeSaved>
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Education information has been saved.")>
            
            <cfquery name="CurrentDegree" dbtype="query">
                SELECT Name
                FROM Application.List.Degrees
                WHERE DegreeID = <cfqueryparam value="#Arguments.DegreeID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfset ContentOutput = "<strong>Degree:</strong> " & CurrentDegree.Name>
            
			<cfif Session.PersonID NEQ Arguments.PersonID>
                <cfset Application.History.Add(
                            HistoryStyleID=66,
                            FromPersonID=Session.PersonID,
                            ToPersonID=Arguments.PersonID,
							ToContent=ContentOutput)>
            <cfelse>
                <cfset Application.History.Add(
                            HistoryStyleID=86,
                            FromPersonID=Session.PersonID,
                            ToPersonID=Arguments.PersonID,
							ToContent=ContentOutput)>
            </cfif>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="saveEmail" access="public" output="false" returntype="struct">
    	<cfargument name="email_id" type="numeric" required="no" default="0">
    	<cfargument name="person_id" type="numeric" required="yes">
    	<cfargument name="allow_login" type="numeric" required="no" default="0">
    	<cfargument name="email_address" type="string" required="yes">
    	<cfargument name="is_primary" type="numeric" required="no" default="0">
    	<cfargument name="is_verified" type="numeric" required="no" default="0">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("More Information is needed to save this email address.")>
        
		<cfif arguments.email_address EQ "" OR NOT application.UDF.isEmail(arguments.email_address)>
        	<cfset status.addError("email_address", "You must provide a valid email address.")>
        	<cfreturn status />
            <cfabort>
		</cfif>
        
        <cfset emailBean = createObject("component", "#application.settings.com#personEmail.personEmail").init(email_id=arguments.email_id)>
        <cfset emailExists = application.com.personEmailDAO.exists(emailBean)>
        <cfset isDuplicateEmail = application.auth.emailExists(arguments.email_address, arguments.person_id)>
        
        <cfif emailExists AND NOT isDuplicateEmail>
        	<cfset emailBean = application.com.personEmailDAO.read(emailBean)>
        <cfelseif emailExists AND isDuplicateEmail>
                <cfset status.addError("email_address", arguments.email_address & " is already registered within the database.")>
                <cfreturn status />
                <cfabort>
        <cfelse>
        	<!--- CHECK IF EMAIL EXISTS ALREADY --->
			<cfif isDuplicateEmail>
                <cfset status.addError("email_address", arguments.email_address & " is already registered within the database.")>
                <cfreturn status />
                <cfabort>
            </cfif>
            
        	<cfset emailBean.setPerson_id(arguments.person_id)>
        	<cfset emailBean.setVerification_key(application.UDF.getRandomString(length=20))>
        </cfif>
        
        <cfset emailBean.setAllow_login(arguments.Allow_login)>
        <cfset emailBean.setEmail_address(arguments.email_address)>
        <cfset emailBean.setIs_verified(arguments.is_verified)>
        
        <cfset emailSaved = application.com.personEmailDAO.save(emailBean)>
        
        <!--- DETERMINE IF EMAIL ADDRESS SAVED --->
        <cfif emailSaved OR isNumeric(emailSaved)>
			<cfif isNumeric(emailSaved)>
                <cfset emailBean.setEmail_id(emailSaved)>
            </cfif>
            
            <!--- DETERMINE IF CURRENT EMAIL ADDRESS IS PRIMART --->
            <cfif arguments.is_primary>
                <cfset emailIsPrimary = setPrimaryEmail(email_id=emailBean.getEmail_id(), person_id=arguments.person_id)>
            </cfif>
            
            <!--- ADD THE EMAILBEAN TO GET THE EMAIL_ID OUT OF THIS FUNCTION --->
            <cfset status.setPayload(emailBean)>
            
        	<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Email has been saved.")>
		</cfif>
        
        <cfreturn status />
    </cffunction>

	<cffunction name="saveNote" access="public" output="no" returntype="struct">
		<cfargument name="PersonID" required="true" type="string">
		<cfargument name="NoteBody" required="true" type="string">
		<cfargument name="NoteID" required="false" default="0">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("More Information is needed to add this note.")>
		
		<cfif Arguments.NoteBody EQ "">
        	<cfreturn status />
            <cfabort>
		</cfif>
		
		<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=Arguments.PersonID)>
		<cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
		
		<cfset PersonNoteBean = CreateObject("component","#Application.Settings.Com#PersonNote.PersonNote").Init(NoteID=Arguments.NoteID,PersonID=Arguments.PersonID,Body=Arguments.NoteBody,CreatedBy=Session.PersonID)>
        
        <cfset aErrors = PersonNoteBean.Validate()>
        <!--- Fill Request.Status.Errors --->
        <cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
            <cfset Request.Status.Errors = ListAppend(Request.Status.Errors,aErrors[i].Message,"|")>
        </cfloop>
        
        <cfif NOT arrayLen(status.getErrors())>
            <cftry>
                <cfset PersonNoteBean = Application.Com.PersonNoteDAO.Save(PersonNoteBean)>
                
                <cfset Application.History.Add(
                            HistoryStyleID=70,
                            FromPersonID=Session.PersonID,
                            ToPersonID=Arguments.PersonID,
                            ToContent=Arguments.NoteBody)>
                
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("The note has been added properly.")>
                
                <cfcatch type="any">
                    <cfset status.addError("General","Error: #cfcatch.Message#")>
                </cfcatch>
            </cftry>
        </cfif>
        
		<cfreturn Status />
	</cffunction>
    
	<cffunction name="savePerson" access="Public" output="false" returntype="struct">
		<cfargument name="PersonID" type="numeric" required="yes">
        <cfargument name="Birthdate" type="string" required="no">
        <cfargument name="FirstName" type="string" required="yes">
        <cfargument name="MiddleName" type="string" required="yes">
        <cfargument name="LastName" type="string" required="yes">
        <cfargument name="CertName" type="string" required="no" default="">
        <cfargument name="CertNameCustom" type="string" required="yes">
        <cfargument name="DisplayName" type="string" required="yes">
        <cfargument name="Suffix" type="string" required="yes">
        <cfargument name="Email" type="string" required="yes">
        <cfargument name="Gender" type="string" required="yes">
        <cfargument name="SSN" type="string" required="yes">
        <cfargument name="Password" type="string" required="yes">
        <cfargument name="SkipDuplicates" type="string" required="no" default="N">
        <cfargument name="ChangedFields" type="string" required="no">
        <cfargument name="ChangedValues" type="string" required="no">
        <cfargument name="checkDupes" type="boolean" required="no" default="true">
        <cfargument name="verifiedEmail" type="boolean" required="no" default="false">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset var CurrentPersonID = Arguments.PersonID>
        <cfset var ChangedOutput = "">
        <cfset var EmailNeeded = "N">
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save person record for unknown reasons.")>
        
        <!--- Create Person Bean --->
        <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=CurrentPersonID)>
        
		<cfif arguments.checkDupes>
            <cfset PersonExists = Application.Com.PersonDAO.Exists(PersonBean)>
            
			<!--- DETERMINE IF PERSON EXISTS --->
            <cfif PersonExists>
                <cfset PersonBean = Application.Com.PersonDAO.Read(PersonBean)>
            <!--- DETERMINE IF PERSON ID WAS PROVIDED BUT DOES NOT EXIST --->
            <cfelseif NOT PersonExists AND Arguments.PersonID GT 0>
                <cfset status.setStatusMsg("Fail|this person does not exist.")>
                <cfreturn Status />
                <cfabort>
            <!--- DETERMINE IF THIS IS A NEW PERSON RECORD AND DUPLICATES NEED CHECKED --->
            <cfelseif Arguments.PersonID EQ 0 AND Arguments.SkipDuplicates EQ "N">
            	<!--- DETERMINE IF EMAIL IS BLANK --->
                <cfif arguments.Email EQ "">
                    <cfset checkDuplicates = this.checkDuplicates(Arguments.FirstName,Arguments.LastName,Arguments.Birthdate,Arguments.Email)>
                    
                    <!--- DETERMINE IF DUPLICATES OF THIS PERSON EXIST --->
					<cfif arrayLen(checkDuplicates) GT 0>
                        <cfset status.setData(checkDuplicates)>
                        <cfset status.setStatusMsg("Duplicates exist.")>
                        <cfreturn status />
                        <cfabort>
                    </cfif>
                <cfelse>
                    <cfset emailExists = application.auth.emailExists(arguments.email)>
                    
                	<!--- DETERMINE IF EMAIL ALREADY EXISTS --->
                    <cfif emailExists>
                        <cfset status.addError("Email","Email already exists in database.")>
                        <cfreturn status />
                    </cfif>
                </cfif>
            </cfif>
		</cfif>
        
        <!--- DETERMINE IF THIS IS A NEW PERSON --->
        <cfif Arguments.PersonID EQ 0>
        	<!--- CHECK TO SEE IF EMAIL NEEDS GENERATED --->
        	<cfif Arguments.Email EQ "">
       			<cfset EmailNeeded = "Y">
            	
				<cfif Arguments.SSN EQ "" OR NOT isNumeric(Arguments.SSN)>
                	<cfset status.addError("SSN", "You must provide the last 4 of SSN.")>
                </cfif>
                
                <cfif NOT isDate(Arguments.BirthDate)>
                	<cfset status.addError("date1", "You must provide a valid Birthdate.")>
                </cfif>
                
                <cfif Request.Status.Errors EQ "">
					<cfset TempEmail = Left(Arguments.FirstName, 2) & Left(Arguments.Lastname, 2)>
                    
                    <cfif Arguments.SSN NEQ "">
                        <cfset TempEmail = TempEmail & Arguments.SSN>
                    </cfif>
                    
                    <cfset TempEmail = TempEmail & DateFormat(Arguments.BirthDate, "MM") & DateFormat(Arguments.BirthDate, "DD")>
                    <cfset TempEmail = TempEmail & "@ccpd.admin">
                
	                <cfset Arguments.Email = TempEmail>
                </cfif>
            <cfelseif isEmail(Arguments.Email) EQ "NO">
            	<cfset status.addError("Email", "You must provide a valid Email Address.")>
            </cfif>
        </cfif>
            
		<!--- Fills the Bean with values from Person Edit form --->
        <cfset PersonBean.setBirthDate(Arguments.Birthdate)> 
        <cfset PersonBean.setFirstName(Arguments.FirstName)> 
        <cfset PersonBean.setMiddleName(Arguments.MiddleName)> 
        <cfset PersonBean.setLastName(Arguments.LastName)> 
        <cfset PersonBean.setSuffix(Arguments.Suffix)> 
        <cfset PersonBean.setEmail(Arguments.Email)>
        <cfset PersonBean.setSSN(Arguments.SSN)>
        <cfset PersonBean.setGender(Arguments.Gender)>
        
        <!--- FILL DISPLAY NAME Field --->
        <cfif Arguments.CertName NEQ "">
        	<cfset PersonBean.setCertName(Arguments.CertName)> 
        <cfelseif Arguments.CertName EQ "" AND Arguments.CertNameCustom NEQ "">
       		<cfset PersonBean.setCertName(Arguments.CertNameCustom)> 
        </cfif>
        
        <!--- FILL CERT NAME FIELD --->
        <cfif arguments.DisplayName EQ "">
        	<cfset PersonBean.setDisplayName(personBean.getCertName())>
        <cfelse>
      		<cfset PersonBean.setDisplayName(Arguments.DisplayName)> 
        </cfif>
        
        <cfif CurrentPersonID EQ 0>
        	<cfif Arguments.Password NEQ "">
            	<cfset PersonBean.setPassword(Arguments.Password)>
            <cfelse>
            	<cfset PersonBean.setPassword(Application.UDF.getRandomString())>
            </cfif>
            
        	<cfset PersonBean.setCreated(Now())>
            <cfset PersonBean.setCreatedBy(Session.PersonID)>
        <cfelse>
        	<cfset PersonBean.setUpdated(Now())>
            <cfset PersonBean.setUpdatedBy(Session.PersonID)>
        </cfif>
        
        <!--- Validate Bean --->
        <cfset aErrors = PersonBean.Validate()>
        <cfif arrayLen(aErrors) GT 0>
            	<cfdump var="#aErrors#"><cfabort>
		</cfif>
        
        <!--- Fill Request.Status.Errors --->
        <cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
            <cfset status.addError(aErrors[i].field,aErrors[i].Message)>
        </cfloop>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
            <!--- Submits the Bean for data saving --->
            <cfset NewPersonID = Application.Com.PersonDAO.Save(PersonBean)>
			
                <cfif isNumeric(NewPersonID)>
                    <cfset CurrentPersonID = NewPersonID>
                    
                    <cfif EmailNeeded EQ "Y">
                        <cfset PersonBean.setPersonID(CurrentPersonID)>
                        <cfset PersonBean.setEmail(getToken(PersonBean.getEmail(), 1, "@") & "-" & CurrentPersonID & "@" & getToken(PersonBean.getEmail(), 2, "@"))>
                        <cfset PersonSaved = Application.Com.PersonDAO.Update(PersonBean)>
                    <cfelse>
                    	<cfif NOT verifiedEmail>
							<cfset emailSaved = saveEmail(
                                                        email_id=0,
                                                        person_id=currentPersonId,
                                                        email_address=arguments.email,
                                                        is_primary=1)>
						<cfelse>
							<cfset emailSaved = saveEmail(
                                                        email_id=0,
                                                        person_id=currentPersonId,
                                                        email_address=arguments.email,
                                                        is_primary=1,
														is_verified=1)>
                        </cfif>
                    </cfif>
                    
					<cfset Application.History.Add(
                        HistoryStyleID=51,
                        FromPersonID=Session.PersonID,
                        ToPersonID=CurrentPersonID
                    )>
                    
                	<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg(CurrentPersonID)>
                <cfelseif NewPersonID>
					<cfif ListLen(ChangedFields,"|") GTE 1>
                        <cfloop from="1" to="#ListLen(ChangedFields,'|')#" index="i">
                            <cfset ChangedOutput = ListAppend(ChangedOutput,"<b>" & GetToken(Arguments.ChangedFields,i,'|') & ":</b> " & GetToken(Arguments.ChangedValues,i,'|'),"|")>
                        </cfloop>
                        <cfset ChangedOutput = Replace(ChangedOutput,"|","<br>","ALL")>
                    </cfif>
                    
                	<cfif Session.PersonID NEQ Arguments.PersonID>
						<cfset Application.History.Add(
									HistoryStyleID=62,
									FromPersonID=Session.PersonID,
									ToPersonID=CurrentPersonID,
									ToContent=ChangedOutput)>
                    <cfelse>
						<cfset Application.History.Add(
									HistoryStyleID=63,
									FromPersonID=Session.PersonID,
									ToPersonID=CurrentPersonID)>
                    </cfif>
                    
                	<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("The information for " & arguments.FirstName & " " & arguments.LastName & " has been updated.")>
                </cfif>
            
             <!---  <cfset status.addError("General","Error: #cfcatch.Message#")>--->
        </cfif>
        
        <cfreturn Status />
	</cffunction>
    
    <cffunction name="saveSpecialties" access="public" output="false" returntype="struct">
    	<cfargument name="PersonID" type="numeric" required="yes">
        <cfargument name="Specialties" type="string" required="yes">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save person specialties for unknown reasons.")>
        
        <cftry>
            <cfquery name="DeleteSpecialties" datasource="#Application.Settings.DSN#">
                DELETE FROM ce_Person_SpecialtyLMS
                WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfloop list="#Specialties#" index="SpecialtyID">
                <cfquery name="SaveSpecialty" datasource="#Application.Settings.DSN#">
                    INSERT INTO ce_Person_SpecialtyLMS (
                        PersonID,
                        SpecialtyID,
                        Created,
                        DeletedFlag
                    ) VALUES (
                        <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />,
                        <cfqueryparam value="#SpecialtyID#" cfsqltype="cf_sql_integer" />,
                        <cfqueryparam value="#Now()#" cfsqltype="cf_sql_timestamp" />,
                        'N'
                    )
                </cfquery>
            </cfloop>
            
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Specialties have been updated.")>
          	
            <cfcatch type="any">
            	<cfset status.addError("General", CFCatch.Message)>
            </cfcatch>
        </cftry>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="sendVerificationEmail" access="public" output="false" returntype="struct">
    	<cfargument name="email_id" type="numeric" required="yes">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot send verification email for unknown reasons.")>
        
        <cfset emailBean = createObject("component", "#application.settings.com#personEmail.personEmail").init(email_id=arguments.email_id)>
        <cfset emailExists = application.com.personEmailDAO.exists(emailBean)>
        
        <!--- DETERMINE IF EMAIL EXISTS --->
        <cfif emailExists>
        	<cfset emailBean = application.com.personEmailDAO.read(emailBean)>
            
            <!--- UPDATE VERIFICATION KEY AS TO KEEP DATA INTEGRITY --->
			<cfset emailBean.setVerification_key(application.UDF.getRandomString(length=20))>
            <cfset emailSaved = application.com.personEmailDAO.save(emailBean)>
            
            <!--- SEND EMAIL  --->
            <cfset application.email.send(EmailStyleID=6, toEmailAddress=emailBean.getEmail_address(), toEmailId=arguments.email_id, toPersonId=emailBean.getPerson_id())>
            
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Verification email has been sent.")>
        <cfelse>
        	<cfset status.setStatusMsg("This email is not registered in the database.")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="setAuthLevel" access="public" output="false" description="Set Authority Level" returntype="struct">
    	<cfargument name="AccountID" type="numeric" required="yes" />
        <cfargument name="AuthorityID" type="numeric" required="yes" />
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("You do not have permission to administer this feature.")>
        
        <cfif Session.Account.getAuthorityID() EQ 3>
        	<!--- CREATE ACCOUNT BEAN --->
        	<cfset AccountBean = CreateObject("component","#Application.Settings.Com#Account.Account").Init(AccountID=Arguments.AccountID)>
            
            <!--- CHECK IF ACCOUNT ALREADY EXISTS --->
			<cfset AccountExists = Application.Com.AccountDAO.Exists(AccountBean)>
            <cfif AccountExists>
            	<cfset AccountBean = Application.Com.AccountDAO.Read(AccountBean)>
                <cfset AccountBean.setUpdated(Now())>
            <cfelse>
            	<cfset AccountBean.setCreated(Now())>
            </cfif>
            
            <!--- FILL ACCOUNT BEAN --->
            <cfset AccountBean.setAuthorityID(Arguments.AuthorityID)>
            
            <!--- SAVE ACCOUNT INFORMATION --->
            <cfset AccountSaved = Application.Com.AccountDAO.Save(AccountBean)>
            
            <cfif isNumeric(AccountSaved) OR AccountSaved>
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Authority level has been updated.")>
            </cfif>
        </cfif>
       	
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="setPrimaryEmail" access="public" output="false" returntype="struct">
    	<cfargument name="email_id" type="numeric" required="yes">
    	<cfargument name="person_id" type="numeric" required="yes">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("You do not have permission to modify the primary email address.")>
        
        <!--- SET UP EMAIL BEAN --->
		<cfset emailBean = createObject("component","#application.settings.com#personEmail.personEmail").init(email_id=arguments.email_id)>
        <cfset emailExists = application.com.personEmailDAO.exists(emailBean)>
       	
        <!--- DETERMINE IF THE EMAIL EXISTS --->
        <cfif emailExists>
        	<!--- GET EMAIL INFORMATION --->
        	<cfset emailBean = application.com.personEmailDAO.read(emailBean)>
            
            <!--- DETERMINE IF CURRENT USER HAS PERMISSION TO MODIFY --->
			<cfif listFind("2,3", Session.Account.getAuthorityID()) OR compare(arguments.person_id,emailBean.getPerson_id()) EQ 0>
				<cfset personBean = createObject("component","#application.settings.com#person.person").init(personId=emailBean.getPerson_id())>
                <cfset personExists = application.com.personDAO.exists(personBean)>
                
                <!--- DETERMINE IF THE PERSON EXISTS --->
                <cfif personExists>
                	<!--- GATHER PERSON INFORMATION --->
                    <cfset personBean = application.com.personDAO.read(personBean)>
                    
					<cfset personPrefBean = createObject("component","#application.settings.com#personPref.personPref").init(personId=emailBean.getPerson_id())>
                    <cfset personPrefExists = application.com.personPrefDAO.exists(personPrefBean)>
                    
					<!--- DETERMINE IF A PREFERENCE RECORD EXISTS --->
                    <cfif personPrefExists>
                    	<!--- GATHER PERSON PREFERENCE INFORMATION --->
                        <cfset personPrefBean = application.com.personPrefDAO.read(personPrefBean)>
                    <cfelse>
                    	<!--- FILL PERSON NEW PERSON PREFERENCE RECORD --->
                        <cfset personPrefBean.setEmailSpecialtyFlag("Y")>
                    </cfif>
                    
                    <!--- FILL PERSON RECORDS --->
					<cfset personBean.setEmail(emailBean.getEmail_address())>
                    <cfset personPrefBean.setPrimaryEmailId(emailBean.getEmail_id())>
                    
                    <!--- SAVE PERSON RECORDS --->
                    <cfset personSaved = application.com.personDAO.save(personBean)>
                    <cfset personPrefSaved = application.com.personPrefDAO.save(personPrefBean)>
                    
                    <!--- DETERMINE IF THE PERSON RECORD SAVES WERE SUCCESSFUL --->
                    <cfif personPrefSaved OR isNumeric(personPrefSaved)>
                    	<cfset status.setStatus(true)>
                        <cfset status.setStatusMsg("Primary email address has been updated.")>
                    </cfif>
                </cfif>
            </cfif>
        <cfelse>
        	<cfset status.setStatusMsg("This email is not registered in our database.")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
	
	<cffunction name="setStatus" access="public" output="no" displayname="Set Activity Status" returntype="struct">
		<cfargument name="PersonID" type="numeric" required="yes" />
		<cfargument name="StatusID" type="numeric" required="yes" />
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("You do not have permission to administer this feature.")>
		
		<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=Arguments.PersonID)>
		<cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
        
		<cfset PersonBean.setStatusID(Arguments.StatusID)>
		
		<!--- GET STATUS NAME --->
		<cfset StatusBean = CreateObject("component","#Application.Settings.Com#System.PersonStatus").init(PersonStatusID=Arguments.StatusID)>
		<cfset StatusBean = Application.Com.PersonStatusDAO.Read(StatusBean)>
		
        <cfswitch expression="#Arguments.StatusID#">
        	<cfcase value="1">
						<cfset Application.History.Add(
									HistoryStyleID=87,
									FromPersonID=Session.PersonID,
									ToPersonID=Arguments.PersonID)>
            </cfcase>
        	<cfcase value="2">
						<cfset Application.History.Add(
									HistoryStyleID=88,
									FromPersonID=Session.PersonID,
									ToPersonID=Arguments.PersonID)>
            </cfcase>
        	<cfcase value="3">
						<cfset Application.History.Add(
									HistoryStyleID=89,
									FromPersonID=Session.PersonID,
									ToPersonID=Arguments.PersonID)>
            </cfcase>
        </cfswitch>
		
		<cfset Application.Com.PersonDAO.Update(PersonBean)>
		
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Person Status has been updated!")>
        
        <cfreturn status />
	</cffunction>
    
    <cffunction name="updateCertName" hint="LMS Function // Makes it simple to update certname within a single function." access="public" output="false" returntype="boolean">
    	<cfargument name="CertName" type="string" required="yes">
        
        <cfquery name="qUpdateDisplayName" datasource="#application.settings.dsn#">
        	UPDATE ce_Person
            SET certName = <cfqueryparam value="#arguments.certName#" cfsqltype="cf_sql_varchar" />
            WHERE personId = <cfqueryparam value="#session.personId#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfset session.Person.setCertName(arguments.certName)>
        
        <cfreturn true />
    </cffunction>
</cfcomponent>