<cfcomponent displayname="ProcessStepActivityDAO" hint="table ID column = Step_ActivityID">

	<cffunction name="init" access="public" output="false" returntype="_com.ProcessStepActivity.ProcessStepActivityDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStepActivity" type="_com.ProcessStepActivity.ProcessStepActivity" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_ProcessStep_Activity
					(
					StepID,
					ActivityID,
					AssignedToID,
					DueDate,
					StepStatusID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ProcessStepActivity.getStepID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ProcessStepActivity.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ProcessStepActivity.getAssignedToID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStepActivity.getAssignedToID())#" />,
					<cfqueryparam value="#arguments.ProcessStepActivity.getDueDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStepActivity.getDueDate())#" />,
					<cfqueryparam value="#arguments.ProcessStepActivity.getStepStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStepActivity.getStepStatusID())#" />,
					<cfqueryparam value="#arguments.ProcessStepActivity.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ProcessStepActivity.ProcessStepActivity">
		<cfargument name="ProcessStepActivity" type="_com.ProcessStepActivity.ProcessStepActivity" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					Step_ActivityID,
					StepID,
					ActivityID,
					AssignedToID,
					DueDate,
					StepStatusID,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_ProcessStep_Activity
				WHERE	Step_ActivityID = <cfqueryparam value="#arguments.ProcessStepActivity.getStep_ActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ProcessStepActivityBean = arguments.ProcessStepActivity.init(argumentCollection=strReturn)>
			<cfreturn ProcessStepActivityBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStepActivity" type="_com.ProcessStepActivity.ProcessStepActivity" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_ProcessStep_Activity
				SET
					StepID = <cfqueryparam value="#arguments.ProcessStepActivity.getStepID()#" CFSQLType="cf_sql_integer" />,
					ActivityID = <cfqueryparam value="#arguments.ProcessStepActivity.getActivityID()#" CFSQLType="cf_sql_integer" />,
					AssignedToID = <cfqueryparam value="#arguments.ProcessStepActivity.getAssignedToID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStepActivity.getAssignedToID())#" />,
					DueDate = <cfqueryparam value="#arguments.ProcessStepActivity.getDueDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStepActivity.getDueDate())#" />,
					StepStatusID = <cfqueryparam value="#arguments.ProcessStepActivity.getStepStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStepActivity.getStepStatusID())#" />,
					Created = <cfqueryparam value="#arguments.ProcessStepActivity.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStepActivity.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.ProcessStepActivity.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.ProcessStepActivity.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStepActivity.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.ProcessStepActivity.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStepActivity.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.ProcessStepActivity.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStepActivity.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.ProcessStepActivity.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStepActivity.getDeletedFlag())#" />
				WHERE	Step_ActivityID = <cfqueryparam value="#arguments.ProcessStepActivity.getStep_ActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStepActivity" type="_com.ProcessStepActivity.ProcessStepActivity" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_ProcessStep_Activity 
				WHERE	Step_ActivityID = <cfqueryparam value="#arguments.ProcessStepActivity.getStep_ActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStepActivity" type="_com.ProcessStepActivity.ProcessStepActivity" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_ProcessStep_Activity
			WHERE	Step_ActivityID = <cfqueryparam value="#arguments.ProcessStepActivity.getStep_ActivityID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStepActivity" type="_com.ProcessStepActivity.ProcessStepActivity" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ProcessStepActivity)>
			<cfset success = update(arguments.ProcessStepActivity) />
		<cfelse>
			<cfset success = create(arguments.ProcessStepActivity) />
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
