<cfcomponent displayname="PersonInterestExceptGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.PersonInterestExcept.PersonInterestExceptGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="PersonIntExceptID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				PersonIntExceptID,
				PersonID,
				ActivityID,
				Created
			FROM	ce_Person_Interest_Except
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PersonIntExceptID") and len(arguments.PersonIntExceptID)>
			AND	PersonIntExceptID = <cfqueryparam value="#arguments.PersonIntExceptID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
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
