
<cfcomponent displayname="SpecialtyGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Specialty.SpecialtyGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="SpecialtyID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				SpecialtyID,
				Name,
				Description
			FROM	ce_Sys_SpecialtyLMS
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"SpecialtyID") and len(arguments.SpecialtyID)>
			AND	SpecialtyID = <cfqueryparam value="#arguments.SpecialtyID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="SpecialtyID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				sslms.SpecialtyID,
				sslms.Name,
				sslms.Description,
                (SELECT COUNT(ActivityID)
                 FROM ce_Activity_SpecialtyLMS aslms
                 WHERE aslms.SpecialtyID = sslms.SpecialtyID) AS ActivityCount
			FROM	ce_Sys_SpecialtyLMS sslms
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"SpecialtyID") and len(arguments.SpecialtyID)>
			AND	sslms.SpecialtyID = <cfqueryparam value="#arguments.SpecialtyID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	sslms.Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	sslms.Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
