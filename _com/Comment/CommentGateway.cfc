
<cfcomponent displayname="CommentGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.Comment.CommentGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="CommentID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Comment" type="string" required="false" />
		<cfargument name="ApproveFlag" type="string" required="false" />
		<cfargument name="ApprovedBy" type="numeric" required="false" />
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
				CommentID,
				ActivityID,
				Comment,
				ApproveFlag,
				ApprovedBy,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_Comment
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"CommentID") and len(arguments.CommentID)>
			AND	CommentID = <cfqueryparam value="#arguments.CommentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Comment") and len(arguments.Comment)>
			AND	Comment = <cfqueryparam value="#arguments.Comment#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ApproveFlag") and len(arguments.ApproveFlag)>
			AND	ApproveFlag = <cfqueryparam value="#arguments.ApproveFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ApprovedBy") and len(arguments.ApprovedBy)>
			AND	ApprovedBy = <cfqueryparam value="#arguments.ApprovedBy#" CFSQLType="cf_sql_integer" />
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
		<cfargument name="CommentID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Comment" type="string" required="false" />
		<cfargument name="ApproveFlag" type="string" required="false" />
		<cfargument name="ApprovedBy" type="numeric" required="false" />
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
				C.CommentID,
				C.ActivityID,
				C.Comment,
				C.ApproveFlag,
				C.ApprovedBy,
				C.Created,
				C.CreatedBy,
				C.Updated,
				C.UpdatedBy,
				C.Deleted,
				C.DeletedFlag
			FROM	ce_Comment C
            INNER JOIN ce_Person P ON P.PersonID = C.CreatedBy
			WHERE 
            	P.DeletedFlag = 'N'
		<cfif structKeyExists(arguments,"CommentID") and len(arguments.CommentID)>
			AND	C.CommentID = <cfqueryparam value="#arguments.CommentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	C.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Comment") and len(arguments.Comment)>
			AND	C.Comment = <cfqueryparam value="#arguments.Comment#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ApproveFlag") and len(arguments.ApproveFlag)>
			AND	C.ApproveFlag = <cfqueryparam value="#arguments.ApproveFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ApprovedBy") and len(arguments.ApprovedBy)>
			AND	C.ApprovedBy = <cfqueryparam value="#arguments.ApprovedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	C.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	C.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	C.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	C.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	C.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	C.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>


</cfcomponent>
