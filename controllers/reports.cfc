<cfcomponent extends="controller">
	<cffunction name="init">
		<cfset filters(through="ajaxLoginRequired")>
		<cfset filters(through="ajaxAdminRequired")>
	</cffunction>
    
    <cffunction name="CMECert">
        <cfparam name="params.selectedAttendees" type="string" default="">
        
        <cfset reportData = model("Sys_Report").getCMECertDataFor(selectedAttendees=params.selectedAttendees)>
        <cfset reportInfo = model('Sys_Report').findByKey(5)>
        
        <cfset renderpage(template="reportGen") />
    </cffunction>
    
    <cffunction name="CNECert">
        <cfparam name="params.selectedAttendees" type="string" default="">
        
        <cfset reportData = model("Sys_Report").getCNECertDataFor(selectedAttendees=params.selectedAttendees)>
        <cfset reportInfo = model('Sys_Report').findByKey(6)>
        
        <cfset renderpage(template="reportGen") />
    </cffunction>
</cfcomponent>