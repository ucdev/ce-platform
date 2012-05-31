<cfcomponent displayname="CategoryLMSDAO" hint="table ID column = CategoryID">

	<cffunction name="init" access="public" output="false" returntype="_com.CategoryLMS.CategoryLMSDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="CategoryLMS" type="_com.CategoryLMS.CategoryLMS" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Sys_CategoryLMS
					(
					Name,
					Description
					)
				VALUES
					(
					<cfqueryparam value="#arguments.CategoryLMS.getName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.CategoryLMS.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.CategoryLMS.getDescription())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.CategoryLMS.CategoryLMS">
		<cfargument name="CategoryLMS" type="_com.CategoryLMS.CategoryLMS" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					CategoryID,
					Name,
					Description
				FROM	ce_Sys_CategoryLMS
				WHERE	
					<cfif Len(arguments.CategoryLMS.getName()) GT 0>
						Name = <cfqueryparam value="#arguments.CategoryLMS.getName()#" CFSQLType="cf_sql_varchar" />
					<cfelse>
						CategoryID = <cfqueryparam value="#arguments.CategoryLMS.getCategoryID()#" cfsqltype="cf_sql_integer" />
					</cfif>
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset CategoryLMSBean = arguments.CategoryLMS.init(argumentCollection=strReturn)>
			<cfreturn CategoryLMSBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="CategoryLMS" type="_com.CategoryLMS.CategoryLMS" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Sys_CategoryLMS
				SET
					Name = <cfqueryparam value="#arguments.CategoryLMS.getName()#" CFSQLType="cf_sql_varchar" />,
					Description = <cfqueryparam value="#arguments.CategoryLMS.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.CategoryLMS.getDescription())#" />
				WHERE
					<cfif Len(arguments.CategoryLMS.getName()) GT 0>
						Name = <cfqueryparam value="#arguments.CategoryLMS.getName()#" CFSQLType="cf_sql_varchar" />
					<cfelse>
						CategoryID = <cfqueryparam value="#arguments.CategoryLMS.getCategoryID()#" cfsqltype="cf_sql_integer" />
					</cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="CategoryLMS" type="_com.CategoryLMS.CategoryLMS" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Sys_CategoryLMS 
				WHERE
					<cfif Len(arguments.CategoryLMS.getName()) GT 0>
						Name = <cfqueryparam value="#arguments.CategoryLMS.getName()#" CFSQLType="cf_sql_varchar" />
					<cfelse>
						CategoryID = <cfqueryparam value="#arguments.CategoryLMS.getCategoryID()#" cfsqltype="cf_sql_integer" />
					</cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="CategoryLMS" type="_com.CategoryLMS.CategoryLMS" required="true" />

		<cfset var qExists = "">
		
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Sys_CategoryLMS
			WHERE	
				<cfif Len(arguments.CategoryLMS.getName()) GT 0>
					Name = <cfqueryparam value="#arguments.CategoryLMS.getName()#" CFSQLType="cf_sql_varchar" />
				<cfelse>
					CategoryID = <cfqueryparam value="#arguments.CategoryLMS.getCategoryID()#" cfsqltype="cf_sql_integer" />
				</cfif>
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="CategoryLMS" type="_com.CategoryLMS.CategoryLMS" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.CategoryLMS)>
			<cfset success = update(arguments.CategoryLMS) />
		<cfelse>
			<cfset success = create(arguments.CategoryLMS) />
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
