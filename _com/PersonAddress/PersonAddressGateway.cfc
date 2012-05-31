
<cfcomponent displayname="PersonAddressGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.PersonAddress.PersonAddressGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="AddressID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="AddressTypeID" type="numeric" required="false" />
		<cfargument name="Address1" type="string" required="false" />
		<cfargument name="Address2" type="string" required="false" />
		<cfargument name="City" type="string" required="false" />
		<cfargument name="State" type="string" required="false" />
		<cfargument name="Province" type="string" required="false" />
		<cfargument name="Country" type="string" required="false" />
		<cfargument name="ZipCode" type="string" required="false" />
		<cfargument name="Phone1" type="string" required="false" />
		<cfargument name="Phone1ext" type="string" required="false" />
		<cfargument name="Phone2" type="string" required="false" />
		<cfargument name="Phone2ext" type="string" required="false" />
		<cfargument name="Phone3" type="string" required="false" />
		<cfargument name="Phone3ext" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				AddressID,
				PersonID,
				AddressTypeID,
				Address1,
				Address2,
				City,
				State,
				Province,
				Country,
				ZipCode,
				Phone1,
				Phone1ext,
				Phone2,
				Phone2ext,
				Phone3,
				Phone3ext,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy
			FROM	ce_Person_Address
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AddressID") and len(arguments.AddressID)>
			AND	AddressID = <cfqueryparam value="#arguments.AddressID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AddressTypeID") and len(arguments.AddressTypeID)>
			AND	AddressTypeID = <cfqueryparam value="#arguments.AddressTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Address1") and len(arguments.Address1)>
			AND	Address1 = <cfqueryparam value="#arguments.Address1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Address2") and len(arguments.Address2)>
			AND	Address2 = <cfqueryparam value="#arguments.Address2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"City") and len(arguments.City)>
			AND	City = <cfqueryparam value="#arguments.City#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"State") and len(arguments.State)>
			AND	State = <cfqueryparam value="#arguments.State#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Province") and len(arguments.Province)>
			AND	Province = <cfqueryparam value="#arguments.Province#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Country") and len(arguments.Country)>
			AND	Country = <cfqueryparam value="#arguments.Country#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ZipCode") and len(arguments.ZipCode)>
			AND	ZipCode = <cfqueryparam value="#arguments.ZipCode#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone1") and len(arguments.Phone1)>
			AND	Phone1 = <cfqueryparam value="#arguments.Phone1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone1ext") and len(arguments.Phone1ext)>
			AND	Phone1ext = <cfqueryparam value="#arguments.Phone1ext#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone2") and len(arguments.Phone2)>
			AND	Phone2 = <cfqueryparam value="#arguments.Phone2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone2ext") and len(arguments.Phone2ext)>
			AND	Phone2ext = <cfqueryparam value="#arguments.Phone2ext#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone3") and len(arguments.Phone3)>
			AND	Phone3 = <cfqueryparam value="#arguments.Phone3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone3ext") and len(arguments.Phone3ext)>
			AND	Phone3ext = <cfqueryparam value="#arguments.Phone3ext#" CFSQLType="cf_sql_varchar" />
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
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByAttributesForDisplay" access="public" output="false" returntype="query">
		<cfargument name="AddressID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="AddressTypeID" type="numeric" required="false" />
		<cfargument name="Address1" type="string" required="false" />
		<cfargument name="Address2" type="string" required="false" />
		<cfargument name="City" type="string" required="false" />
		<cfargument name="State" type="string" required="false" />
		<cfargument name="Province" type="string" required="false" />
		<cfargument name="Country" type="string" required="false" />
		<cfargument name="ZipCode" type="string" required="false" />
		<cfargument name="Phone1" type="string" required="false" />
		<cfargument name="Phone2" type="string" required="false" />
		<cfargument name="Phone3" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				PA.AddressID,
				PA.PersonID,
				PA.AddressTypeID,
				PA.Address1,
				PA.Address2,
				PA.City,
				PA.State,
				PA.Province,
				PA.Country,
				PA.ZipCode,
				PA.Phone1,
				PA.Phone1ext,
				PA.Phone2,
				PA.Phone2ext,
				PA.Phone3,
				PA.Phone3ext,
				PA.Created,
				PA.CreatedBy,
				PA.Updated,
				PA.UpdatedBy,
				AT.Description AS AddressTypeName
			FROM	ce_Person_Address PA 
			INNER JOIN ce_Sys_AddressType AT ON AT.AddressTypeID = PA.AddressTypeID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AddressID") and len(arguments.AddressID)>
			AND	PA.AddressID = <cfqueryparam value="#arguments.AddressID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PA.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AddressTypeID") and len(arguments.AddressTypeID)>
			AND	PA.AddressTypeID = <cfqueryparam value="#arguments.AddressTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Address1") and len(arguments.Address1)>
			AND	PA.Address1 = <cfqueryparam value="#arguments.Address1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Address2") and len(arguments.Address2)>
			AND	PA.Address2 = <cfqueryparam value="#arguments.Address2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"City") and len(arguments.City)>
			AND	PA.City = <cfqueryparam value="#arguments.City#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"State") and len(arguments.State)>
			AND	PA.State = <cfqueryparam value="#arguments.State#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Province") and len(arguments.Province)>
			AND	PA.Province = <cfqueryparam value="#arguments.Province#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Country") and len(arguments.Country)>
			AND	PA.Country = <cfqueryparam value="#arguments.Country#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ZipCode") and len(arguments.ZipCode)>
			AND	PA.ZipCode = <cfqueryparam value="#arguments.ZipCode#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone1") and len(arguments.Phone1)>
			AND	PA.Phone1 = <cfqueryparam value="#arguments.Phone1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone2") and len(arguments.Phone2)>
			AND	PA.Phone2 = <cfqueryparam value="#arguments.Phone2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Phone3") and len(arguments.Phone3)>
			AND	PA.Phone3 = <cfqueryparam value="#arguments.Phone3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	PA.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	PA.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	PA.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	PA.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
