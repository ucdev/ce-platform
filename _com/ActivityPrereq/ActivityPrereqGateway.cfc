
<cfcomponent displayname="ActivityPrereqGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityPrereq.ActivityPrereqGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActivityPrereqID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PrereqID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ActivityPrereqID,
				ActivityID,
				PrereqID,
				Created,
				CreatedBy
			FROM	ce_Activity_Prereq
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ActivityPrereqID") and len(arguments.ActivityPrereqID)>
			AND	ActivityPrereqID = <cfqueryparam value="#arguments.ActivityPrereqID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PrereqID") and len(arguments.PrereqID)>
			AND	PrereqID = <cfqueryparam value="#arguments.PrereqID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActivityPrereqID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PrereqID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				AP.ActivityPrereqID,
				AP.ActivityID,
				AP.PrereqID,
                A.Title AS PrereqTitle,
				AP.Created,
				AP.CreatedBy,
                P.FirstName,
                P.LastName
			FROM	ce_Activity_Prereq AP
            INNER JOIN ce_Activity A ON A.ActivityID = AP.PrereqID
            INNER JOIN ce_Person P ON P.PersonID = AP.CreatedBy
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ActivityPrereqID") and len(arguments.ActivityPrereqID)>
			AND	AP.ActivityPrereqID = <cfqueryparam value="#arguments.ActivityPrereqID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	AP.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PrereqID") and len(arguments.PrereqID)>
			AND	AP.PrereqID = <cfqueryparam value="#arguments.PrereqID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	AP.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	AP.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
