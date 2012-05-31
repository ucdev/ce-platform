<cfcomponent displayname="FunRNDAO" hint="table ID column = FunRNID">

	<cffunction name="init" access="public" output="false" returntype="_com.System.FunRNDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="FunRN" type="_com.System.FunRN" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Sys_FunRN
					(
					Name,
					Description
					)
				VALUES
					(
					<cfqueryparam value="#arguments.FunRN.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FunRN.getName())#" />,
					<cfqueryparam value="#arguments.FunRN.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FunRN.getDescription())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.System.FunRN">
		<cfargument name="FunRN" type="_com.System.FunRN" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					FunRNID,
					Name,
					Description,
					Created
				FROM	ce_Sys_FunRN
				WHERE	FunRNID = <cfqueryparam value="#arguments.FunRN.getFunRNID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset FunRNBean = arguments.FunRN.init(argumentCollection=strReturn)>
			<cfreturn FunRNBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="FunRN" type="_com.System.FunRN" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Sys_FunRN
				SET
					Name = <cfqueryparam value="#arguments.FunRN.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FunRN.getName())#" />,
					Description = <cfqueryparam value="#arguments.FunRN.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FunRN.getDescription())#" />,
					Created = <cfqueryparam value="#arguments.FunRN.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.FunRN.getCreated())#" />
				WHERE	FunRNID = <cfqueryparam value="#arguments.FunRN.getFunRNID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="FunRN" type="_com.System.FunRN" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Sys_FunRN 
				WHERE	FunRNID = <cfqueryparam value="#arguments.FunRN.getFunRNID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="FunRN" type="_com.System.FunRN" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Sys_FunRN
			WHERE	FunRNID = <cfqueryparam value="#arguments.FunRN.getFunRNID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="FunRN" type="_com.System.FunRN" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.FunRN)>
			<cfset success = update(arguments.FunRN) />
		<cfelse>
			<cfset success = create(arguments.FunRN) />
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
