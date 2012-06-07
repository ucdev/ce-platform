
<cfcomponent displayname="ActivityFacultyDAO" hint="table ID column = FacultyID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityFaculty.ActivityFacultyDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityFaculty" type="_com.ActivityFaculty.ActivityFaculty" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_Faculty
					(
					ActivityID,
					PersonID,
					CVFileID,
					CVApproveFlag,
					DisclosureFileID,
					DisclosureApproveFlag,
					RoleID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ActivityFaculty.getActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getActivityID())#" />,
					<cfqueryparam value="#arguments.ActivityFaculty.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getPersonID())#" />,
					<cfqueryparam value="#arguments.ActivityFaculty.getCVFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getCVFileID())#" />,
					<cfqueryparam value="#arguments.ActivityFaculty.getCVApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityFaculty.getCVApproveFlag())#" />,
					<cfqueryparam value="#arguments.ActivityFaculty.getDisclosureFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getDisclosureFileID())#" />,
					<cfqueryparam value="#arguments.ActivityFaculty.getDisclosureApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityFaculty.getDisclosureApproveFlag())#" />,
					<cfqueryparam value="#arguments.ActivityFaculty.getRoleID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getRoleID())#" />,
					<cfqueryparam value="#arguments.ActivityFaculty.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityFaculty.ActivityFaculty">
		<cfargument name="ActivityFaculty" type="_com.ActivityFaculty.ActivityFaculty" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE (ActivityID = <cfqueryparam value="#arguments.ActivityFaculty.getActivityID()#" CFSQLType="cf_sql_integer" />) AND (PersonID = <cfqueryparam value="#arguments.ActivityFaculty.getPersonID()#" CFSQLType="cf_sql_integer" />)
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivityFacultyBean = arguments.ActivityFaculty.init(argumentCollection=strReturn)>
			<cfreturn ActivityFacultyBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityFaculty" type="_com.ActivityFaculty.ActivityFaculty" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_Faculty
				SET
					ActivityID = <cfqueryparam value="#arguments.ActivityFaculty.getActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getActivityID())#" />,
					PersonID = <cfqueryparam value="#arguments.ActivityFaculty.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getPersonID())#" />,
					CVFileID = <cfqueryparam value="#arguments.ActivityFaculty.getCVFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getCVFileID())#" />,
					CVApproveFlag = <cfqueryparam value="#arguments.ActivityFaculty.getCVApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityFaculty.getCVApproveFlag())#" />,
					DisclosureFileID = <cfqueryparam value="#arguments.ActivityFaculty.getDisclosureFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getDisclosureFileID())#" />,
					DisclosureApproveFlag = <cfqueryparam value="#arguments.ActivityFaculty.getDisclosureApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityFaculty.getDisclosureApproveFlag())#" />,
					RoleID = <cfqueryparam value="#arguments.ActivityFaculty.getRoleID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getRoleID())#" />,
					Created = <cfqueryparam value="#arguments.ActivityFaculty.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityFaculty.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.ActivityFaculty.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.ActivityFaculty.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityFaculty.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.ActivityFaculty.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityFaculty.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.ActivityFaculty.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityFaculty.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.ActivityFaculty.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityFaculty.getDeletedFlag())#" />
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityFaculty.getActivityID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.ActivityFaculty.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityFaculty" type="_com.ActivityFaculty.ActivityFaculty" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_Faculty 
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityFaculty.getActivityID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.ActivityFaculty.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityFaculty" type="_com.ActivityFaculty.ActivityFaculty" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_Faculty
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityFaculty.getActivityID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.ActivityFaculty.getPersonID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityFaculty" type="_com.ActivityFaculty.ActivityFaculty" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ActivityFaculty)>
			<cfset success = update(arguments.ActivityFaculty) />
		<cfelse>
			<cfset success = create(arguments.ActivityFaculty) />
		</cfif>
		
		<cfreturn success />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>
