<cfcomponent displayname="GroupingGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.System.GroupingGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="GroupingID" type="numeric" required="false" />
		<cfargument name="ActivityTypeID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				GroupingID,
				ActivityTypeID,
				Name,
				Created
			FROM	ce_Sys_Grouping
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"GroupingID") and len(arguments.GroupingID)>
			AND	GroupingID = <cfqueryparam value="#arguments.GroupingID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityTypeID") and len(arguments.ActivityTypeID)>
			AND	ActivityTypeID = <cfqueryparam value="#arguments.ActivityTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
