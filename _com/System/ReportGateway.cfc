<cfcomponent displayname="ReportGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.System.ReportGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="ReportID" type="numeric" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="FileName" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ReportID,
				Title,
				Description,
				FileName,
				Created,
				Updated
			FROM	ce_Sys_Report
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ReportID") and len(arguments.ReportID)>
			AND	ReportID = <cfqueryparam value="#arguments.ReportID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Title") and len(arguments.Title)>
			AND	Title = <cfqueryparam value="#arguments.Title#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileName") and len(arguments.FileName)>
			AND	FileName = <cfqueryparam value="#arguments.FileName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
