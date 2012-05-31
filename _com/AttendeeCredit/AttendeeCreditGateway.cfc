
<cfcomponent displayname="AttendeeCreditGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.AttendeeCredit.AttendeeCreditGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="AttendeeCreditID" type="numeric" required="false" />
		<cfargument name="AttendeeID" type="numeric" required="false" />
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
				AttendeeCreditID,
				AttendeeID,
				CreditID,
				Amount,
				ReferenceNo,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_AttendeeCredit
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AttendeeCreditID") and len(arguments.AttendeeCreditID)>
			AND	AttendeeCreditID = <cfqueryparam value="#arguments.AttendeeCreditID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AttendeeID") and len(arguments.AttendeeID)>
			AND	AttendeeID = <cfqueryparam value="#arguments.AttendeeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CreditID") and len(arguments.CreditID)>
			AND	CreditID = <cfqueryparam value="#arguments.CreditID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Amount") and len(arguments.Amount)>
			AND	Amount = <cfqueryparam value="#arguments.Amount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"ReferenceNo") and len(arguments.ReferenceNo)>
			AND	ReferenceNo = <cfqueryparam value="#arguments.ReferenceNo#" CFSQLType="cf_sql_varchar" />
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

</cfcomponent>
