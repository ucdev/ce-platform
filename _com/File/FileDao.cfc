
<cfcomponent displayname="FileDAO" hint="table ID column = FileID">

	<cffunction name="init" access="public" output="false" returntype="_com.File.FileDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="File" type="_com.File.File" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_File
					(
					FileName,
					FileCaption,
					FileSize,
					FileTypeID,
					PersonID,
					ActivityID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.File.getFileName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.File.getFileName())#" />,
					<cfqueryparam value="#arguments.File.getFileCaption()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.File.getFileCaption())#" />,
					<cfqueryparam value="#arguments.File.getFileSize()#" CFSQLType="cf_sql_float" null="#not len(arguments.File.getFileSize())#" />,
					<cfqueryparam value="#arguments.File.getFileTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.File.getFileTypeID())#" />,
					<cfqueryparam value="#arguments.File.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.File.getPersonID())#" />,
					<cfqueryparam value="#arguments.File.getActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.File.getActivityID())#" />,
					<cfqueryparam value="#arguments.File.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.File.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.File.File">
		<cfargument name="File" type="_com.File.File" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					FileID,
					FileName,
					FileCaption,
					FileSize,
					FileTypeID,
					PersonID,
					ActivityID,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_File
				WHERE	FileID = <cfqueryparam value="#arguments.File.getFileID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset FileBean = arguments.File.init(argumentCollection=strReturn)>
			<cfreturn FileBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="File" type="_com.File.File" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_File
				SET
					FileCaption = <cfqueryparam value="#arguments.File.getFileCaption()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.File.getFileCaption())#" />,
					FileSize = <cfqueryparam value="#arguments.File.getFileSize()#" CFSQLType="cf_sql_float" null="#not len(arguments.File.getFileSize())#" />,
					FileTypeID = <cfqueryparam value="#arguments.File.getFileTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.File.getFileTypeID())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.File.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.File.getUpdatedBy())#" />
				WHERE	FileID = <cfqueryparam value="#arguments.File.getFileID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="File" type="_com.File.File" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_File 
				WHERE	FileID = <cfqueryparam value="#arguments.File.getFileID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="File" type="_com.File.File" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_File
			WHERE	FileID = <cfqueryparam value="#arguments.File.getFileID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="File" type="_com.File.File" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.File)>
			<cfset success = update(arguments.File) />
		<cfelse>
			<cfset success = create(arguments.File) />
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
