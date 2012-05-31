
<cfcomponent displayname="ContribTypeDAO" hint="table ID column = ContribTypeID">

	<cffunction name="init" access="public" output="false" returntype="_com.System.ContribTypeDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ContribType" type="_com.ContribType" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO ce_Sys_ContribType
					(
					Name,
					Description,
					Created,
					Updated,
					Deleted,
					DeletedFlag
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ContribType.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ContribType.getName())#" />,
					<cfqueryparam value="#arguments.ContribType.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ContribType.getDescription())#" />,
					<cfqueryparam value="#arguments.ContribType.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ContribType.getCreated())#" />,
					<cfqueryparam value="#arguments.ContribType.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ContribType.getUpdated())#" />,
					<cfqueryparam value="#arguments.ContribType.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ContribType.getDeleted())#" />,
					<cfqueryparam value="#arguments.ContribType.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ContribType.getDeletedFlag())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.System.ContribType">
		<cfargument name="ContribType" type="_com.system.ContribType" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ContribTypeID,
					Name,
					Description,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_Sys_ContribType
				WHERE	ContribTypeID = <cfqueryparam value="#arguments.ContribType.getContribTypeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ContribTypeBean = arguments.ContribType.init(argumentCollection=strReturn)>
			<cfreturn ContribTypeBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ContribType" type="_com.system.ContribType" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Sys_ContribType
				SET
					Name = <cfqueryparam value="#arguments.ContribType.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ContribType.getName())#" />,
					Description = <cfqueryparam value="#arguments.ContribType.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ContribType.getDescription())#" />,
					Created = <cfqueryparam value="#arguments.ContribType.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ContribType.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.ContribType.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ContribType.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.ContribType.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ContribType.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.ContribType.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ContribType.getDeletedFlag())#" />
				WHERE	ContribTypeID = <cfqueryparam value="#arguments.ContribType.getContribTypeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ContribType" type="_com.system.ContribType" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Sys_ContribType 
				WHERE	ContribTypeID = <cfqueryparam value="#arguments.ContribType.getContribTypeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ContribType" type="_com.system.ContribType" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Sys_ContribType
			WHERE	ContribTypeID = <cfqueryparam value="#arguments.ContribType.getContribTypeID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ContribType" type="_com.system.ContribType" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ContribType)>
			<cfset success = update(arguments.ContribType) />
		<cfelse>
			<cfset success = create(arguments.ContribType) />
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
