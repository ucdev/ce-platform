
<cfcomponent displayname="BudgetDAO" hint="table ID column = BudgetID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityFinance.BudgetDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Budget" type="_com.ActivityFinance.Budget" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_FinBudget
					(
					ActivityID,
					Description,
					EntryTypeID,
					Amount,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Budget.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Budget.getDescription()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Budget.getEntryTypeID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Budget.getAmount()#" CFSQLType="cf_sql_float" />,
					<cfqueryparam value="#arguments.Budget.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Budget.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityFinance.Budget">
		<cfargument name="Budget" type="_com.ActivityFinance.Budget" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					BudgetID,
					ActivityID,
					Description,
					EntryTypeID,
					Amount,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Activity_FinBudget
				WHERE	BudgetID = <cfqueryparam value="#arguments.Budget.getBudgetID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset BudgetBean = arguments.Budget.init(argumentCollection=strReturn)>
			<cfreturn BudgetBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Budget" type="_com.ActivityFinance.Budget" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_FinBudget
				SET
					ActivityID = <cfqueryparam value="#arguments.Budget.getActivityID()#" CFSQLType="cf_sql_integer" />,
					Description = <cfqueryparam value="#arguments.Budget.getDescription()#" CFSQLType="cf_sql_varchar" />,
					EntryTypeID = <cfqueryparam value="#arguments.Budget.getEntryTypeID()#" CFSQLType="cf_sql_integer" />,
					Amount = <cfqueryparam value="#arguments.Budget.getAmount()#" CFSQLType="cf_sql_float" />,
					Created = <cfqueryparam value="#arguments.Budget.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Budget.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Budget.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Budget.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.Budget.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Budget.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Budget.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Budget.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Budget.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Budget.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Budget.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Budget.getDeletedFlag())#" />
				WHERE	BudgetID = <cfqueryparam value="#arguments.Budget.getBudgetID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Budget" type="_com.ActivityFinance.Budget" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_FinBudget 
				WHERE	BudgetID = <cfqueryparam value="#arguments.Budget.getBudgetID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Budget" type="_com.ActivityFinance.Budget" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_FinBudget
			WHERE	BudgetID = <cfqueryparam value="#arguments.Budget.getBudgetID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Budget" type="_com.ActivityFinance.Budget" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Budget)>
			<cfset success = update(arguments.Budget) />
		<cfelse>
			<cfset success = create(arguments.Budget) />
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
