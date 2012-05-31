<cfcomponent displayname="FileGroupDAO" hint="table ID column = FileGroupID">

	<cffunction name="init" access="public" output="false" returntype="_com.FileGroup.FileGroupDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="FileGroup" type="_com.FileGroup.FileGroup" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO ce_FileGroup
					(
					Name,
					Description,
					Code,
					FileGroupTypeID
					)
				VALUES
					(
					<cfqueryparam value="#arguments.FileGroup.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FileGroup.getName())#" />,
					<cfqueryparam value="#arguments.FileGroup.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FileGroup.getDescription())#" />,
					<cfqueryparam value="#arguments.FileGroup.getCode()#" CFSQLType="cf_sql_char" null="#not len(arguments.FileGroup.getCode())#" />,
					<cfqueryparam value="#arguments.FileGroup.getFileGroupTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.FileGroup.getFileGroupTypeID())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.FileGroup.FileGroup">
		<cfargument name="FileGroup" type="_com.FileGroup.FileGroup" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					FileGroupID,
					Name,
					Description,
					Code,
					FileGroupTypeID,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_FileGroup
				WHERE	FileGroupID = <cfqueryparam value="#arguments.FileGroup.getFileGroupID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset FileGroupBean = arguments.FileGroup.init(argumentCollection=strReturn)>
			<cfreturn FileGroupBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="FileGroup" type="_com.FileGroup.FileGroup" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_FileGroup
				SET
					Name = <cfqueryparam value="#arguments.FileGroup.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FileGroup.getName())#" />,
					Description = <cfqueryparam value="#arguments.FileGroup.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.FileGroup.getDescription())#" />,
					Code = <cfqueryparam value="#arguments.FileGroup.getCode()#" CFSQLType="cf_sql_char" null="#not len(arguments.FileGroup.getCode())#" />,
					FileGroupTypeID = <cfqueryparam value="#arguments.FileGroup.getFileGroupTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.FileGroup.getFileGroupTypeID())#" />,
					Created = <cfqueryparam value="#arguments.FileGroup.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.FileGroup.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.FileGroup.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.FileGroup.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.FileGroup.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.FileGroup.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.FileGroup.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.FileGroup.getDeletedFlag())#" />
				WHERE	FileGroupID = <cfqueryparam value="#arguments.FileGroup.getFileGroupID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="FileGroup" type="_com.FileGroup.FileGroup" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_FileGroup 
				WHERE	FileGroupID = <cfqueryparam value="#arguments.FileGroup.getFileGroupID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="FileGroup" type="_com.FileGroup.FileGroup" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_FileGroup
			WHERE	FileGroupID = <cfqueryparam value="#arguments.FileGroup.getFileGroupID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="FileGroup" type="_com.FileGroup.FileGroup" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.FileGroup)>
			<cfset success = update(arguments.FileGroup) />
		<cfelse>
			<cfset success = create(arguments.FileGroup) />
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
