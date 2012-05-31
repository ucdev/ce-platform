
<cfcomponent displayname="ActivitySpecialtyLMSDAO" hint="table ID column = Activity_LMS_SpecialtyID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMSDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ActivitySpecialtyLMS" type="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMS" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_SpecialtyLMS
					(
					ActivityID,
					SpecialtyID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ActivitySpecialtyLMS.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivitySpecialtyLMS.getSpecialtyID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivitySpecialtyLMS.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMS">
		<cfargument name="ActivitySpecialtyLMS" type="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMS" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					Activity_LMS_SpecialtyID,
					ActivityID,
					SpecialtyID,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Activity_SpecialtyLMS
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getActivityID()#" CFSQLType="cf_sql_integer" /> AND SpecialtyID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getSpecialtyID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivitySpecialtyLMSBean = arguments.ActivitySpecialtyLMS.init(argumentCollection=strReturn)>
			<cfreturn ActivitySpecialtyLMSBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ActivitySpecialtyLMS" type="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMS" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_SpecialtyLMS
				SET
					ActivityID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getActivityID()#" CFSQLType="cf_sql_integer" />,
					SpecialtyID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getSpecialtyID()#" CFSQLType="cf_sql_integer" />,
					Created = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivitySpecialtyLMS.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivitySpecialtyLMS.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivitySpecialtyLMS.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivitySpecialtyLMS.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivitySpecialtyLMS.getDeletedFlag())#" />
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getActivityID()#" CFSQLType="cf_sql_integer" /> AND SpecialtyID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getSpecialtyID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ActivitySpecialtyLMS" type="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMS" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_SpecialtyLMS 
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getActivityID()#" CFSQLType="cf_sql_integer" /> AND SpecialtyID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getSpecialtyID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ActivitySpecialtyLMS" type="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMS" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_SpecialtyLMS
			WHERE	ActivityID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getActivityID()#" CFSQLType="cf_sql_integer" /> AND SpecialtyID = <cfqueryparam value="#arguments.ActivitySpecialtyLMS.getSpecialtyID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ActivitySpecialtyLMS" type="_com.ActivitySpecialtyLMS.ActivitySpecialtyLMS" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ActivitySpecialtyLMS)>
			<cfset success = update(arguments.ActivitySpecialtyLMS) />
		<cfelse>
			<cfset success = create(arguments.ActivitySpecialtyLMS) />
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
