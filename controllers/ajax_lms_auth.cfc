<cfcomponent extends="Controller">
	<cffunction name="Register" output="false">
		<cfparam name="params.person.id" type="numeric" default="0">
        <cfparam name="params.person.firstName" type="string">
        <cfparam name="params.person.middleName" type="string" default="">
        <cfparam name="params.person.lastName" type="string">
        <cfparam name="params.person.displayName" type="string" default="#params.person.firstName# #params.person.lastName#">
        <cfparam name="params.person.suffix" type="string" default="">
        <cfparam name="params.person.email" type="string">
        <cfparam name="params.person.emailConfirm" type="string">
        <cfparam name="params.person.gender" type="string">
        <cfparam name="params.person.password" type="string">
        <cfparam name="params.person.passwordConfirmation" type="string">
        <cfparam name="params.person.geonameId" type="string" default="0">
        
        <cfset var Status = "Fail|Cannot access register function for authentication information.">
        
        <!--- CREATE PERSON RECORD --->
        <cfset ProperlyRegistered = Application.Auth.Register(
							PersonID=params.person.id,
							FirstName=params.person.firstName,
							MiddleName=params.person.middleName,
							LastName=params.person.lastName,
							DisplayName=params.person.displayName,
							Suffix=params.person.suffix,
							Email1=params.person.email,
							Gender=params.person.gender,
							geonameId=params.person.geonameId,
							Password1=params.person.password)>
                            
        <cfif ProperlyRegistered>
        	<cfif isDefined("client.lastActivity") AND client.lastActivity NEQ 0>
    	    	<cflocation url="/activity/#client.lastActivity#" addtoken="no">
            <cfelse>
	        	<cflocation url="/login?successmessage=Thank you for registering, you should soon receive a validation email to activate your account." addtoken="no">
            </cfif>
        <cfelse>
        	<cflocation url="/register?e=Registration is currently experiencing issues.  Please <a href='#Request.RootPath#/cdc_contact.cfm?type=1'>contact us</a> regarding your issue." addtoken="no">
        </cfif>
        
        <cfset renderText(Status) />
    </cffunction>
    
	<cffunction name="Validate"  output="false">
		<cfparam name="params.PersonID" type="numeric"  default="0">
        <cfparam name="params.FirstName" type="string" >
        <cfparam name="params.MiddleName" type="string"  default="">
        <cfparam name="params.LastName" type="string" >
        <cfparam name="params.DisplayName" type="string"  default="#params.FirstName# #params.LastName#">
        <cfparam name="params.Suffix" type="string"  default="">
        <cfparam name="params.Email1" type="string" >
        <cfparam name="params.Email2" type="string" >
        <cfparam name="params.Gender" type="string" >
        <cfparam name="params.Password1" type="string" >
        <cfparam name="params.Password2" type="string" >
        <cfparam name="params.geonameId" type="string"  default="0">
        
        <cfset Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
		<cfcontent type="text/javascript" />
		
        <cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access validate function for authentication information.")>
        
        <cfset Status = Application.Auth.Validate(
							FirstName=params.FirstName,
							MiddleName=params.MiddleName,
							LastName=params.LastName,
							DisplayName=params.DisplayName,
							Suffix=params.Suffix,
							Email1=params.Email1,
							Email2=params.Email2,
							Gender=params.Gender,
							Password1=params.Password1,
							Password2=params.Password2,
							geonameid=params.geonameid)>
    
    	<cfset renderText(Status.getJSON()) />
	</cffunction>
    
    <cffunction name="verifyEmail"  output="false">
    	<cfparam name="params.v" type="string" >
        <cfparam name="params.k" type="string" >
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
		<!---<cfcontent type="text/javascript" />--->
		
        <cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access email address validation.")>
        
        <cfset status = application.auth.verifyEmail(params.v, params.k)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
</cfcomponent>