<cfcomponent displayname="ActivityCreditGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityCredit.ActivityCreditGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="Activity_CreditID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CreditID" type="numeric" required="false" />
		<cfargument name="Amount" type="numeric" required="false" />
		<cfargument name="ReferenceNo" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				Activity_CreditID,
				ActivityID,
				CreditID,
				Amount,
				ReferenceNo,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_Activity_Credit
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"Activity_CreditID") and len(arguments.Activity_CreditID)>
			AND	Activity_CreditID = <cfqueryparam value="#arguments.Activity_CreditID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CreditID") and len(arguments.CreditID)>
			AND	CreditID = <cfqueryparam value="#arguments.CreditID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Amount") and len(arguments.Amount)>
			AND	Amount = <cfqueryparam value="#arguments.Amount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"ReferenceNo") and len(arguments.ReferenceNo)>
			AND	ReferenceNo = <cfqueryparam value="#arguments.ReferenceNo#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
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
		<cfargument name="Activity_CreditID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CreditID" type="numeric" required="false" />
		<cfargument name="Amount" type="numeric" required="false" />
		<cfargument name="ReferenceNo" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ac.Activity_CreditID,
				ac.ActivityID,
				ac.CreditID,
				ac.Amount,
				ac.ReferenceNo,
                c.Statement AS CreditStatement,
				ac.Created,
				ac.CreatedBy,
				ac.Updated,
				ac.UpdatedBy,
				ac.Deleted,
				ac.DeletedFlag,
                c.Name AS CreditName
			FROM	ce_Activity_Credit AS ac
            INNER JOIN ce_Sys_Credit AS c ON c.CreditID = ac.CreditID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"Activity_CreditID") and len(arguments.Activity_CreditID)>
			AND	ac.Activity_CreditID = <cfqueryparam value="#arguments.Activity_CreditID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ac.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CreditID") and len(arguments.CreditID)>
			AND	ac.CreditID = <cfqueryparam value="#arguments.CreditID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Amount") and len(arguments.Amount)>
			AND	ac.Amount = <cfqueryparam value="#arguments.Amount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"ReferenceNo") and len(arguments.ReferenceNo)>
			AND	ac.ReferenceNo = <cfqueryparam value="#arguments.ReferenceNo#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	ac.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	ac.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	ac.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	ac.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	ac.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	ac.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CreditName") and len(arguments.CreditName)>
			AND	c.Name = <cfqueryparam value="#arguments.CreditName#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>
