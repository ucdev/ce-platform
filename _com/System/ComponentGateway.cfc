<cfcomponent displayname="ComponentGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.System.ComponentGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="ComponentID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="TypeCode" type="string" required="false" />
		<cfargument name="SortFlag" type="string" required="false" />
		<cfargument name="MaxUsage" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ComponentID,
				Name,
				Description,
				TypeCode,
				SortFlag,
				MaxUsage
			FROM	ce_Sys_Component
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ComponentID") and len(arguments.ComponentID)>
			AND	ComponentID = <cfqueryparam value="#arguments.ComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"TypeCode") and len(arguments.TypeCode)>
			AND	TypeCode = <cfqueryparam value="#arguments.TypeCode#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SortFlag") and len(arguments.SortFlag)>
			AND	SortFlag = <cfqueryparam value="#arguments.SortFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"MaxUsage") and len(arguments.MaxUsage)>
			AND	MaxUsage = <cfqueryparam value="#arguments.MaxUsage#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
