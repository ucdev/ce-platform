<cfcomponent extends="Controller">
	<cffunction name="Register"  output="false" returntype="string">
		<cfparam name="params.PersonID" type="numeric" required="no" default="0">
        <cfparam name="params.FirstName" type="string" required="yes">
        <cfparam name="params.MiddleName" type="string" required="no" default="">
        <cfparam name="params.LastName" type="string" required="yes">
        <cfparam name="params.DisplayName" type="string" required="no" default="#Arguments.FirstName# #Arguments.LastName#">
        <cfparam name="params.Suffix" type="string" required="no" default="">
        <cfparam name="params.Email1" type="string" required="yes">
        <cfparam name="params.Email2" type="string" required="yes">
        <cfparam name="params.Gender" type="string" required="yes">
        <cfparam name="params.Password1" type="string" required="yes">
        <cfparam name="params.Password2" type="string" required="yes">
        <cfparam name="params.geonameId" type="string" required="no" default="0">
        
        <cfset var Status = "Fail|Cannot access register function for authentication information.">
        
        <!--- CREATE PERSON RECORD --->
        <cfset ProperlyRegistered = Application.Auth.Register(
							PersonID=Arguments.PersonID,
							FirstName=Arguments.FirstName,
							MiddleName=Arguments.MiddleName,
							LastName=Arguments.LastName,
							DisplayName=Arguments.DisplayName,
							Suffix=Arguments.Suffix,
							Email1=Arguments.Email1,
							Gender=Arguments.Gender,
							geonameId=Arguments.geonameId,
							Password1=Arguments.Password1)>
                            
        <cfif ProperlyRegistered>
        	<cfif isDefined("client.lastActivity") AND client.lastActivity NEQ 0>
    	    	<cflocation url="#Application.Settings.RootPath#/activity/#client.lastActivity#" addtoken="no">
            <cfelse>
	        	<cflocation url="#Application.Settings.RootPath#/login?successmessage=Thank you for registering, you should soon receive a validation email to activate your account." addtoken="no">
            </cfif>
        <cfelse>
        	<cflocation url="#Application.Settings.RootPath#/Register.cfm?e=Registration is currently experiencing issues.  Please <a href='#Request.RootPath#/cdc_contact.cfm?type=1'>contact us</a> regarding your issue." addtoken="no">
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="Validate"  output="false" returntype="string">
		<cfparam name="params.PersonID" type="numeric" required="no" default="0">
        <cfparam name="params.FirstName" type="string" required="yes">
        <cfparam name="params.MiddleName" type="string" required="no" default="">
        <cfparam name="params.LastName" type="string" required="yes">
        <cfparam name="params.DisplayName" type="string" required="no" default="#Arguments.FirstName# #Arguments.LastName#">
        <cfparam name="params.Suffix" type="string" required="no" default="">
        <cfparam name="params.Email1" type="string" required="yes">
        <cfparam name="params.Email2" type="string" required="yes">
        <cfparam name="params.Gender" type="string" required="yes">
        <cfparam name="params.Password1" type="string" required="yes">
        <cfparam name="params.Password2" type="string" required="yes">
        <cfparam name="params.geonameId" type="string" required="no" default="0">
        
        <cfdump var="#application.settings#"><cfabort>
        <cfset Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
		<cfcontent type="text/javascript" />
		
        <cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access validate function for authentication information.")>
        
        <cfset Status = Application.Auth.Validate(
							FirstName=Arguments.FirstName,
							MiddleName=Arguments.MiddleName,
							LastName=Arguments.LastName,
							DisplayName=Arguments.DisplayName,
							Suffix=Arguments.Suffix,
							Email1=Arguments.Email1,
							Email2=Arguments.Email2,
							Gender=Arguments.Gender,
							Password1=Arguments.Password1,
							Password2=Arguments.Password2,
							geonameid=Arguments.geonameid)>
    
    	<cfreturn Status.getJSON() />
	</cffunction>
    
    <cffunction name="verifyEmail"  output="false" returntype="string">
    	<cfparam name="params.v" type="string" required="yes">
        <cfparam name="params.k" type="string" required="yes">
        
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
		<!---<cfcontent type="text/javascript" />--->
		
        <cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Cannot access email address validation.")>
        
        <cfset status = application.auth.verifyEmail(arguments.v, arguments.k)>
        
        <cfreturn status.getJSON() />
    </cffunction>
</cfcomponent>