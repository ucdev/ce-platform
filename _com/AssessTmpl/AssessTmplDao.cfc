
<cfcomponent displayname="AssessTmplDAO" hint="table ID column = AssessTmplID">

	<cffunction name="init" access="public" output="false" returntype="_com.AssessTmpl.AssessTmplDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AssessTmpl" type="_com.AssessTmpl.AssessTmpl" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_AssessTmpl
					(
					Name,
					AssessmentID,
					AssessTypeID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AssessTmpl.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessTmpl.getName())#" />,
					<cfqueryparam value="#arguments.AssessTmpl.getAssessmentID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.AssessTmpl.getAssessTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessTmpl.getAssessTypeID())#" />,
					<cfqueryparam value="#arguments.AssessTmpl.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessTmpl.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.AssessTmpl.AssessTmpl">
		<cfargument name="AssessTmpl" type="_com.AssessTmpl.AssessTmpl" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AssessTmplID,
					Name,
					AssessmentID,
					AssessTypeID,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_AssessTmpl
				WHERE	AssessTmplID = <cfqueryparam value="#arguments.AssessTmpl.getAssessTmplID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessTmplBean = arguments.AssessTmpl.init(argumentCollection=strReturn)>
			<cfreturn AssessTmplBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AssessTmpl" type="_com.AssessTmpl.AssessTmpl" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AssessTmpl
				SET
					Name = <cfqueryparam value="#arguments.AssessTmpl.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessTmpl.getName())#" />,
					AssessmentID = <cfqueryparam value="#arguments.AssessTmpl.getAssessmentID()#" CFSQLType="cf_sql_integer" />,
					AssessTypeID = <cfqueryparam value="#arguments.AssessTmpl.getAssessTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessTmpl.getAssessTypeID())#" />,
					Created = <cfqueryparam value="#arguments.AssessTmpl.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessTmpl.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.AssessTmpl.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessTmpl.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.AssessTmpl.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessTmpl.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.AssessTmpl.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessTmpl.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.AssessTmpl.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessTmpl.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AssessTmpl.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessTmpl.getDeletedFlag())#" />
				WHERE	AssessTmplID = <cfqueryparam value="#arguments.AssessTmpl.getAssessTmplID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AssessTmpl" type="_com.AssessTmpl.AssessTmpl" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_AssessTmpl 
				WHERE	AssessTmplID = <cfqueryparam value="#arguments.AssessTmpl.getAssessTmplID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AssessTmpl" type="_com.AssessTmpl.AssessTmpl" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AssessTmpl
			WHERE	AssessTmplID = <cfqueryparam value="#arguments.AssessTmpl.getAssessTmplID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AssessTmpl" type="_com.AssessTmpl.AssessTmpl" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AssessTmpl)>
			<cfset success = update(arguments.AssessTmpl) />
		<cfelse>
			<cfset success = create(arguments.AssessTmpl) />
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
