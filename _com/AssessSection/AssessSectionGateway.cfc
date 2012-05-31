<cfcomponent displayname="AssessSectionGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.AssessSection.AssessSectionGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="SectionID" type="numeric" required="false" />
		<cfargument name="Name" type="string" required="false" />
		<cfargument name="Description" type="string" required="false" />
		<cfargument name="ParentSectionID" type="numeric" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				SectionID,
				Name,
				Description,
				ParentSectionID,
				AssessmentID,
				Sort,
				Created,
				Updated,
				Deleted,
				DeletedFlag
			FROM	ce_AssessSection
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"SectionID") and len(arguments.SectionID)>
			AND	SectionID = <cfqueryparam value="#arguments.SectionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Name") and len(arguments.Name)>
			AND	Name = <cfqueryparam value="#arguments.Name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Description") and len(arguments.Description)>
			AND	Description = <cfqueryparam value="#arguments.Description#" CFSQLType="cf_sql_longvarchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ParentSectionID") and len(arguments.ParentSectionID)>
			AND	ParentSectionID = <cfqueryparam value="#arguments.ParentSectionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
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
