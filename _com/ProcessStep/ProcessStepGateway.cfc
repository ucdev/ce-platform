<cfcomponent displayname="ProcessStepGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ProcessStep.ProcessStepGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="StepID" type="numeric" required="false" />
		<cfargument name="ProcessID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="Instructions" type="string" required="false" />
		<cfargument name="DueDateSetting" type="string" required="false" />
		<cfargument name="DueDate" type="date" required="false" />
		<cfargument name="BeforeOrAfter" type="string" required="false" />
		<cfargument name="RelativeDays" type="numeric" required="false" />
		<cfargument name="WaitingDays" type="numeric" required="false" />
		<cfargument name="NotifyFlag" type="string" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
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
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"StepID") and len(arguments.StepID)>
			AND	StepID = <cfqueryparam value="#arguments.StepID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ProcessID") and len(arguments.ProcessID)>
			AND	ProcessID = <cfqueryparam value="#arguments.ProcessID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Instructions") and len(arguments.Instructions)>
			AND	Instructions = <cfqueryparam value="#arguments.Instructions#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DueDateSetting") and len(arguments.DueDateSetting)>
			AND	DueDateSetting = <cfqueryparam value="#arguments.DueDateSetting#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"DueDate") and len(arguments.DueDate)>
			AND	DueDate = <cfqueryparam value="#arguments.DueDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"BeforeOrAfter") and len(arguments.BeforeOrAfter)>
			AND	BeforeOrAfter = <cfqueryparam value="#arguments.BeforeOrAfter#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"RelativeDays") and len(arguments.RelativeDays)>
			AND	RelativeDays = <cfqueryparam value="#arguments.RelativeDays#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"WaitingDays") and len(arguments.WaitingDays)>
			AND	WaitingDays = <cfqueryparam value="#arguments.WaitingDays#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"NotifyFlag") and len(arguments.NotifyFlag)>
			AND	NotifyFlag = <cfqueryparam value="#arguments.NotifyFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
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

</cfcomponent>
