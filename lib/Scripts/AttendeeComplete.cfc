<cfcomponent>
	<cffunction name="Run" hint="Check if there are attendees that have completed everything but, are not marked complete." access="remote" returntype="string">
		<cfargument name="ActivityID" type="numeric" required="yes">
        
		<cfset var Status = "0 attendee records affected">
        
        <cfquery name="AttendeeList" datasource="#Application.Settings.DSN#">
        	SELECT AttendeeID, PersonID
            FROM ce_Attendee
            WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND StatusID = 1 AND CompleteDate IS NULL AND DeletedFlag = 'N'
        </cfquery>
        
        <cfif AttendeeList.RecordCount GT 0>
        	<cfloop query="AttendeeList">
	        	<cfset updateCompleteDate(Arguments.ActivityID, AttendeeList.AttendeeID, AttendeeList.PersonID)>
            </cfloop>
            
            <cfset Status = AttendeeList.RecordCount & " attendee records affected">
        </cfif>
        
		<cfreturn Status />
	</cffunction>
    
    <cffunction name="UpdateCompleteDate" hint="Updates RegisterDate for provided attendee." access="private" output="false">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="AttendeeID" type="numeric" required="yes">
    	<cfargument name="PersonID" type="numeric" required="yes">
        
    	<cfquery name="ComponentList" datasource="#Application.Settings.DSN#">
        	SELECT APC.AssessmentID, AR.ResultStatusID, AR.Created
            FROM ce_Activity_PubComponent APC
            INNER JOIN ce_AssessResult AR ON AR.AssessmentID = APC.AssessmentID AND AR.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
            WHERE APC.DeletedFlag = 'N' AND AR.DeletedFlag = 'N'
        </cfquery>
        
        <cfif ComponentList.RecordCount GT 0>
        	<cfif ComponentList.ResultStatusID EQ 1>
                <cfquery name="updateAttendee" datasource="#Application.Settings.DSN#">
                    UPDATE ce_Attendee
                    SET CompleteDate = <cfqueryparam value="#ComponentList.Created#" cfsqltype="cf_sql_timestamp" />
                    WHERE AttendeeID = <cfqueryparam value="#Arguments.AttendeeID#" cfsqltype="cf_sql_integer" />
                </cfquery>
            </cfif>
        </cfif>
    </cffunction>
</cfcomponent>