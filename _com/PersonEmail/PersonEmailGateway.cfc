
<cfcomponent displayname="PersonEmailGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.PersonEmail.PersonEmailGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributesQuery" access="public" output="false" returntype="query">
		<cfargument name="email_id" type="numeric" required="false" />
		<cfargument name="person_id" type="numeric" required="false" />
		<cfargument name="email_address" type="string" required="false" />
		<cfargument name="is_verified" type="numeric" required="false" />
		<cfargument name="verification_key" type="string" required="false" />
		<cfargument name="allow_login" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				email_id,
				person_id,
				email_address,
				is_verified,
				verification_key,
				allow_login
			FROM	ce_Person_Email
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"email_id") and len(arguments.email_id)>
			AND	email_id = <cfqueryparam value="#arguments.email_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"person_id") and len(arguments.person_id)>
			AND	person_id = <cfqueryparam value="#arguments.person_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"email_address") and len(arguments.email_address)>
			AND	email_address = <cfqueryparam value="#arguments.email_address#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"is_verified") and len(arguments.is_verified)>
			AND	is_verified = <cfqueryparam value="#arguments.is_verified#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"verification_key") and len(arguments.verification_key)>
			AND	verification_key = <cfqueryparam value="#arguments.verification_key#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"allow_login") and len(arguments.allow_login)>
			AND	allow_login = <cfqueryparam value="#arguments.allow_login#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByAttributesQueryFull" access="public" output="false" returntype="query">
		<cfargument name="email_id" type="numeric" required="false" />
		<cfargument name="person_id" type="numeric" required="false" />
		<cfargument name="email_address" type="string" required="false" />
		<cfargument name="is_verified" type="numeric" required="false" />
		<cfargument name="verification_key" type="string" required="false" />
		<cfargument name="allow_login" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT DISTINCT
				pe.email_id,
				pe.person_id,
				pe.email_address,
				pe.is_verified,
				pe.verification_key,
				pe.allow_login,
                CASE
                	WHEN pe.email_id = pp.primaryEmailId THEN 1
                    ELSE 0
                END AS isPrimaryEmail
			FROM	ce_Person_Email AS pe
           	LEFT JOIN ce_person_pref AS pp ON pp.personId = pe.person_id
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"email_id") and len(arguments.email_id)>
			AND	pe.email_id = <cfqueryparam value="#arguments.email_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"person_id") and len(arguments.person_id)>
			AND	pe.person_id = <cfqueryparam value="#arguments.person_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"email_address") and len(arguments.email_address)>
			AND	pe.email_address = <cfqueryparam value="#arguments.email_address#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"is_verified") and len(arguments.is_verified)>
			AND	pe.is_verified = <cfqueryparam value="#arguments.is_verified#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"verification_key") and len(arguments.verification_key)>
			AND	pe.verification_key = <cfqueryparam value="#arguments.verification_key#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"allow_login") and len(arguments.allow_login)>
			AND	pe.allow_login = <cfqueryparam value="#arguments.allow_login#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByAttributes" access="public" output="false" returntype="array">
		<cfargument name="email_id" type="numeric" required="false" />
		<cfargument name="person_id" type="numeric" required="false" />
		<cfargument name="email_address" type="string" required="false" />
		<cfargument name="is_verified" type="numeric" required="false" />
		<cfargument name="verification_key" type="string" required="false" />
		<cfargument name="allow_login" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = getByAttributesQuery(argumentCollection=arguments) />		
		<cfset var arrObjects = arrayNew(1) />
		<cfset var tmpObj = "" />
		<cfset var i = 0 />
		<cfloop from="1" to="#qList.recordCount#" index="i">
			<cfset tmpObj = createObject("component","_com.PersonEmail.PersonEmail").init(argumentCollection=queryRowToStruct(qList,i)) />
			<cfset arrayAppend(arrObjects,tmpObj) />
		</cfloop>
				
		<cfreturn arrObjects />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>
