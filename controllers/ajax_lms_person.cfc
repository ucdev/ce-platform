<cfcomponent extends="controller">
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
    
    <cffunction name="emailExists" hint="Determines if a provided email exists in the database."  output="false">
    	<cfparam name="params.email_address" type="string" >
        
        <cfset var status = application.person.emailExists(params.email_address)>
        
        <cfset renderText(status.getJSON()) />
    </cffunction>
    
	<cffunction name="requestPassword" >
    	<cfparam name="params.Email" type="string" >
        
        <cfset var status = Application.Person.requestPassword(params.Email)>
        
        <cfif status.getStatus()>
        	<cflocation url="#Request.Myself#Main.ForgotPW?Message=#status.getStatusMsg()#" addtoken="no">
        <cfelse>
        	<cflocation url="#Request.Myself#Main.ForgotPW?Error=#status.getStatusMsg()#" addtoken="no">
        </cfif>
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
</cfcomponent>