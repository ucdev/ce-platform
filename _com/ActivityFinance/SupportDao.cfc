
<cfcomponent displayname="SupportDAO" hint="table ID column = SupportID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityFinance.SupportDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Support" type="_com.ActivityFinance.Support" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_FinSupport
					(
					ActivityID,
					SupporterID,
					SupportTypeID,
					Amount,
					ContractNum,
					BudgetRequested,
					BudgetDueDate,
					BudgetSentDate,
					SentDate,
					FundsReturned,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Support.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Support.getSupporterID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Support.getSupportTypeID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Support.getAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.Support.getAmount())#" />,
					<cfqueryparam value="#arguments.Support.getContractNum()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Support.getContractNum())#" />,
					<cfqueryparam value="#arguments.Support.getBudgetRequested()#" CFSQLType="cf_sql_char" null="#not len(arguments.Support.getBudgetRequested())#" />,
					<cfqueryparam value="#arguments.Support.getBudgetDueDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getBudgetDueDate())#" />,
					<cfqueryparam value="#arguments.Support.getBudgetSentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getBudgetSentDate())#" />,
					<cfqueryparam value="#arguments.Support.getSentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getSentDate())#" />,
					<cfqueryparam value="#arguments.Support.getFundsReturned()#" CFSQLType="cf_sql_float" null="#not len(arguments.Support.getFundsReturned())#" />,
					<cfqueryparam value="#arguments.Support.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Support.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityFinance.Support">
		<cfargument name="Support" type="_com.ActivityFinance.Support" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					SupportID,
					ActivityID,
					SupporterID,
					SupportTypeID,
					Amount,
					ContractNum,
					BudgetRequested,
					BudgetDueDate,
					BudgetSentDate,
					SentDate,
					FundsReturned,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Activity_FinSupport
				WHERE	SupportID = <cfqueryparam value="#arguments.Support.getSupportID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset SupportBean = arguments.Support.init(argumentCollection=strReturn)>
			<cfreturn SupportBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Support" type="_com.ActivityFinance.Support" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_FinSupport
				SET
					ActivityID = <cfqueryparam value="#arguments.Support.getActivityID()#" CFSQLType="cf_sql_integer" />,
					SupporterID = <cfqueryparam value="#arguments.Support.getSupporterID()#" CFSQLType="cf_sql_integer" />,
					SupportTypeID = <cfqueryparam value="#arguments.Support.getSupportTypeID()#" CFSQLType="cf_sql_integer" />,
					Amount = <cfqueryparam value="#arguments.Support.getAmount()#" CFSQLType="cf_sql_float" null="#not len(arguments.Support.getAmount())#" />,
					ContractNum = <cfqueryparam value="#arguments.Support.getContractNum()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Support.getContractNum())#" />,
					BudgetRequested = <cfqueryparam value="#arguments.Support.getBudgetRequested()#" CFSQLType="cf_sql_char" null="#not len(arguments.Support.getBudgetRequested())#" />,
					BudgetDueDate = <cfqueryparam value="#arguments.Support.getBudgetDueDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getBudgetDueDate())#" />,
					BudgetSentDate = <cfqueryparam value="#arguments.Support.getBudgetSentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getBudgetSentDate())#" />,
					SentDate = <cfqueryparam value="#arguments.Support.getSentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getSentDate())#" />,
					FundsReturned = <cfqueryparam value="#arguments.Support.getFundsReturned()#" CFSQLType="cf_sql_float" null="#not len(arguments.Support.getFundsReturned())#" />,
					Created = <cfqueryparam value="#arguments.Support.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Support.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Support.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.Support.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Support.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Support.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Support.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Support.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Support.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Support.getDeletedFlag())#" />
				WHERE	SupportID = <cfqueryparam value="#arguments.Support.getSupportID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Support" type="_com.ActivityFinance.Support" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_FinSupport 
				WHERE	SupportID = <cfqueryparam value="#arguments.Support.getSupportID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Support" type="_com.ActivityFinance.Support" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_FinSupport
			WHERE	SupportID = <cfqueryparam value="#arguments.Support.getSupportID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Support" type="_com.ActivityFinance.Support" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Support)>
			<cfset success = update(arguments.Support) />
		<cfelse>
			<cfset success = create(arguments.Support) />
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
