
<cfcomponent displayname="AccountDAO" hint="table ID column = AccountID">

	<cffunction name="init" access="public" output="false" returntype="_com.Account.AccountDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Account" type="_com.Account.Account" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Account
					(
					PersonID,
					UserID,
					AuthorityID
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Account.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Account.getPersonID())#" />,
					<cfqueryparam value="#arguments.Account.getUserID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Account.getUserID())#" />,
					<cfqueryparam value="#arguments.Account.getAuthorityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Account.getAuthorityID())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Account.Account">
		<cfargument name="Account" type="_com.Account.Account" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AccountID,
					PersonID,
					UserID,
					AuthorityID,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_Account
				WHERE	AccountID = <cfqueryparam value="#arguments.Account.getAccountID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
		<cftry>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AccountBean = arguments.Account.init(argumentCollection=strReturn)>
			<cfreturn AccountBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Account" type="_com.Account.Account" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Account
				SET
					PersonID = <cfqueryparam value="#arguments.Account.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Account.getPersonID())#" />,
					UserID = <cfqueryparam value="#arguments.Account.getUserID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Account.getUserID())#" />,
					AuthorityID = <cfqueryparam value="#arguments.Account.getAuthorityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Account.getAuthorityID())#" />,
					Created = <cfqueryparam value="#arguments.Account.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Account.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.Account.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Account.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.Account.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Account.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Account.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Account.getDeletedFlag())#" />
				WHERE	AccountID = <cfqueryparam value="#arguments.Account.getAccountID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Account" type="_com.Account.Account" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Account 
				WHERE	AccountID = <cfqueryparam value="#arguments.Account.getAccountID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Account" type="_com.Account.Account" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Account
			WHERE	AccountID = <cfqueryparam value="#arguments.Account.getAccountID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Account" type="_com.Account.Account" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Account)>
			<cfset success = update(arguments.Account) />
		<cfelse>
			<cfset success = create(arguments.Account) />
		</cfif>
		
		<cfreturn success />
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
