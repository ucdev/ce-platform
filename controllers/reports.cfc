<cfcomponent extends="controller">
	<cffunction name="init">
		<cfset filters(through="ajaxLoginRequired")>
		<cfset filters(through="ajaxAdminRequired")>
	</cffunction>
    
    <cffunction name="CMECert">
    	<cfparam name="params.activityId" type="integer" default="0">
    	<cfparam name="params.selectedAttendees" type="string" default="">
    	<cfparam name="params.SelectedMembers" type="string" default="">
        
    	<cfset reportData = model("Sys_Report").getCMECertDataFor(activityId=params.activityId,selectedAttendees=params.selectedAttendees,selectedMembers=params.selectedMembers)>
        <cfset reportInfo = model('Sys_Report').findByKey(5)>
        
		<cfset renderpage(template="reportGen") />
    </cffunction>
</cfcomponent>