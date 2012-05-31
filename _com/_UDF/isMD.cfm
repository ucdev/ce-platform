<cffunction name="isMD" access="public" displayname="Is MD" output="no" returntype="boolean">
	<cfargument name="AttendeeId" type="numeric" required="false" default="0">
	<cfargument name="PersonID" type="numeric" required="false" default="0">
	
	<cfset var MDstatus = false>
    
    <cfif arguments.personId GT 0>
        <cfquery name="qPersonDegree" datasource="#Application.Settings.DSN#">
            SELECT PersonDegreeID 
            FROM ce_Person_Degree pd
            INNER JOIN ce_Sys_Degree sd ON sd.DegreeID = pd.DegreeID
            WHERE 	PersonID=<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND
                    sd.Name IN ('MD','DO')
        </cfquery>
        
        <cfif qPersonDegree.RecordCount GT 0>
            <cfset MDstatus = true>
        </cfif>
    <cfelse>
        <cfset AttendeeBean = CreateObject("component","#Application.Settings.Com#Attendee.Attendee").init(attendeeId=Arguments.attendeeId)>
        <cfset AttendeeBean = Application.Com.AttendeeDAO.read(AttendeeBean)>
        
        <cfif attendeeBean.getMDFlag() EQ "Y">
        	<cfset MDstatus = true>
        </cfif>
    </cfif>
	
	<cfreturn MDstatus />
</cffunction>