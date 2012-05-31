<cfcomponent displayname="ActivityCategoryGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityCategory.ActivityCategoryGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="Activity_CategoryID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CategoryID" type="numeric" required="false" />
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
				Activity_CategoryID,
				ActivityID,
				CategoryID,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_Activity_Category
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"Activity_CategoryID") and len(arguments.Activity_CategoryID)>
			AND	Activity_CategoryID = <cfqueryparam value="#arguments.Activity_CategoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID)>
			AND	CategoryID = <cfqueryparam value="#arguments.CategoryID#" CFSQLType="cf_sql_integer" />
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
	
	<cffunction name="getByPIFList" access="public" output="false" returntype="query">
		<cfargument name="Activity_CategoryID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CategoryID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT 
            	A.ActivityID, 
                A.ActivityTypeID,
                A.Title, 
                A.StartDate,
                APG.PublishDate,
                APG.RemoveDate
            FROM ce_Activity AS A
            INNER JOIN ce_Activity_PubGeneral APG ON APG.ActivityID = A.ActivityID
            INNER JOIN ce_Activity_Site ASi ON ASi.ActivityID = A.ActivityID
            WHERE 
                (ASi.SiteID = 4) AND
                (A.DeletedFlag = 'N') AND 
                (ASi.DeletedFlag = 'N') AND
                (APG.PublishDate <= <cfqueryparam value="#Now()#" cfsqltype="cf_sql_date" />) AND 
                (APG.RemoveDate >= <cfqueryparam value="#DateFormat(Now(), 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />)
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByReportAttributes" access="public" output="false" returntype="query">
		<cfargument name="Activity_CategoryID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CategoryID" type="numeric" required="false" />
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
				ac.Activity_CategoryID,
				ac.ActivityID,
				ac.CategoryID,
				ac.Created,
				ac.CreatedBy,
				ac.Updated,
				ac.UpdatedBy,
				ac.Deleted,
				ac.DeletedFlag,
                a.Title,
                a.StatAttendees,
                a.StatMaxRegistrants
			FROM	ce_Activity_Category ac
            INNER JOIN ce_Activity a ON a.ActivityID = ac.ActivityID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"Activity_CategoryID") and len(arguments.Activity_CategoryID)>
			AND	ac.Activity_CategoryID = <cfqueryparam value="#arguments.Activity_CategoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ac.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID)>
			AND	ac.CategoryID = <cfqueryparam value="#arguments.CategoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	ac.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	ac.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	ac.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	ac.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	ac.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	ac.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"StartDate") and len(arguments.StartDate)>
			AND	a.ReleaseDate <= <cfqueryparam value="#arguments.StartDate#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"EndDate") and len(arguments.EndDate)>
			AND	a.ReleaseDate = <cfqueryparam value="#arguments.EndDate#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
	
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="Activity_CategoryID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="CategoryID" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="CreatedBy" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT     AC.Activity_CategoryID, 
            		   AC.ActivityID, 
                       AC.CategoryID, 
                       C.Name, 
                       C.Description, 
                       C.ActivityCount, 
                       AC.Created, 
                       AC.CreatedBy, 
                       AC.Updated, 
                       AC.UpdatedBy, 
                       AC.Deleted, 
				  AC.DeletedFlag
			FROM         ce_Activity_Category AS AC INNER JOIN
				  ce_Category AS C ON AC.CategoryID = C.CategoryID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"Activity_CategoryID") and len(arguments.Activity_CategoryID)>
			AND	AC.Activity_CategoryID = <cfqueryparam value="#arguments.Activity_CategoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	AC.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CategoryID") and len(arguments.CategoryID)>
			AND	AC.CategoryID = <cfqueryparam value="#arguments.CategoryID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	AC.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	AC.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	AC.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	AC.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	AC.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	AC.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>
</cfcomponent>
