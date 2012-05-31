<cfcomponent displayname="ProcessStepActivityGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ProcessStepActivity.ProcessStepActivityGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="Step_ActivityID" type="numeric" required="false" />
		<cfargument name="StepID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="AssignedToID" type="numeric" required="false" />
		<cfargument name="DueDate" type="date" required="false" />
		<cfargument name="StepStatusID" type="numeric" required="false" />
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
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"Step_ActivityID") and len(arguments.Step_ActivityID)>
			AND	Step_ActivityID = <cfqueryparam value="#arguments.Step_ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"StepID") and len(arguments.StepID)>
			AND	StepID = <cfqueryparam value="#arguments.StepID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssignedToID") and len(arguments.AssignedToID)>
			AND	AssignedToID = <cfqueryparam value="#arguments.AssignedToID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DueDate") and len(arguments.DueDate)>
			AND	DueDate = <cfqueryparam value="#arguments.DueDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"StepStatusID") and len(arguments.StepStatusID)>
			AND	StepStatusID = <cfqueryparam value="#arguments.StepStatusID#" CFSQLType="cf_sql_integer" />
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
		<cfargument name="Step_ActivityID" type="numeric" required="false" />
		<cfargument name="StepID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="AssignedToID" type="numeric" required="false" />
		<cfargument name="DueDate" type="date" required="false" />
		<cfargument name="StepStatusID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="Limit" type="string" default="" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT   
			<cfif Arguments.Limit NEQ "">
			TOP #Arguments.Limit#
			</cfif>
			  PSA.Step_ActivityID, PSA.StepID, PSA.ActivityID, PSA.AssignedToID, PSA.DueDate, PSA.StepStatusID, PSA.Created, PSA.CreatedBy, PSA.Updated, PSA.UpdatedBy, 
                      PSA.Deleted, PSA.DeletedFlag, SS.Name AS StepStatusName, A.Title, P1.lastname + ', ' + P1.firstname AS AssignedToName, 
                      PS.Instructions AS StepInstr, P.Title AS ProcessTitle, PS.Name AS StepName
FROM         ce_ProcessStep_Activity AS PSA INNER JOIN
                      ce_ProcessStep AS PS ON PSA.StepID = PS.StepID INNER JOIN
                      ce_Process AS P ON PS.ProcessID = P.ProcessID LEFT OUTER JOIN
                      ce_Activity AS A ON PSA.ActivityID = A.ActivityID LEFT OUTER JOIN
                      ce_Sys_StepStatus AS SS ON PSA.StepStatusID = SS.StepStatusID LEFT OUTER JOIN
                      dbo.pd_person AS P1 ON PSA.AssignedToID = P1.personid
WHERE     (0 = 0)
		
		<cfif structKeyExists(arguments,"Step_ActivityID") and len(arguments.Step_ActivityID)>
			AND	PSA.Step_ActivityID = <cfqueryparam value="#arguments.Step_ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"StepID") and len(arguments.StepID)>
			AND	PSA.StepID = <cfqueryparam value="#arguments.StepID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	PSA.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssignedToID") and len(arguments.AssignedToID)>
			AND	PSA.AssignedToID = <cfqueryparam value="#arguments.AssignedToID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DueDate") and len(arguments.DueDate)>
			AND	PSA.DueDate = <cfqueryparam value="#arguments.DueDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"StepStatusID") and len(arguments.StepStatusID)>
			AND	PSA.StepStatusID = <cfqueryparam value="#arguments.StepStatusID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	PSA.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	PSA.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	PSA.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	PSA.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	PSA.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	PSA.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
			AND	A.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
