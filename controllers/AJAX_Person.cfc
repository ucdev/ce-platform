<cfcomponent>
	<cffunction name="deleteEmail" access="remote" output="false" returnFormat="plain">
    	<cfargument name="email_id" type="numeric" required="yes">
        <cfargument name="person_id" type="numeric" required="yes">
        
        <cfset var Status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete email address for unknown reasons.")>
        
        <cfset status = Application.Person.deleteEmail(Arguments.email_id,Arguments.person_id)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
    <cffunction name="emailExists" hint="Determines if a provided email exists in the database." access="remote" output="false" returntype="string">
    	<cfargument name="email_address" type="string" required="yes">
        
        <cfset var status = application.person.emailExists(arguments.email_address)>
        
        <cfreturn status.getJSON() />
    </cffunction>
    
	<cffunction name="requestPassword" access="remote" returntype="string">
    	<cfargument name="Email" type="string" required="yes">
        
        <cfset var status = Application.Person.requestPassword(Arguments.Email)>
        
        <cfif status.getStatus()>
        	<cflocation url="#Request.Myself#Main.ForgotPW?Message=#status.getStatusMsg()#" addtoken="no">
        <cfelse>
        	<cflocation url="#Request.Myself#Main.ForgotPW?Error=#status.getStatusMsg()#" addtoken="no">
        </cfif>
    </cffunction>
    
    <cffunction name="sendVerificationEmail" hint="Sends an email to verify email address." access="remote" output="false" returntype="string">
    	<cfargument name="email_id" type="numeric" required="yes">
        
        <cfset var status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfcontent type="text/javascript" />
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot access send verification email function.")>
        
        <cfset Status = Application.Person.sendVerificationEmail(Arguments.email_id)>
        
        <cfreturn status.getJSON() />
    </cffunction>
</cfcomponent>