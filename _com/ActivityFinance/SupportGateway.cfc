
<cfcomponent displayname="SupportGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityFinance.SupportGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="SupportID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="SupporterID" type="numeric" required="false" />
		<cfargument name="SupportTypeID" type="numeric" required="false" />
		<cfargument name="Amount" type="numeric" required="false" />
		<cfargument name="ContractNum" type="string" required="false" />
		<cfargument name="BudgetRequested" type="string" required="false" />
		<cfargument name="BudgetDueDate" type="date" required="false" />
		<cfargument name="BudgetSentDate" type="date" required="false" />
		<cfargument name="SentDate" type="date" required="false" />
		<cfargument name="FundsReturned" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
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
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"SupportID") and len(arguments.SupportID)>
			AND	SupportID = <cfqueryparam value="#arguments.SupportID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SupporterID") and len(arguments.SupporterID)>
			AND	SupporterID = <cfqueryparam value="#arguments.SupporterID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SupportTypeID") and len(arguments.SupportTypeID)>
			AND	SupportTypeID = <cfqueryparam value="#arguments.SupportTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Amount") and len(arguments.Amount)>
			AND	Amount = <cfqueryparam value="#arguments.Amount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"ContractNum") and len(arguments.ContractNum)>
			AND	ContractNum = <cfqueryparam value="#arguments.ContractNum#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"BudgetRequested") and len(arguments.BudgetRequested)>
			AND	BudgetRequested = <cfqueryparam value="#arguments.BudgetRequested#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"BudgetDueDate") and len(arguments.BudgetDueDate)>
			AND	BudgetDueDate = <cfqueryparam value="#arguments.BudgetDueDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"BudgetSentDate") and len(arguments.BudgetSentDate)>
			AND	BudgetSentDate = <cfqueryparam value="#arguments.BudgetSentDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"SentDate") and len(arguments.SentDate)>
			AND	SentDate = <cfqueryparam value="#arguments.SentDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"FundsReturned") and len(arguments.FundsReturned)>
			AND	FundsReturned = <cfqueryparam value="#arguments.FundsReturned#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="SupportID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="SupporterID" type="numeric" required="false" />
		<cfargument name="SupportTypeID" type="numeric" required="false" />
		<cfargument name="Amount" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT	afs.SupportID,
					afs.ActivityID,
					afs.SupporterID,
					afs.SupportTypeID,
					afs.Amount,
					afs.ContractNum,
					afs.BudgetRequested,
					afs.BudgetDueDate,
					afs.BudgetSentDate,
					afs.SentDate,
					afs.FundsReturned,
					afs.Created,
					afs.CreatedBy,
					afs.Updated,
					afs.UpdatedBy,
					afs.Deleted,
					afs.DeletedFlag AS FinSupportDeletedFlag,
					ss.Name AS SupporterName,
					sst.Name AS SupportTypeName,
					p1.firstname AS CreatedByFName, 
					p1.lastname AS CreateByLName, 
					p2.firstname AS UpdatedByFName, 
		            p2.lastname AS UpdatedByLName
			FROM	ce_Activity_FinSupport afs
			LEFT OUTER JOIN ce_Sys_Supporter ss ON ss.ContributorID = afs.SupporterID
			LEFT OUTER JOIN ce_Sys_SupportType sst ON sst.ContribTypeID = afs.SupportTypeID
			LEFT OUTER JOIN ce_person AS p1 ON p1.personid = afs.CreatedBy 
			LEFT OUTER JOIN ce_person AS p2 ON p2.personid = afs.UpdatedBy
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"SupportID") and len(arguments.SupportID)>
			AND	afs.SupportID = <cfqueryparam value="#arguments.SupportID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	afs.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SupporterID") and len(arguments.SupporterID)>
			AND	afs.SupporterID = <cfqueryparam value="#arguments.SupporterID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SupportTypeID") and len(arguments.SupportTypeID)>
			AND	afs.SupportTypeID = <cfqueryparam value="#arguments.SupportTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Amount") and len(arguments.Amount)>
			AND	afs.Amount = <cfqueryparam value="#arguments.Amount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	afs.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	afs.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	afs.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	afs.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	afs.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	afs.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>
