<cfcomponent displayname="ProcessStepDAO" hint="table ID column = StepID">

	<cffunction name="init" access="public" output="false" returntype="_com.ProcessStep.ProcessStepDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStep" type="_com.ProcessStep.ProcessStep" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_ProcessStep
					(
					ProcessID,
					Name,
					Description,
					Instructions,
					DueDateSetting,
					DueDate,
					BeforeOrAfter,
					RelativeDays,
					WaitingDays,
					NotifyFlag,
					Sort,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ProcessStep.getProcessID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ProcessStep.getName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.ProcessStep.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProcessStep.getDescription())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getInstructions()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProcessStep.getInstructions())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getDueDateSetting()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStep.getDueDateSetting())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getDueDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStep.getDueDate())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getBeforeOrAfter()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStep.getBeforeOrAfter())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getRelativeDays()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStep.getRelativeDays())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getWaitingDays()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStep.getWaitingDays())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getNotifyFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStep.getNotifyFlag())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStep.getSort())#" />,
					<cfqueryparam value="#arguments.ProcessStep.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ProcessStep.ProcessStep">
		<cfargument name="ProcessStep" type="_com.ProcessStep.ProcessStep" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					StepID,
					ProcessID,
					Name,
					Description,
					Instructions,
					DueDateSetting,
					DueDate,
					BeforeOrAfter,
					RelativeDays,
					WaitingDays,
					NotifyFlag,
					Sort,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_ProcessStep
				WHERE	StepID = <cfqueryparam value="#arguments.ProcessStep.getStepID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ProcessStepBean = arguments.ProcessStep.init(argumentCollection=strReturn)>
			<cfreturn ProcessStepBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStep" type="_com.ProcessStep.ProcessStep" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_ProcessStep
				SET
					ProcessID = <cfqueryparam value="#arguments.ProcessStep.getProcessID()#" CFSQLType="cf_sql_integer" />,
					Name = <cfqueryparam value="#arguments.ProcessStep.getName()#" CFSQLType="cf_sql_varchar" />,
					Description = <cfqueryparam value="#arguments.ProcessStep.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProcessStep.getDescription())#" />,
					Instructions = <cfqueryparam value="#arguments.ProcessStep.getInstructions()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ProcessStep.getInstructions())#" />,
					DueDateSetting = <cfqueryparam value="#arguments.ProcessStep.getDueDateSetting()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStep.getDueDateSetting())#" />,
					DueDate = <cfqueryparam value="#arguments.ProcessStep.getDueDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStep.getDueDate())#" />,
					BeforeOrAfter = <cfqueryparam value="#arguments.ProcessStep.getBeforeOrAfter()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStep.getBeforeOrAfter())#" />,
					RelativeDays = <cfqueryparam value="#arguments.ProcessStep.getRelativeDays()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStep.getRelativeDays())#" />,
					WaitingDays = <cfqueryparam value="#arguments.ProcessStep.getWaitingDays()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStep.getWaitingDays())#" />,
					NotifyFlag = <cfqueryparam value="#arguments.ProcessStep.getNotifyFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStep.getNotifyFlag())#" />,
					Sort = <cfqueryparam value="#arguments.ProcessStep.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStep.getSort())#" />,
					Created = <cfqueryparam value="#arguments.ProcessStep.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStep.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.ProcessStep.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.ProcessStep.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStep.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.ProcessStep.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ProcessStep.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.ProcessStep.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ProcessStep.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.ProcessStep.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ProcessStep.getDeletedFlag())#" />
				WHERE	StepID = <cfqueryparam value="#arguments.ProcessStep.getStepID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStep" type="_com.ProcessStep.ProcessStep" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_ProcessStep 
				WHERE	StepID = <cfqueryparam value="#arguments.ProcessStep.getStepID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStep" type="_com.ProcessStep.ProcessStep" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_ProcessStep
			WHERE	StepID = <cfqueryparam value="#arguments.ProcessStep.getStepID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ProcessStep" type="_com.ProcessStep.ProcessStep" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ProcessStep)>
			<cfset success = update(arguments.ProcessStep) />
		<cfelse>
			<cfset success = create(arguments.ProcessStep) />
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
