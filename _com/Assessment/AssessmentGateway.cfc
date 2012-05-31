<cfcomponent displayname="AssessmentGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Assessment.AssessmentGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="AssessTypeID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="PassingScore" type="numeric" required="false" />
		<cfargument name="MaxAttempts" type="numeric" required="false" />
		<cfargument name="RequiredFlag" type="string" required="false" />
		<cfargument name="RandomFlag" type="string" required="false" />
		<cfargument name="CommentFlag" type="string" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="string" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
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
				CreatedBy,
				Created,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_Assessment
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessTypeID") and len(arguments.AssessTypeID)>
			AND	AssessTypeID = <cfqueryparam value="#arguments.AssessTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PassingScore") and len(arguments.PassingScore)>
			AND	PassingScore = <cfqueryparam value="#arguments.PassingScore#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"MaxAttempts") and len(arguments.MaxAttempts)>
			AND	MaxAttempts = <cfqueryparam value="#arguments.MaxAttempts#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"RequiredFlag") and len(arguments.RequiredFlag)>
			AND	RequiredFlag = <cfqueryparam value="#arguments.RequiredFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"RandomFlag") and len(arguments.RandomFlag)>
			AND	RandomFlag = <cfqueryparam value="#arguments.RandomFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CommentFlag") and len(arguments.CommentFlag)>
			AND	CommentFlag = <cfqueryparam value="#arguments.CommentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_char" />
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
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="AssessTypeID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="PassingScore" type="numeric" required="false" />
		<cfargument name="MaxAttempts" type="numeric" required="false" />
		<cfargument name="RequiredFlag" type="string" required="false" />
		<cfargument name="RandomFlag" type="string" required="false" />
		<cfargument name="CommentFlag" type="string" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="string" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT	A.AssessmentID, 
            		A.AssessTypeID, 
                    A.Name, 
                    A.Description, 
                    A.PassingScore,
                    A.MaxAttempts, 
                    A.RequiredFlag,
                    A.RandomFlag, 
                    A.CommentFlag, 
                    A.Sort, 
                    A.ActivityID, 
			  		A.CreatedBy, 
                    A.Created, 
                    A.Updated, 
                    A.UpdatedBy, 
                    A.Deleted, 
                    A.DeletedFlag, 
                    AT.Name AS AssessTypeName
			FROM	ce_Assessment AS A 
            INNER JOIN ce_Sys_AssessType AS AT ON A.AssessTypeID = AT.AssessTypeID
			WHERE	0=0
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	A.AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessTypeID") and len(arguments.AssessTypeID)>
			AND	A.AssessTypeID = <cfqueryparam value="#arguments.AssessTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	A.Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	A.Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PassingScore") and len(arguments.PassingScore)>
			AND	A.PassingScore = <cfqueryparam value="#arguments.PassingScore#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"MaxAttempts") and len(arguments.MaxAttempts)>
			AND	A.MaxAttempts = <cfqueryparam value="#arguments.MaxAttempts#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"RequiredFlag") and len(arguments.RequiredFlag)>
			AND	A.RequiredFlag = <cfqueryparam value="#arguments.RequiredFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"RandomFlag") and len(arguments.RandomFlag)>
			AND	A.RandomFlag = <cfqueryparam value="#arguments.RandomFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CommentFlag") and len(arguments.CommentFlag)>
			AND	A.CommentFlag = <cfqueryparam value="#arguments.CommentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	A.Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	A.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	A.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	A.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	A.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	A.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	A.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	A.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
