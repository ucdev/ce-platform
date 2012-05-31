<cfcomponent displayname="HistoryGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.History.HistoryGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="HistoryID" type="numeric" required="false" />
		<cfargument name="HistoryStyleID" type="numeric" required="false" />
		<cfargument name="HistoryHTML" type="string" required="false" />
		<cfargument name="FromPersonID" type="numeric" required="false" />
		<cfargument name="ToPersonID" type="numeric" required="false" />
		<cfargument name="ToActivityID" type="numeric" required="false" />
		<cfargument name="ToHistoryID" type="numeric" required="false" />
		<cfargument name="ToSiteID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="HiddenFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				HistoryID,
				HistoryStyleID,
				HistoryHTML,
				FromPersonID,
				ToPersonID,
				ToActivityID,
				ToHistoryID,
				ToSiteID,
				Created,
				HiddenFlag
			FROM	ce_History
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"HistoryID") and len(arguments.HistoryID)>
			AND	HistoryID = <cfqueryparam value="#arguments.HistoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"HistoryStyleID") and len(arguments.HistoryStyleID)>
			AND	HistoryStyleID = <cfqueryparam value="#arguments.HistoryStyleID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"HistoryHTML") and len(arguments.HistoryHTML)>
			AND	HistoryHTML = <cfqueryparam value="#arguments.HistoryHTML#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FromPersonID") and len(arguments.FromPersonID)>
			AND	FromPersonID = <cfqueryparam value="#arguments.FromPersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ToPersonID") and len(arguments.ToPersonID)>
			AND	ToPersonID = <cfqueryparam value="#arguments.ToPersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ToActivityID") and len(arguments.ToActivityID)>
			AND	ToActivityID = <cfqueryparam value="#arguments.ToActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ToHistoryID") and len(arguments.ToHistoryID)>
			AND	ToHistoryID = <cfqueryparam value="#arguments.ToHistoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ToHistoryID") and len(arguments.ToHistoryID)>
			AND	ToSiteID = <cfqueryparam value="#arguments.ToSiteID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"HiddenFlag") and len(arguments.HiddenFlag)>
			AND	HiddenFlag = <cfqueryparam value="#arguments.HiddenFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
