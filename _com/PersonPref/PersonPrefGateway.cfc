<cfcomponent displayname="PersonPrefGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.PersonPref.PersonPrefGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="PersonPrefID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="EmailSpecialtyFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				PersonPrefID,
				PersonID,
				EmailSpecialtyFlag,
                PrimaryEmailId
			FROM	ce_Person_Pref
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PersonPrefID") and len(arguments.PersonPrefID)>
			AND	PersonPrefID = <cfqueryparam value="#arguments.PersonPrefID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"EmailSpecialtyFlag") and len(arguments.EmailSpecialtyFlag)>
			AND	EmailSpecialtyFlag = <cfqueryparam value="#arguments.EmailSpecialtyFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PrimaryEmailId") and len(arguments.PrimaryEmailId)>
			AND	PrimaryEmailId = <cfqueryparam value="#arguments.PrimaryEmailId#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
