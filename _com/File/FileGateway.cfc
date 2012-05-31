
<cfcomponent displayname="FileGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.File.FileGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="FileID" type="numeric" required="false" />
		<cfargument name="FileName" type="string" required="false" />
		<cfargument name="FileCaption" type="string" required="false" />
		<cfargument name="FileSize" type="numeric" required="false" />
		<cfargument name="FileTypeID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
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
				FileID,
				FileName,
				FileCaption,
				FileSize,
				FileTypeID,
				PersonID,
				ActivityID,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_File
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
			AND	FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FileName") and len(arguments.FileName)>
			AND	FileName = <cfqueryparam value="#arguments.FileName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileCaption") and len(arguments.FileCaption)>
			AND	FileCaption = <cfqueryparam value="#arguments.FileCaption#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileSize") and len(arguments.FileSize)>
			AND	FileSize = <cfqueryparam value="#arguments.FileSize#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"FileTypeID") and len(arguments.FileTypeID)>
			AND	FileTypeID = <cfqueryparam value="#arguments.FileTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
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
		<cfargument name="FileID" type="numeric" required="false" />
		<cfargument name="FileName" type="string" required="false" />
		<cfargument name="FileCaption" type="string" required="false" />
		<cfargument name="FileSize" type="numeric" required="false" />
		<cfargument name="FileTypeID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="UpdatedBy" type="numeric" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT  f.FileID, 
					f.FileName, 
					f.FileCaption, 
					f.FileSize, 
					f.FileTypeID, 
					f.PersonID, 
					f.ActivityID, 
					f.Created, 
					f.CreatedBy, 
					f.Updated, 
					f.UpdatedBy, 
					f.Deleted, 
					f.DeletedFlag, 
                    p1.firstname AS CreatedByFName, 
					p1.lastname AS CreatedByLName, 
					p2.firstname AS UpdatedByFName, 
					p2.lastname AS UpdatedByLName, 
                    ft.Name AS FileTypeName,
                    (SELECT COUNT(APC.PubComponentID)
                     FROM ce_Activity_PubComponent APC
                     WHERE 
						APC.ActivityID = F.ActivityID AND
						APC.FileID = F.FileID AND
						APC.DeletedFlag = 'N') AS ComponentCount
			FROM ce_File AS f 
			LEFT OUTER JOIN ce_person AS p1 ON p1.personid = f.CreatedBy 
			LEFT OUTER JOIN ce_person AS p2 ON p2.personid = f.UpdatedBy 
			LEFT OUTER JOIN ce_Sys_FileType AS ft ON ft.FileTypeID = f.FileTypeID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"FileID") and len(arguments.FileID)>
			AND	f.FileID = <cfqueryparam value="#arguments.FileID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"FileName") and len(arguments.FileName)>
			AND	f.FileName = <cfqueryparam value="#arguments.FileName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileCaption") and len(arguments.FileCaption)>
			AND	f.FileCaption = <cfqueryparam value="#arguments.FileCaption#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"FileSize") and len(arguments.FileSize)>
			AND	f.FileSize = <cfqueryparam value="#arguments.FileSize#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"FileTypeID") and len(arguments.FileTypeID)>
			AND	f.FileTypeID = <cfqueryparam value="#arguments.FileTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	f.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	f.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	f.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	f.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	f.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	f.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	f.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	f.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>
