<cfcomponent displayname="ActivityCategoryDAO" hint="table ID column = Activity_CategoryID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityCategory.ActivityCategoryDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityCategory" type="_com.ActivityCategory.ActivityCategory" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_Category
					(
					ActivityID,
					CategoryID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ActivityCategory.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityCategory.getCategoryID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityCategory.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityCategory.ActivityCategory">
		<cfargument name="ActivityCategory" type="_com.ActivityCategory.ActivityCategory" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					Activity_CategoryID,
					ActivityID,
					CategoryID,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Activity_Category
				WHERE	Activity_CategoryID = <cfqueryparam value="#arguments.ActivityCategory.getActivity_CategoryID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivityCategoryBean = arguments.ActivityCategory.init(argumentCollection=strReturn)>
			<cfreturn ActivityCategoryBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityCategory" type="_com.ActivityCategory.ActivityCategory" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_Category
				SET
					ActivityID = <cfqueryparam value="#arguments.ActivityCategory.getActivityID()#" CFSQLType="cf_sql_integer" />,
					CategoryID = <cfqueryparam value="#arguments.ActivityCategory.getCategoryID()#" CFSQLType="cf_sql_integer" />,
					Created = <cfqueryparam value="#arguments.ActivityCategory.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityCategory.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.ActivityCategory.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.ActivityCategory.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityCategory.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.ActivityCategory.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityCategory.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.ActivityCategory.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityCategory.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.ActivityCategory.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityCategory.getDeletedFlag())#" />
				WHERE	Activity_CategoryID = <cfqueryparam value="#arguments.ActivityCategory.getActivity_CategoryID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityCategory" type="_com.ActivityCategory.ActivityCategory" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_Category 
				WHERE	Activity_CategoryID = <cfqueryparam value="#arguments.ActivityCategory.getActivity_CategoryID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityCategory" type="_com.ActivityCategory.ActivityCategory" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_Category
			WHERE	Activity_CategoryID = <cfqueryparam value="#arguments.ActivityCategory.getActivity_CategoryID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityCategory" type="_com.ActivityCategory.ActivityCategory" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ActivityCategory)>
			<cfset success = update(arguments.ActivityCategory) />
		<cfelse>
			<cfset success = create(arguments.ActivityCategory) />
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
