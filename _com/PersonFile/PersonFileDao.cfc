
<cfcomponent displayname="PersonFileDAO" hint="table ID column = PersonFileID">

	<cffunction name="init" access="public" output="false" returntype="_com.PersonFile.PersonFileDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="PersonFile" type="_com.PersonFile.PersonFile" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO ce_Person_File
					(
					FileID,
					PersonID,
					FileGroupID
					)
				VALUES
					(
					<cfqueryparam value="#arguments.PersonFile.getFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonFile.getFileID())#" />,
					<cfqueryparam value="#arguments.PersonFile.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonFile.getPersonID())#" />,
					<cfqueryparam value="#arguments.PersonFile.getFileGroupID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonFile.getFileGroupID())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.PersonFile.PersonFile">
		<cfargument name="PersonFile" type="_com.PersonFile.PersonFile" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					PersonFileID,
					FileID,
					PersonID,
					FileGroupID,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_Person_File
				WHERE	PersonFileID = <cfqueryparam value="#arguments.PersonFile.getPersonFileID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset PersonFileBean = arguments.PersonFile.init(argumentCollection=strReturn)>
			<cfreturn PersonFileBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="PersonFile" type="_com.PersonFile.PersonFile" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Person_File
				SET
					FileID = <cfqueryparam value="#arguments.PersonFile.getFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonFile.getFileID())#" />,
					PersonID = <cfqueryparam value="#arguments.PersonFile.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonFile.getPersonID())#" />,
					FileGroupID = <cfqueryparam value="#arguments.PersonFile.getFileGroupID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.PersonFile.getFileGroupID())#" />,
					Created = <cfqueryparam value="#arguments.PersonFile.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.PersonFile.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.PersonFile.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.PersonFile.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.PersonFile.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.PersonFile.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.PersonFile.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.PersonFile.getDeletedFlag())#" />
				WHERE	PersonFileID = <cfqueryparam value="#arguments.PersonFile.getPersonFileID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="PersonFile" type="_com.PersonFile.PersonFile" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Person_File 
				WHERE	PersonFileID = <cfqueryparam value="#arguments.PersonFile.getPersonFileID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="PersonFile" type="_com.PersonFile.PersonFile" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Person_File
			WHERE	PersonFileID = <cfqueryparam value="#arguments.PersonFile.getPersonFileID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="PersonFile" type="_com.PersonFile.PersonFile" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.PersonFile)>
			<cfset success = update(arguments.PersonFile) />
		<cfelse>
			<cfset success = create(arguments.PersonFile) />
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
