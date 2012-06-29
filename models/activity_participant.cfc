<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Attendee")>
        <cfset property(name="id", column="AttendeeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
    
    <cffunction name="searchActivity">
    	<cfargument name="id" type="numeric" required="yes">
        <cfargument name="q" type="array" required="yes">
        
        <cfquery name="qAttendees" datasource="#get('dataSourceName')#">
        	SELECT att.*,
                    isNull(p.lastname,'') + ', ' + isNull(p.FirstName,'') As FullName,
            		CASE p.deletedFlag
                    	WHEN 'N' THEN 'false'
                        WHEN 'Y' THEN 'true'
                    END AS personDeleted,
					ats.Name AS StatusName
            FROM ce_attendee AS att
            INNER JOIN 
            	ce_person AS p ON p.personId = att.personId
        	LEFT OUTER JOIN 
				ce_Sys_AttendeeStatus ats ON ats.AttendeeStatusID = att.StatusID
            WHERE 
            	att.activityId = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" /> AND
                att.deletedFlag = 'N' AND
                (
                	(
                        <cfloop from="1" to="#arrayLen(arguments.q)#" index="curr">
                        p.firstName LIKE <cfqueryparam value="#arguments.q[curr]#%" cfsqltype="cf_sql_varchar" /> <cfif curr NEQ arrayLen(arguments.q)> OR</cfif>
                        </cfloop>
                    ) OR (
                        <cfloop from="1" to="#arrayLen(arguments.q)#" index="curr">
                        p.lastName LIKE <cfqueryparam value="#arguments.q[curr]#%" cfsqltype="cf_sql_varchar" /> <cfif curr NEQ arrayLen(arguments.q)> OR</cfif>
                        </cfloop>
                    )
                )
        </cfquery>
        
        <cfreturn qAttendees />
    </cffunction>
</cfcomponent>
