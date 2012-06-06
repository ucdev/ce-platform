<cfcomponent>
	<cfinclude template="/_com/_UDF/isEmail.cfm" />
    
	<cffunction name="init" access="public" output="no" returntype="_com.Public_Auth">
		<cfreturn this />
	</cffunction>
    
    <cffunction name="confirmCredentials" access="public" output="false" returntype="struct">
    	<cfargument name="personId" type="numeric" required="no" default="0">
        <cfargument name="email" type="string" required="no" default="">
        <cfargument name="password" type="string" required="no" default="">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("More information is needed to confirm  your credentials.")>
        
        <!--- ERROR CHECK --->
        <cfif len(trim(arguments.email)) EQ 0>
        	<cfset status.addError("email", "You must provide a verified email address.")>
        </cfif>
        
        <cfif len(trim(arguments.password)) EQ 0>
        	<cfset status.addError("password", "You must enter your password")>
        </cfif>
        
        <!--- DETERMINE IF ANY ERRORS WERE REPORTED --->
        <cfif arrayLen(status.getErrors()) EQ 0>
        	<!--- DETERMINE IF PROVIDED EMAIL IS A VERIFIED EMAIL AND ATTACHED TO THE PROVIDED PERSON --->
        	<cfset emailInfo = application.com.personEmailGateway.getByAttributesQuery(email_address=arguments.email, person_id=arguments.personId, is_verified=1, allow_login=1)>
            
            <cfif emailInfo.recordCount GT 0>
            	<!--- DECLARE PERSON BEAN --->
            	<cfset personBean = createObject("component","#application.settings.com#person.person").init(personId=arguments.personId)>
                <cfset personExists = application.com.personDAO.exists(personBean)>
                
                <!--- DETERMINE IF PRODIVDED PERSON EXISTS --->
                <cfif personExists>
                	<!--- GATHER PERSON INFO --->
					<cfset personBean = application.com.personDAO.read(personBean)>
                    
                    <!--- DETERMINE IF THE PROVIDED PERSON IS DELETED --->
                    <cfif personBean.getDeletedFlag NEQ "Y">
						<!---- DETERMINE IF THE PASSWORD IS VALID --->
                        <cfif personBean.getPassword() EQ arguments.password>
                            <!--- CREDENTIALS ARE CONFIRMED --->
                            <cfset status.setStatus(true)>
                            <cfset status.setStatusMsg("Email and Password are valid.")>
                        <cfelse>
                            <!--- INVALID PASSWORD --->
                            <cfset status.setStatusMsg("Invalid Email/Password Combination")>
                        </cfif>
                    <cfelse>
                    	<!--- PERSON ID DELETED --->
                        <cfset status.setStatusMsg("Invalid Email/Password Combination")>
                    </cfif>
                <cfelse>
                	<!--- PERSOSN DOES NOT EXIST --->
	            	<cfset status.setStatusMsg("Invalid Email/Password Combination")>
                </cfif>
            <cfelse>
            	<!--- EMAIL DOES NOT EXIST FOR PROVIDED PERSON --->
            	<cfset status.setStatusMsg("Invalid Email/Password Combination")>
            </cfif>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
    <cffunction name="createAccount" access="Private" output="no" returntype="numeric">
    	<cfargument name="PersonID" type="numeric" required="yes">
        
        <cfquery name="CreateSession" datasource="#Application.Settings.DSN#" result="CreateResult">
        	INSERT INTO ce_Account 
            	(
            		PersonID,
                    AuthorityID,
                    Created,
                    DeletedFlag
                )
            VALUES
	            (
            		<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />,
                    <cfqueryparam value="1" cfsqltype="cf_sql_integer" />,
                    <cfqueryparam value="#Now()#" cfsqltype="cf_sql_timestamp" />,
                    <cfqueryparam value="N" cfsqltype="cf_sql_char" />
                )
        </cfquery>
        
        <cfreturn CreateResult.IDENTITYCOL />
    </cffunction>
    
    <cffunction name="createSessions" access="Public" output="false">
    	<cfargument name="AccountID" type="numeric" required="yes">
    	<cfargument name="PersonID" type="numeric" required="yes">
        
		<cfset Session.LoggedIn = true>
        
		<cfif NOT isDefined("Session.Person")>
            <cfset Session.Person = CreateObject("component", "#Application.Settings.Com#Person.Person").Init()>
        </cfif>
        
        <cfif NOT isDefined("Session.Account")>
            <cfset Session.Account = CreateObject("component", "#Application.Settings.Com#Account.Account").Init()>
        </cfif>
        
        <cfset Session.Account.setAccountID(Arguments.AccountID)>
        <cfset Session.Account = Application.Com.AccountDAO.Read(Session.Account)>
        <cfset Session.Person.setPersonID(Arguments.PersonID)>
        <cfset Session.Person = Application.Com.PersonDAO.Read(Session.Person)>
        <cfset session.currentuser.id = session.currentuser.id>
        <cfset Session.AccountID = Session.Account.getAccountID()>
        
        <cfcookie name="Person.FirstName" value="#session.currentuser.FirstName#">
        <cfcookie name="Account.UserName" value="#session.currentuser.Email#">
    </cffunction>
    
    <cffunction name="doLogin" access="Public" output="false">
    	<cfargument name="Email" type="string" required="no" default="">
        <cfargument name="Password" type="string" required="no" default="">
        <cfargument name="PersonID" type="numeric" required="no" default="0">
        <cfargument name="RememberMe" type="string" required="no" default="N">
        
        <cfset var ReturnVar = false>
        <cfset var CurrEmail = "">
        <cfset var CurrPassword = "">
        
        <!--- CHECK IF THE CLIENT USED REMEMBER ME FUNCTIONALITY // PERSONID IS STORED --->
        <cfif Arguments.PersonID EQ 0>
        	<!--- ERROR CHECK FOR CLIENTS WHO DID NOT USE REMEMBER ME --->
			<cfif Arguments.Email EQ "">
                <cfreturn false />
                <cfabort>
            </cfif>
            
            <cfif Arguments.Password EQ "">
                <cfreturn false />
                <cfabort>
            </cfif>
            
            <cfset CurrEmail = Arguments.Email>
            <cfset CurrPassword = Arguments.Password>
        <cfelse>
        	<!--- GET PERSONINFO FOR CLIENTS WHO USE REMEMBER ME TECHNOLOGY --->
        	<cfquery name="LoginInfo" datasource="#Application.Settings.DSN#">
            	SELECT 
                	Email, Password
                FROM 
                	ce_Person
                WHERE 
                	PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND
                    DeletedFlag = 'N'
            </cfquery>
            
            <cfif LoginInfo.RecordCount GT 0>
				<cfset CurrEmail = LoginInfo.Email>
                <cfset CurrPassword = LoginInfo.Password>
			<cfelse>
            	<cfreturn false />
            </cfif>
        </cfif>
        
        <cfquery name="LoginCheck" datasource="#Application.Settings.DSN#">
            DECLARE @Email nvarchar(255)
            DECLARE @Password nvarchar(255)
            
            SET @Email=<cfqueryparam value="#CurrEmail#" cfsqltype="cf_sql_varchar" />
            SET @Password=<cfqueryparam value="#CurrPassword#" cfsqltype="cf_sql_varchar" />
            
            SELECT
                P.PersonID, A.AccountID, PE.Email_ADDRESS
            FROM
                ce_Person_Email PE
            INNER JOIN
            	ce_Person AS P ON P.PERSONID = PE.PERSON_ID
            LEFT OUTER JOIN
                ce_Account AS A ON A.PersonID = P.PersonID
            WHERE
                PE.Email_ADDRESS = @Email AND
                PE.IS_VERIFIED = 1 AND
                PE.ALLOW_LOGIN = 1 AND
                P.Password COLLATE SQL_Latin1_General_CP1_CS_AS = @Password AND
                P.DeletedFlag = 'N'
        </cfquery>
        
        <cfif LoginCheck.RecordCount GT 0>
			<!--- CHECK IF ACCOUNTID IS BLANK --->
            <cfif LoginCheck.AccountID EQ "">
            	<!--- CREATES ce_Account RECORD // REQUIRED FOR UNIFORM FUNCTIONALITY OF APPLICATIONS --->
                <cfset LoginCheck.AccountID = createAccount(LoginCheck.PersonID)>
            </cfif>
			
            <cfif Arguments.RememberMe EQ "Y">
	        	<cfset Client.Login = LoginCheck.PersonID>
            </cfif>
            
        	<cfset createSessions(LoginCheck.AccountID, LoginCheck.PersonID)>
            <cfset ReturnVar = true>
        </cfif>
        
        <cfreturn ReturnVar />
    </cffunction>
    
    <cffunction name="doLogout" access="Public" output="false">
		<cfset StructClear(Session)>
        <cfset StructDelete(client,"Login")>
    </cffunction>
    
    <cffunction name="emailExists" hint="Used for the forgot password functionality." access="public" output="no" returntype="boolean">
    	<cfargument name="email" type="string" required="yes">
    	<cfargument name="personId" type="string" required="no" default="0">
        
        <cfset var status = false>
        <cfset var currEmail = arguments.email>
        
        <cfif ListLen(getToken(currEmail,2,"@"),".") GT 2>
        	<cfset currEmail = application.person.emailConvert(currEmail)>
        </cfif>
        
        <cfquery name="personInfo" datasource="#application.settings.dsn#">
        	DECLARE @Email nvarchar(255)
            
            SET @Email = <cfqueryparam value="#CurrEmail#" cfsqltype="cf_sql_varchar" />
            
        	SELECT 
            	CASE
                	WHEN pe.person_ID IS NOT NULL THEN pe.person_id
                    WHEN p.personId IS NOT NULL THEN p.personId
                END AS personId
            FROM  ce_person AS p
            LEFT JOIN ce_person_email AS pe ON pe.person_id = p.personId
            WHERE
            	ceschema.cleanEmailDomain(p.email) = @Email
				AND p.deletedFlag='N'
                OR
            	ceschema.cleanEmailDomain(pe.email_address) = @Email
				AND p.deletedFlag='N'
        </cfquery>
        
        <cfif personInfo.recordCount GT 0>
        	<cfif arguments.personId GT 0 AND personInfo.personId NEQ arguments.personId>
        		<cfset Status = true>
            <cfelseif arguments.personId EQ 0>
        		<cfset Status = true>
            </cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="Register" access="Public" output="false" returntype="string">
		<cfargument name="PersonID" type="numeric" required="no" default="0">
        <cfargument name="Birthdate" type="string" required="no" default="">
        <cfargument name="FirstName" type="string" required="yes">
        <cfargument name="MiddleName" type="string" required="yes">
        <cfargument name="LastName" type="string" required="yes">
        <cfargument name="DisplayName" type="string" required="yes">
        <cfargument name="Suffix" type="string" required="yes">
        <cfargument name="Email1" type="string" required="yes">
        <cfargument name="Gender" type="string" required="yes">
        <cfargument name="Password1" type="string" required="yes">
        <cfargument name="geonameId" type="string" required="no" default="0">
        <cfargument name="SiteId" type="numeric" required="no" default="0">
        
        <cfset var Status = false>
        <cfset var CurrentPersonID = Arguments.PersonID>
        <cfset var CurrentAccountID = 0>
        
		<!--- Create Person Bean --->
        <cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").Init(PersonID=CurrentPersonID)>
        
        <!--- Fills the Bean with values from Person Edit form --->
        <cfset PersonBean.setFirstName(UCase(LEFT(Arguments.FirstName,1)) & LCase(Right(Arguments.FirstName,LEN(Arguments.FirstName)-1)))> 
        <cfset PersonBean.setMiddleName(Arguments.MiddleName)> 
        
    	<cfset tempVar = arguments.LastName>
        <cfset tempLastName = "">
        
        <cfif listLen(tempVar, "-") GT 1>
        	<cfloop list="#tempVar#" delimiters="-" index="namePart">
            	<cfset tempNamePart = UCase(LEFT(namePart, 1)) & LCase(RIGHT(namePart, Len(namePart)-1))>
                <cfset tempLastName = ListAppend(tempLastName, tempNamePart, "-")>
            </cfloop>
        <cfelse>
        	<cfset tempLastName = tempVar>
        </cfif>
        
        <cfset PersonBean.setLastName(tempLastName)> 
        <cfset PersonBean.setSuffix(Arguments.Suffix)> 
        <cfset PersonBean.setDisplayName(Arguments.DisplayName)>
        <cfset PersonBean.setCertName(Arguments.DisplayName)>
        <cfset PersonBean.setEmail(Arguments.Email1)>
        <cfset PersonBean.setGender(Arguments.Gender)>
        
        <cfif arguments.SiteId EQ 4>
        	<cfset Personbean.setBirthdate(arguments.Birthdate)>
        </cfif>
        
        <cfif CurrentPersonID EQ 0>
            <cfif Arguments.Password1 NEQ "">
                <cfset PersonBean.setPassword(Arguments.Password1)>
            <cfelse>
                <cfset PersonBean.setPassword(Application.UDF.getRandomString())>
            </cfif>
            
            <cfset PersonBean.setCreated(Now())>
        </cfif>
    
        <!--- Submits the Bean for data saving --->
        <cfset NewPersonID = Application.Com.PersonDAO.Save(PersonBean)>
        
		<cfif isNumeric(NewPersonID)>
            <cfset CurrentPersonID = NewPersonID>
            
            <cfset PersonBean.setCreatedBy(CurrentPersonID)>
            
            <cfset Application.Com.PersonDAO.Update(PersonBean)>
            
			<!--- SAVE ADDRESS RECORD --->
			<cfset personAddress = application.person.saveAddress(
				AddressID=0,
				PersonID=CurrentPersonID,
				AddressTypeID=1,
				PrimaryFlag="Y",
				Address1="",
				Address2="",
				City="",
				State="",
				Province="",
				Country="",
				geonameid=arguments.geonameId,
				Zipcode=""
			) />
			
            <!--- SAVE PERSON EMAIL RECORD --->
            <cfset emailSaved = application.person.saveEmail(
															email_id=0,
															person_id=currentPersonId,
															email_address=Arguments.Email1,
															is_primary=1)>
                
			<!--- DETERMINE IF THE EMAIL INFORMATION PROPERLY SAVED --->
            <cfif emailSaved.getStatus()>
                <!--- GET THE EMAILBEAN FROM THE RETURN PAYLOAD --->
                <cfset emailBean = emailSaved.getPayload()>
            
                <!--- SEND VERIFICATION EMAIL  --->
                <cfset application.email.send(EmailStyleID=6, toEmailId=emailBean.getEmail_id(), toPersonId=currentPersonId)>
            </cfif>

        	<!--- SEND REGISTRATION EMAIL --->
            <cfset Application.Email.Send(ToPersonID=CurrentPersonID, EmailStyleID=2)>
            
            <cfset AccountBean = CreateObject("component", "#Application.Settings.Com#Account.Account").Init(AccountID=0)>
            <cfset AccountBean.setPersonID(CurrentPersonID)>
            <cfset AccountBean.setAuthorityID(1)>
            <cfset AccountBean.setCreated(Now())>
            <cfset AccountBean.setDeletedFlag("N")>
            
            <cfset CurrentAccountID = Application.Com.AccountDAO.Create(AccountBean)>
            
            <cfif Arguments.SiteID GT 0>
				<cfset Application.History.Add(
                    HistoryStyleID=109,
                    FromPersonID=CurrentPersonID,
                    ToPersonID=CurrentPersonID,
					ToSiteID=Arguments.SiteID
                )>
            <cfelse>
				<cfset Application.History.Add(
                    HistoryStyleID=109,
                    FromPersonID=CurrentPersonID,
                    ToPersonID=CurrentPersonID
                )>
            </cfif>
            
            <cfset Status = true>
            <!---<cfset createSessions(CurrentAccountID, CurrentPersonID)>--->
        </cfif>
    
        <cfreturn Status />
	</cffunction>
    
    <cffunction name="Validate" access="Public" output="false" returntype="struct">
        <cfargument name="Birthdate" type="string" required="no">
        <cfargument name="FirstName" type="string" required="yes">
        <cfargument name="MiddleName" type="string" required="yes">
        <cfargument name="LastName" type="string" required="yes">
        <cfargument name="DisplayName" type="string" required="yes">
        <cfargument name="Suffix" type="string" required="yes">
        <cfargument name="Email1" type="string" required="yes">
        <cfargument name="Email2" type="string" required="yes">
        <cfargument name="Gender" type="string" required="yes">
        <cfargument name="Password1" type="string" required="yes">
        <cfargument name="Password2" type="string" required="yes">
        <cfargument name="SiteId" type="numeric" required="no" default="0">
        <cfargument name="geonameId" type="numeric" required="no" default="0">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
		<cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save credential information due to unknown reasons.")>
        
        <cfif Trim(Arguments.geonameId) EQ 0>
        	<cfset status.addError("geonameid", "You must select a City / State.")>
        </cfif>
		
        <cfif Trim(Arguments.FirstName) EQ "">
        	<cfset status.addError("firstName", "You must enter your First Name.")>
        </cfif>
        
        <cfif Trim(Arguments.LastName) EQ "">
        	<cfset status.addError("lastName", "You must enter your Last Name.")>
        </cfif>
        
        <cfif Trim(Arguments.Email1) EQ "" OR Trim(arguments.Email1) NEQ "" AND NOT isEmail(Trim(arguments.Email1))>
        	<cfset status.addError("email", "You must enter a valid Email Address.")>
        </cfif>
        
        <cfif Trim(arguments.Email1) NEQ Trim(arguments.Email2)>
        	<cfset status.addError("email:emailConfirm", "Your Email Address and Retyped Email Address do not match.")>
        </cfif>
        
        <cfif Trim(arguments.Email1) EQ Trim(arguments.Email2) AND Trim(arguments.Email1) NEQ "" AND this.emailExists(Trim(arguments.Email1))>
        	<cfset status.addError("email:emailConfirm", "Your Email Address already exists in our database.")>
        </cfif>
        
        <cfif Trim(arguments.Password1) NEQ "">
			<cfif Len(Trim(arguments.Password1)) LT 6>
        		<cfset status.addError("password", "Your Password must be at least 6 characters in length.")>
			<cfelseif Compare(Trim(arguments.Password1),Trim(arguments.Password2)) NEQ 0>		
				<cfset status.addError("password:passwordConfirmation", "Your Password and Retyped Password do not match.")>
			</cfif>
		</cfif>
        
        <cfif Trim(arguments.SiteId) EQ 4>
        	<cfif Trim(arguments.Birthdate) EQ "">
            	<cfset status.addError("birthdate","You must provide a birthdate.")>
            </cfif>
        </cfif>
        
        <cfif Trim(arguments.DisplayName) EQ "">
        	<cfset status.addError("displayname", "You must select a Display Name or enter a custom one.")>
        </cfif>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
        	<cfset status.setStatus(true)>
        </cfif>
        
   		<cfreturn status />
    </cffunction>
    
    <cffunction name="verifyEmail" access="public" output="false" returntype="struct">
    	<cfargument name="v" type="string" required="yes">
        <cfargument name="k" type="string" required="yes">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
		
        <cfset status.setStatus(false)>
		<cfset status.setStatusMsg("<h2>Cannot validate email address due to unknown reasons.</h2>")>
        
        <cfif len(trim(arguments.v)) GT 0 AND len(trim(arguments.k)) GT 0>
        	<cfquery name="qFindEmail" datasource="#application.settings.dsn#">
            	SELECT
                	email_id
                FROM
                	ce_person_email
                WHERE
                	email_address = <cfqueryparam value="#arguments.k#" cfsqltype="cf_sql_varchar" /> AND
                    verification_key = <cfqueryparam value="#arguments.v#" cfsqltype="cf_sql_varchar" />
            </cfquery>
            
            <cfif qFindEmail.recordCount GT 0>
            	<cfset emailBean = createObject("component", "#application.settings.com#personEmail.personEmail").init(email_id=qFindEmail.email_id)>
                <cfset emailBean = application.com.personEmailDAO.read(emailBean)>
                
                <cfset emailBean.setIs_verified(1)>
                <cfset emailBean.setAllow_login(1)>
                <cfset emailBean.setVerification_key('')>
                <cfset emailSaved = application.com.personEmailDAO.save(emailBean)>
                
                <cfif emailSaved>
                	<cfset status.setStatus(true)>
                    <cfset status.setStatusMsg("<h2><strong>" & arguments.k & "</strong> has been verified, thank you.</h2><p><a href='" & application.settings.rootPath & "/login'>Click here</a> to login OR <a href='" & application.settings.rootPath & "/browse'>click here</a> to browse activities.</p>")>
                </cfif>
            <cfelse>
            	<cfset status.setStatusMsg("<h2>The provided information is invalid.</h2>")>
            </cfif>
        <cfelse>
        	<cfset status.setStatusMsg("<h2>More information is needed to verify an email address.</h2>")>
        </cfif>
        
        <cfreturn status />
    </cffunction>
</cfcomponent>