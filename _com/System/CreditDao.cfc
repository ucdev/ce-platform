<cfcomponent displayname="CreditDAO" hint="table ID column = CreditID">

	<cffunction name="init" access="public" output="false" returntype="_com.System.CreditDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Credit" type="_com.System.Credit" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Sys_Credit
					(
					Name,
					Description,
					Code,
					ReferenceFlag
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Credit.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Credit.getName())#" />,
					<cfqueryparam value="#arguments.Credit.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Credit.getDescription())#" />,
					<cfqueryparam value="#arguments.Credit.getCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Credit.getCode())#" />,
					<cfqueryparam value="#arguments.Credit.getReferenceFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Credit.getReferenceFlag())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.System.Credit">
		<cfargument name="Credit" type="_com.System.Credit" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					CreditID,
					Name,
					Description,
					Code,
					ReferenceFlag,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_Sys_Credit
				WHERE	CreditID = <cfqueryparam value="#arguments.Credit.getCreditID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset CreditBean = arguments.Credit.init(argumentCollection=strReturn)>
			<cfreturn CreditBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Credit" type="_com.System.Credit" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Sys_Credit
				SET
					Name = <cfqueryparam value="#arguments.Credit.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Credit.getName())#" />,
					Description = <cfqueryparam value="#arguments.Credit.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Credit.getDescription())#" />,
					Code = <cfqueryparam value="#arguments.Credit.getCode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Credit.getCode())#" />,
					ReferenceFlag = <cfqueryparam value="#arguments.Credit.getReferenceFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Credit.getReferenceFlag())#" />,
					Created = <cfqueryparam value="#arguments.Credit.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Credit.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.Credit.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Credit.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.Credit.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Credit.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Credit.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Credit.getDeletedFlag())#" />
				WHERE	CreditID = <cfqueryparam value="#arguments.Credit.getCreditID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Credit" type="_com.System.Credit" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Sys_Credit 
				WHERE	CreditID = <cfqueryparam value="#arguments.Credit.getCreditID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Credit" type="_com.System.Credit" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Sys_Credit
			WHERE	CreditID = <cfqueryparam value="#arguments.Credit.getCreditID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Credit" type="_com.System.Credit" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Credit)>
			<cfset success = update(arguments.Credit) />
		<cfelse>
			<cfset success = create(arguments.Credit) />
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
