<cfcomponent>
	<cffunction name="Add" access="remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="Title" type="string" required="yes">
        
        <cfset var Status = "Fail|Could not attach selection to current activity.">
        
        <!--- CHECK IF ACTIVITY TITLE IS TIED TO AN ACTIVITYID --->
        <cfquery name="PrereqInfo" datasource="#Application.Settings.DSN#">
        	SELECT
            	ActivityID
            FROM
            	ce_Activity
           	WHERE
            	Title = <cfqueryparam value="#Arguments.Title#" cfsqltype="cf_sql_varchar" /> AND DeletedFlag = 'N'
        </cfquery>
        
        <cfif PrereqInfo.RecordCount GT 0>
        	<!--- MAKE SURE ACTIVITYID AND PREREQID ARE NOT THE SAME --->
        	<cfif Arguments.ActivityID EQ PrereqInfo.ActivityID>
            	<cfset Status = "Fail|You cannot make an activity a prerequisite of itself.">
                <cfreturn Status />
                <cfabort>
            </cfif>
        
        	<!--- CHECK IF ACTIVITY IS ALREADY CONNECTED TO CURRENT PREREQUISITE ACTIVITY --->
            <cfquery name="PrereqExists" datasource="#Application.Settings.DSN#">
            	SELECT
                	ActivityPrereqID
                FROM
                	ce_Activity_Prereq
                WHERE
                	ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND PrereqID = <cfqueryparam value="#PrereqInfo.ActivityID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        	
            <cfif PrereqExists.RecordCount EQ 0>
				<!--- CREATE ACTIVITY PREREQUISITE --->
                <cfset PrereqBean = CreateObject("component","#Application.Settings.Com#ActivityPrereq.ActivityPrereq").Init(ActivityPrereqID=0)>
                <cfset PrereqBean.setActivityID(Arguments.ActivityID)>
                <cfset PrereqBean.setPrereqID(PrereqInfo.ActivityID)>
                <cfset PrereqBean.setCreatedBy(Session.Person.getPersonID())>
                <cfset PrereqSaved = Application.Com.ActivityPrereqDAO.Create(PrereqBean)>
                
                <cfif isNumeric(PrereqSaved)>
                	<cfset Status = "Success|The prerequisite has been added.">
                </cfif>
            <cfelse>
            	<cfset Status = "Fail|The prerequisite is already attached to current activity.">
            </cfif>
        <cfelse>
        	<cfset Status = "Fail|The provided title does not match an activity.">
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="Get" hint="Returns a list of prerequisites of prerequisites based on provided activity." access="remote" output="true" returntype="query">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        
        <cfquery name="PrereqList" datasource="#Application.Settings.DSN#">
        	WITH Prereqs (ActivityID, PrereqID, ActivityTitle, PrereqLevel)
            AS
            (
            -- Anchor member definition
                SELECT 
                    AP.ActivityID,
                    AP.PrereqID, 
                    ActivityTitle = A.Title, 
                    PrereqLevel = 0
                FROM ce_Activity_Prereq AP
                INNER JOIN ce_Activity A ON A.ActivityID = AP.PrereqID
                WHERE AP.ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
                UNION ALL
            -- Recursive member definition
                SELECT 
                    AP.ActivityID,
                    AP.PrereqID, 
                    ActivityTitle = A.Title, 
                    P.PrereqLevel + 1
                FROM ce_Activity_Prereq AP
                INNER JOIN ce_Activity A ON A.ActivityID = AP.PrereqID
                INNER JOIN Prereqs P ON P.PrereqID = AP.ActivityID
            )
            -- Statement that executes the CTE
            SELECT ActivityID, PrereqID, ActivityTitle, PrereqLevel
            FROM Prereqs
        </cfquery>
        
        <cfreturn PrereqList />
    </cffunction>
    
	<cffunction name="Remove" access="remote" output="false" returntype="string">
		<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="PrereqID" type="numeric" required="yes">
        
        <cfset var Status = "Fail|Could not remove prerequisite at this time.">
        
        <!--- CHECK IF PREREQUISITE EXISTS --->
        <cfquery name="PrereqInfo" datasource="#Application.Settings.DSN#">
        	SELECT
            	ActivityPrereqID
            FROM
            	ce_Activity_Prereq
            WHERE
            	ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND PrereqID = <cfqueryparam value="#Arguments.PrereqID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        <cfif PrereqInfo.RecordCount GT 0>
        	<!--- DELETE PREREQUISITE --->
        	<cfquery name="DeletePrereq" datasource="#Application.Settings.DSN#">
            	DELETE FROM ce_Activity_Prereq
                WHERE ActivityPrereqID = <cfqueryparam value="#PrereqInfo.ActivityPrereqID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfset Status = "Success|Prerequisite has been removed.">
        <cfelse>
        	<cfset Status = "Fail|The provided prerequisite is not attached to current activity.">
        </cfif>
        
		<cfreturn Status />
	</cffunction>
</cfcomponent>