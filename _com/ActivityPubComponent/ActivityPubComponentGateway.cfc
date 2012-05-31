<cfcomponent displayname="ActivityPubComponentGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityPubComponent.ActivityPubComponentGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="PubComponentID" type="numeric" required="false" />
		<cfargument name="ComponentID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="DisplayName" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ExternalURL" type="string" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="FileID" type="numeric" required="false" />
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
				PubComponentID,
				ComponentID,
				ActivityID,
				Sort,
				DisplayName,
				Description,
				ExternalURL,
				AssessmentID,
				FileID,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_Activity_PubComponent
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PubComponentID") and len(arguments.PubComponentID)>
			AND	PubComponentID = <cfqueryparam value="#arguments.PubComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ComponentID") and len(arguments.ComponentID)>
			AND	ComponentID = <cfqueryparam value="#arguments.ComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DisplayName") and len(arguments.DisplayName)>
			AND	DisplayName = <cfqueryparam value="#arguments.DisplayName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExternalURL") and len(arguments.ExternalURL)>
			AND	ExternalURL = <cfqueryparam value="#arguments.ExternalURL#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
			AND	FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_integer" />
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
	
	<cffunction name="getByCompleteAttributes" access="public" output="false" returntype="query">
		<cfargument name="PubComponentID" type="numeric" required="false" />
		<cfargument name="ComponentID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="DisplayName" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ExternalURL" type="string" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="FileID" type="numeric" required="false" />
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
				apc.PubComponentID,
				apc.ComponentID,
				apc.ActivityID,
				apc.Sort,
				apc.DisplayName,
				apc.Description,
				apc.ExternalURL,
				apc.AssessmentID,
				apc.FileID,
				apc.Created,
				apc.CreatedBy,
				apc.Updated,
				apc.UpdatedBy,
				apc.Deleted,
				apc.DeletedFlag,
                sc.Name AS ComponentName,
                f.FileSize,
                f.FileName
			FROM	ce_Activity_PubComponent apc
            INNER JOIN ce_Sys_Component sc ON sc.ComponentID = apc.ComponentID
            LEFT JOIN ce_File f ON f.FileID = apc.FileID
			WHERE	AssessmentID IS NOT NULL
		
		<cfif structKeyExists(arguments,"PubComponentID") and len(arguments.PubComponentID)>
			AND	apc.PubComponentID = <cfqueryparam value="#arguments.PubComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ComponentID") and len(arguments.ComponentID)>
			AND	apc.ComponentID = <cfqueryparam value="#arguments.ComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	apc.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	apc.Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DisplayName") and len(arguments.DisplayName)>
			AND	apc.DisplayName = <cfqueryparam value="#arguments.DisplayName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	apc.Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExternalURL") and len(arguments.ExternalURL)>
			AND	apc.ExternalURL = <cfqueryparam value="#arguments.ExternalURL#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	apc.AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
			AND	apc.FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	apc.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	apc.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	apc.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	apc.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	apc.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="PubComponentID" type="numeric" required="false" />
		<cfargument name="ComponentID" type="numeric" required="false" />
		<cfargument name="ComponentIDin" type="string" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="SortFlag" type="string" required="false" />
		<cfargument name="DisplayName" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ExternalURL" type="string" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="FileID" type="numeric" required="false" />
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
				PC.PubComponentID, 
				PC.ComponentID, 
				C.Name AS ComponentName, 
				C.Description AS ComponentDesc, 
				C.TypeCode AS ComponentType, 
				C.SortFlag, 
				PC.ActivityID, 
				PC.Sort, 
				PC.DisplayName, 
				PC.Description, 
				PC.ExternalURL, 
				PC.AssessmentID, 
				A.AssessTypeID, 
				AT.Name AS AssessTypeName, 
				A.Name AS AssessmentName, 
				A.Description AS AssessmentDesc, 
				A.PassingScore, 
				A.MaxAttempts, 
				A.RequiredFlag, 
				A.RandomFlag, 
				A.CommentFlag, 
				(SELECT Count(Q.QuestionID) As QuestionCount FROM ce_AssessQuestion Q WHERE Q.QuestionTypeID NOT IN (5,6,7) AND Q.AssessmentID=A.AssessmentID AND Q.DeletedFlag='N') As QuestionCount,
				PC.FileID, 
				F.FileName, 
				F.FileCaption, 
				F.FileSize, 
				PC.Created, 
				PC.CreatedBy, 
				PC.Updated, 
				PC.UpdatedBy, 
				PC.Deleted, 
				PC.DeletedFlag
			FROM
				ce_Sys_AssessType AS AT 
			INNER JOIN
				  ce_Assessment AS A ON AT.AssessTypeID = A.AssessTypeID 
			RIGHT OUTER JOIN
				  ce_Activity_PubComponent AS PC 
			INNER JOIN
				  ce_Sys_Component AS C ON PC.ComponentID = C.ComponentID ON A.AssessmentID = PC.AssessmentID 
			LEFT OUTER JOIN
				  ce_File AS F ON PC.FileID = F.FileID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PubComponentID") and len(arguments.PubComponentID)>
			AND	PC.PubComponentID = <cfqueryparam value="#arguments.PubComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"SortFlag") and len(arguments.SortFlag)>
			AND	C.SortFlag = <cfqueryparam value="#arguments.SortFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ComponentID") and len(arguments.ComponentID)>
			AND	PC.ComponentID = <cfqueryparam value="#arguments.ComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ComponentIDin") and len(arguments.ComponentIDin)>
			AND	PC.ComponentID IN (#arguments.ComponentIDin#)
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	PC.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	PC.Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DisplayName") and len(arguments.DisplayName)>
			AND	PC.DisplayName = <cfqueryparam value="#arguments.DisplayName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	PC.Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExternalURL") and len(arguments.ExternalURL)>
			AND	PC.ExternalURL = <cfqueryparam value="#arguments.ExternalURL#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	PC.AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
			AND	PC.FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	PC.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	PC.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	PC.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	PC.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	PC.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	PC.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByViewAttributesLMS" access="public" output="false" returntype="query">
		<cfargument name="PubComponentID" type="numeric" required="false" />
		<cfargument name="ComponentID" type="numeric" required="false" />
		<cfargument name="ComponentIDin" type="string" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="DisplayName" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ExternalURL" type="string" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="FileID" type="numeric" required="false" />
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
				apc.PubComponentID,
				apc.ComponentID,
				apc.ActivityID,
				apc.Sort,
				apc.DisplayName,
				apc.Description,
				apc.ExternalURL,
				apc.AssessmentID,
				apc.FileID,
				apc.Created,
				apc.CreatedBy,
				apc.Updated,
				apc.UpdatedBy,
				apc.Deleted,
				apc.DeletedFlag,
                sc.Name AS ComponentName,
                f.FileSize,
                f.FileName
			FROM	ce_Activity_PubComponent apc
            INNER JOIN ce_Sys_Component sc ON sc.ComponentID = apc.ComponentID
            LEFT JOIN ce_File f ON f.FileID = apc.FileID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PubComponentID") and len(arguments.PubComponentID)>
			AND	apc.PubComponentID = <cfqueryparam value="#arguments.PubComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ComponentID") and len(arguments.ComponentID)>
			AND	apc.ComponentID = <cfqueryparam value="#arguments.ComponentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ComponentIDin") and len(arguments.ComponentIDin)>
			AND	apc.ComponentID IN (#arguments.ComponentIDin#)
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	apc.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	apc.Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DisplayName") and len(arguments.DisplayName)>
			AND	apc.DisplayName = <cfqueryparam value="#arguments.DisplayName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	apc.Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExternalURL") and len(arguments.ExternalURL)>
			AND	apc.ExternalURL = <cfqueryparam value="#arguments.ExternalURL#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	apc.AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
			AND	apc.FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	apc.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	apc.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	apc.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	apc.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	apc.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>
