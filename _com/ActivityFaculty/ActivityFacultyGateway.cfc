
<cfcomponent displayname="ActivityFacultyGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityFaculty.ActivityFacultyGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="FacultyID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="CVFileID" type="numeric" required="false" />
		<cfargument name="CVApproveFlag" type="string" required="false" />
		<cfargument name="DisclosureFileID" type="numeric" required="false" />
		<cfargument name="DisclosureApproveFlag" type="string" required="false" />
		<cfargument name="RoleID" type="numeric" required="false" />
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
				FacultyID,
				ActivityID,
				PersonID,
				CVFileID,
				CVApproveFlag,
				DisclosureFileID,
				DisclosureApproveFlag,
				RoleID,
				Created,
				CreatedBy,
				Updated,
				UpdatedBy,
				Deleted,
				DeletedFlag
			FROM	ce_Activity_Faculty
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"FacultyID") and len(arguments.FacultyID)>
			AND	FacultyID = <cfqueryparam value="#arguments.FacultyID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CVFileID") and len(arguments.CVFileID)>
			AND	CVFileID = <cfqueryparam value="#arguments.CVFileID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"CVApproveFlag") and len(arguments.CVApproveFlag)>
			AND	CVApproveFlag = <cfqueryparam value="#arguments.CVApproveFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"DisclosureFileID") and len(arguments.DisclosureFileID)>
			AND	DisclosureFileID = <cfqueryparam value="#arguments.DisclosureFileID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DisclosureApproveFlag") and len(arguments.DisclosureApproveFlag)>
			AND	DisclosureApproveFlag = <cfqueryparam value="#arguments.DisclosureApproveFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"RoleID") and len(arguments.RoleID)>
			AND	RoleID = <cfqueryparam value="#arguments.RoleID#" CFSQLType="cf_sql_integer" />
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
		<cfargument name="FacultyID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
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
				af.FacultyID,
				af.ActivityID,
				af.PersonID,
                af.CVFileID,
                af.CVApproveFlag,
                af.DisclosureFileID,
                af.DisclosureApproveFlag,
				af.Created,
				af.CreatedBy,
				af.Updated,
				af.UpdatedBy,
				af.Deleted,
				af.DeletedFlag,
                sr.Name AS RoleName,
				p1.FirstName,
				p1.LastName,
				p1.Gender,
                a.ReleaseDate,
                a.StartDate,
                cvf.Created AS CVCreatedDate,
                disf.Created AS DisclosureCreatedDate
			FROM	ce_Activity_Faculty af
			LEFT OUTER JOIN ce_person AS p1 ON p1.personid = af.PersonID
            LEFT OUTER JOIN ce_Activity AS a ON a.ActivityID = af.ActivityID
            LEFT OUTER JOIN ce_Sys_Role AS sr ON sr.RoleID = af.RoleID
            LEFT OUTER JOIN ce_File AS cvf ON cvf.FileID = af.CVFileID
            LEFT OUTER JOIN ce_File AS disf on disf.FileID = af.DisclosureFileID
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"FacultyID") and len(arguments.FacultyID)>
			AND	af.FacultyID = <cfqueryparam value="#arguments.FacultyID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	af.ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	af.PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	af.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CreatedBy") and len(arguments.CreatedBy)>
			AND	af.CreatedBy = <cfqueryparam value="#arguments.CreatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	af.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"UpdatedBy") and len(arguments.UpdatedBy)>
			AND	af.UpdatedBy = <cfqueryparam value="#arguments.UpdatedBy#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	af.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	af.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
