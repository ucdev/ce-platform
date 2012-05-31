<cfcomponent>
	<cffunction name="Run" hint="Checks if provided activity's attendees have a RegisterDate" access="remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
    	
        <cfset var Status = "0 attendee records affected">
        
		<cfquery name="AttendeeList" datasource="#Application.Settings.DSN#">
        	SELECT AttendeeID, CheckIn
            FROM ce_Attendee
            WHERE  ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N' AND RegisterDate IS NULL
        </cfquery>
        
        <cfif AttendeeList.RecordCount GT 0>
            <cfloop query="AttendeeList">
            	<cfset UpdateRegisterDate(AttendeeList.AttendeeID,AttendeeList.CheckIn)>
            </cfloop>
            
            <cfset Status = AttendeeList.RecordCount & " attendee records affected">
        </cfif>
        
        <cfreturn Status />
	</cffunction>
    
    <cffunction name="UpdateRegisterDate" hint="Updates the RegisterDate field with CheckIn" access="private" output="false">
    	<cfargument name="AttendeeID" type="numeric" required="yes">
        <cfargument name="CheckInDate" type="date" required="yes">
        
        <cfquery name="UpdateAttendee" datasource="#Application.Settings.DSN#">
        	UPDATE ce_Attendee
            SET RegisterDate = <cfqueryparam value="#Arguments.CheckInDate#" cfsqltype="cf_sql_timestamp" />
            WHERE AttendeeID = <cfqueryparam value="#Arguments.AttendeeID#" cfsqltype="cf_sql_integer" />
        </cfquery>
    </cffunction>
</cfcomponent>