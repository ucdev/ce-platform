<cfcomponent displayname="Step Ajax">
	<cffunction name="SetStatus" displayname="Set Step Status" output="no" access="remote">
		<cfargument name="StepID" type="numeric" required="yes" />
		<cfargument name="ActivityID" type="numeric" required="yes" />
		<cfargument name="StepStatusID" type="numeric" required="yes" />
		
		<cfquery name="qSetStatus" datasource="#Application.Settings.DSN#">
			UPDATE ce_ProcessStep_Activity
			SET StepStatusID=<cfqueryparam value="#Arguments.StepStatusID#" cfsqltype="cf_sql_integer" />,Updated=#CreateODBCDateTime(now())#,UpdatedBy=<cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_integer" />
			WHERE
				StepID=<cfqueryparam value="#Arguments.StepID#" cfsqltype="cf_sql_integer" /> AND 
				ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfreturn "success" />
	</cffunction>
	
	<cffunction name="SetDueDate" displayname="Set Step Status" output="no" access="remote">
		<cfargument name="StepID" type="numeric" required="yes" />
		<cfargument name="ActivityID" type="numeric" required="yes" />
		<cfargument name="DueDate" type="string" required="yes" />
		
		<cfquery name="qSetStatus" datasource="#Application.Settings.DSN#">
			UPDATE ce_ProcessStep_Activity
			SET DueDate=<cfqueryparam value="#Arguments.DueDate#" cfsqltype="cf_sql_timestamp" />,Updated=#CreateODBCDateTime(now())#,UpdatedBy=<cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_integer" />
			WHERE
				StepID=<cfqueryparam value="#Arguments.StepID#" cfsqltype="cf_sql_integer" /> AND 
				ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfreturn "success" />
	</cffunction>
	
	<cffunction name="SetAssign" displayname="Set Assigned" output="no" access="remote">
		<cfargument name="StepID" type="numeric" required="yes" />
		<cfargument name="ActivityID" type="numeric" required="yes" />
		<cfargument name="AssignedToID" type="numeric" required="no" default="0" />
		
		<cfquery name="qSetStatus" datasource="#Application.Settings.DSN#">
			UPDATE ce_ProcessStep_Activity
			SET AssignedToID=<cfqueryparam value="#Arguments.AssignedToID#" cfsqltype="cf_sql_integer" />,Updated=#CreateODBCDateTime(now())#,UpdatedBy=<cfqueryparam value="#Session.Person.getPersonID()#" cfsqltype="cf_sql_integer" />
			WHERE
				StepID=<cfqueryparam value="#Arguments.StepID#" cfsqltype="cf_sql_integer" /> AND 
				ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfreturn "success" />
	</cffunction>
</cfcomponent>