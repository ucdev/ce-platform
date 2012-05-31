<cfcomponent displayname="ActionGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Action.ActionGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActionID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="Code" type="string" required="false" />
		<cfargument name="ShortName" type="string" required="false" />
		<cfargument name="LongName" type="string" required="false" />
		<cfargument name="HiddenFlag" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ActionID,
				ActivityID,
				PersonID,
				Code,
				ShortName,
				LongName,
				HiddenFlag,
				Created,
				CreatedBy
			FROM	ce_Action
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ActionID") and len(arguments.ActionID)>
			AND	ActionID = <cfqueryparam value="#arguments.ActionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Code") and len(arguments.Code)>
			AND	Code = <cfqueryparam value="#arguments.Code#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ShortName") and len(arguments.ShortName)>
			AND	ShortName = <cfqueryparam value="#arguments.ShortName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"LongName") and len(arguments.LongName)>
			AND	LongName = <cfqueryparam value="#arguments.LongName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"HiddenFlag") and len(arguments.HiddenFlag)>
			AND	HiddenFlag = <cfqueryparam value="#arguments.HiddenFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActionID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="ShortName" type="string" required="false" />
		<cfargument name="LongName" type="string" required="false" />
		<cfargument name="HiddenFlag" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="NOTCreatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		<cfargument name="Limit" type="string" required="false" default="" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT     
			<cfif Arguments.Limit NEQ "">TOP #Arguments.Limit# </cfif>
			A.ActionID, A.ActivityID, A.PersonID, A.ShortName, A.LongName, A.Code, A.Created, A.CreatedBy, P.firstname, P.middlename, P.lastname, Left(P.FirstName,1) + '. ' + P.LastName As Username
			FROM         ce_Action AS A INNER JOIN
				  ce_person AS P ON A.CreatedBy = P.personid
			WHERE    0=0
		
		<cfif structKeyExists(arguments,"ActionID") and len(arguments.ActionID)>
			AND	A.ActionID = <cfqueryparam value="#arguments.ActionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	A.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	A.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ShortName") and len(arguments.ShortName)>
			AND	A.ShortName = <cfqueryparam value="#arguments.ShortName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"LongName") and len(arguments.LongName)>
			AND	A.LongName = <cfqueryparam value="#arguments.LongName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"HiddenFlag") and len(arguments.HiddenFlag)>
			AND	HiddenFlag = <cfqueryparam value="#arguments.HiddenFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	A.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	A.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"NOTCreatedBy") and len(arguments.NOTCreatedBy)>
			AND	A.CreatedBy <> <cfqueryparam value="#arguments.NOTCreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
</cfcomponent>
