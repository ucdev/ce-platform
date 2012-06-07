<cfcomponent displayname="AssessmentDAO" hint="table ID column = AssessmentID">

	<cffunction name="init" access="public" output="false" returntype="_com.Assessment.AssessmentDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Assessment" type="_com.Assessment.Assessment" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Assessment
					(
					AssessTypeID,
					Name,
					Description,
					PassingScore,
					MaxAttempts,
					RequiredFlag,
					RandomFlag,
					CommentFlag,
					Sort,
					ActivityID,
					ExternalID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Assessment.getAssessTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getAssessTypeID())#" />,
					<cfqueryparam value="#arguments.Assessment.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Assessment.getName())#" />,
					<cfqueryparam value="#arguments.Assessment.getDescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.Assessment.getDescription())#" />,
					<cfqueryparam value="#arguments.Assessment.getPassingScore()#" CFSQLType="cf_sql_float" null="#not len(arguments.Assessment.getPassingScore())#" />,
					<cfqueryparam value="#arguments.Assessment.getMaxAttempts()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getMaxAttempts())#" />,
					<cfqueryparam value="#arguments.Assessment.getRequiredFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getRequiredFlag())#" />,
					<cfqueryparam value="#arguments.Assessment.getRandomFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getRandomFlag())#" />,
					<cfqueryparam value="#arguments.Assessment.getCommentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getCommentFlag())#" />,
					<cfqueryparam value="#arguments.Assessment.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getSort())#" />,
					<cfqueryparam value="#arguments.Assessment.getActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getActivityID())#" />,
					<cfqueryparam value="#arguments.Assessment.getExternalID()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Assessment.getExternalID())#" />,
					<cfqueryparam value="#arguments.Assessment.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Assessment.Assessment">
		<cfargument name="Assessment" type="_com.Assessment.Assessment" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AssessmentID,
					AssessTypeID,
					Name,
					Description,
					PassingScore,
					MaxAttempts,
					RequiredFlag,
					RandomFlag,
					CommentFlag,
					Sort,
					ActivityID,
					ExternalID,
					CreatedBy,
					Created,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Assessment
				WHERE	AssessmentID = <cfqueryparam value="#arguments.Assessment.getAssessmentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessmentBean = arguments.Assessment.init(argumentCollection=strReturn)>
			<cfreturn AssessmentBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Assessment" type="_com.Assessment.Assessment" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Assessment
				SET
					AssessTypeID = <cfqueryparam value="#arguments.Assessment.getAssessTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getAssessTypeID())#" />,
					Name = <cfqueryparam value="#arguments.Assessment.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Assessment.getName())#" />,
					Description = <cfqueryparam value="#arguments.Assessment.getDescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.Assessment.getDescription())#" />,
					PassingScore = <cfqueryparam value="#arguments.Assessment.getPassingScore()#" CFSQLType="cf_sql_float" null="#not len(arguments.Assessment.getPassingScore())#" />,
					MaxAttempts = <cfqueryparam value="#arguments.Assessment.getMaxAttempts()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getMaxAttempts())#" />,
					RequiredFlag = <cfqueryparam value="#arguments.Assessment.getRequiredFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getRequiredFlag())#" />,
					RandomFlag = <cfqueryparam value="#arguments.Assessment.getRandomFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getRandomFlag())#" />,
					CommentFlag = <cfqueryparam value="#arguments.Assessment.getCommentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getCommentFlag())#" />,
					Sort = <cfqueryparam value="#arguments.Assessment.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getSort())#" />,
					ActivityID = <cfqueryparam value="#arguments.Assessment.getActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getActivityID())#" />,
					ExternalID = <cfqueryparam value="#arguments.Assessment.getExternalID()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Assessment.getExternalID())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Assessment.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Assessment.getCreatedBy())#" />,
					Created = <cfqueryparam value="#arguments.Assessment.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Assessment.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.Assessment.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Assessment.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Assessment.getUpdatedBy()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Assessment.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Assessment.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Assessment.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Assessment.getDeletedFlag())#" />
				WHERE	AssessmentID = <cfqueryparam value="#arguments.Assessment.getAssessmentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Assessment" type="_com.Assessment.Assessment" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Assessment 
				WHERE	AssessmentID = <cfqueryparam value="#arguments.Assessment.getAssessmentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Assessment" type="_com.Assessment.Assessment" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Assessment
			WHERE	AssessmentID = <cfqueryparam value="#arguments.Assessment.getAssessmentID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Assessment" type="_com.Assessment.Assessment" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Assessment)>
			<cfset success = update(arguments.Assessment) />
		<cfelse>
			<cfset success = create(arguments.Assessment) />
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
