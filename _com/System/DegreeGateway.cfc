
<cfcomponent displayname="DegreeGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.System.DegreeGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="DegreeID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Abbrev" type="string" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				DegreeID,
				Name,
				Abbrev,
				Sort
			FROM	ce_Sys_Degree
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"DegreeID") and len(arguments.DegreeID)>
			AND	DegreeID = <cfqueryparam value="#arguments.DegreeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Abbrev") and len(arguments.Abbrev)>
			AND	Abbrev = <cfqueryparam value="#arguments.Abbrev#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
