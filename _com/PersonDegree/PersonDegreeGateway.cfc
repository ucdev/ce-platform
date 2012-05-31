<cfcomponent displayname="PersonDegreeGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.PersonDegree.PersonDegreeGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="PersonDegreeID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="DegreeID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				PersonDegreeID,
				PersonID,
				DegreeID,
				Created,
				DeletedFlag
			FROM	ce_Person_Degree
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PersonDegreeID") and len(arguments.PersonDegreeID)>
			AND	PersonDegreeID = <cfqueryparam value="#arguments.PersonDegreeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DegreeID") and len(arguments.DegreeID)>
			AND	DegreeID = <cfqueryparam value="#arguments.DegreeID#" CFSQLType="cf_sql_integer" />
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
	
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="PersonDegreeID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="DegreeID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				pd.PersonDegreeID,
				pd.PersonID,
				pd.DegreeID,
				pd.Created,
				pd.DeletedFlag,
                sd.Name AS DegreeName
			FROM	ce_Person_Degree pd
            INNER JOIN ce_Sys_Degree sd ON sd.DegreeID = pd.DegreeID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PersonDegreeID") and len(arguments.PersonDegreeID)>
			AND	pd.PersonDegreeID = <cfqueryparam value="#arguments.PersonDegreeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	pd.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DegreeID") and len(arguments.DegreeID)>
			AND	pd.DegreeID = <cfqueryparam value="#arguments.DegreeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	pd.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	pd.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>
