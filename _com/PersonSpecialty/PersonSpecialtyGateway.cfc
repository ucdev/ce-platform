<cfcomponent displayname="PersonSpecialtyGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.PersonSpecialty.PersonSpecialtyGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="PersonSpecialtyID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="SpecialtyID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				PersonSpecialtyID,
				PersonID,
				SpecialtyID,
				Created,
				DeletedFlag
			FROM	ce_Person_SpecialtyLMS
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PersonSpecialtyID") and len(arguments.PersonSpecialtyID)>
			AND	PersonSpecialtyID = <cfqueryparam value="#arguments.PersonSpecialtyID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SpecialtyID") and len(arguments.SpecialtyID)>
			AND	SpecialtyID = <cfqueryparam value="#arguments.SpecialtyID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
