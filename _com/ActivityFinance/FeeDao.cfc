
<cfcomponent displayname="FeeDAO" hint="table ID column = FeeID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityFinance.FeeDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Fee" type="_com.ActivityFinance.Fee" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_FinFee
					(
					ActivityID,
					Name,
					DisplayName,
					StartDate,
					EndDate,
					Amount,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Fee.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Fee.getName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Fee.getDisplayName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Fee.getStartDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Fee.getStartDate())#" />,
					<cfqueryparam value="#arguments.Fee.getEndDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Fee.getEndDate())#" />,
					<cfqueryparam value="#arguments.Fee.getAmount()#" CFSQLType="cf_sql_float" />,
					<cfqueryparam value="#arguments.Fee.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Fee.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityFinance.Fee">
		<cfargument name="Fee" type="_com.ActivityFinance.Fee" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					FeeID,
					ActivityID,
					Name,
					DisplayName,
					StartDate,
					EndDate,
					Amount,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Activity_FinFee
				WHERE	FeeID = <cfqueryparam value="#arguments.Fee.getFeeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset FeeBean = arguments.Fee.init(argumentCollection=strReturn)>
			<cfreturn FeeBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Fee" type="_com.ActivityFinance.Fee" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_FinFee
				SET
					ActivityID = <cfqueryparam value="#arguments.Fee.getActivityID()#" CFSQLType="cf_sql_integer" />,
					Name = <cfqueryparam value="#arguments.Fee.getName()#" CFSQLType="cf_sql_varchar" />,
					DisplayName = <cfqueryparam value="#arguments.Fee.getDisplayName()#" CFSQLType="cf_sql_varchar" />,
					StartDate = <cfqueryparam value="#arguments.Fee.getStartDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Fee.getStartDate())#" />,
					EndDate = <cfqueryparam value="#arguments.Fee.getEndDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Fee.getEndDate())#" />,
					Amount = <cfqueryparam value="#arguments.Fee.getAmount()#" CFSQLType="cf_sql_float" />,
					Created = <cfqueryparam value="#arguments.Fee.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Fee.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Fee.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Fee.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.Fee.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Fee.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Fee.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Fee.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Fee.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Fee.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Fee.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Fee.getDeletedFlag())#" />
				WHERE	FeeID = <cfqueryparam value="#arguments.Fee.getFeeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Fee" type="_com.ActivityFinance.Fee" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_FinFee 
				WHERE	FeeID = <cfqueryparam value="#arguments.Fee.getFeeID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Fee" type="_com.ActivityFinance.Fee" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_FinFee
			WHERE	FeeID = <cfqueryparam value="#arguments.Fee.getFeeID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Fee" type="_com.ActivityFinance.Fee" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Fee)>
			<cfset success = update(arguments.Fee) />
		<cfelse>
			<cfset success = create(arguments.Fee) />
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
