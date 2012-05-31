<cfcomponent displayname="AssessSectionDAO" hint="table ID column = SectionID">

	<cffunction name="init" access="public" output="false" returntype="_com.AssessSection.AssessSectionDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AssessSection" type="_com.AssessSection.AssessSection" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_AssessSection
					(
					Name,
					Description,
					ParentSectionID,
					AssessmentID,
					Sort
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AssessSection.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessSection.getName())#" />,
					<cfqueryparam value="#arguments.AssessSection.getDescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.AssessSection.getDescription())#" />,
					<cfqueryparam value="#arguments.AssessSection.getParentSectionID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessSection.getParentSectionID())#" />,
					<cfqueryparam value="#arguments.AssessSection.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessSection.getAssessmentID())#" />,
					<cfqueryparam value="#arguments.AssessSection.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessSection.getSort())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.AssessSection.AssessSection">
		<cfargument name="AssessSection" type="_com.AssessSection.AssessSection" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE	SectionID = <cfqueryparam value="#arguments.AssessSection.getSectionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessSectionBean = arguments.AssessSection.init(argumentCollection=strReturn)>
			<cfreturn AssessSectionBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AssessSection" type="_com.AssessSection.AssessSection" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AssessSection
				SET
					Name = <cfqueryparam value="#arguments.AssessSection.getName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessSection.getName())#" />,
					Description = <cfqueryparam value="#arguments.AssessSection.getDescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.AssessSection.getDescription())#" />,
					ParentSectionID = <cfqueryparam value="#arguments.AssessSection.getParentSectionID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessSection.getParentSectionID())#" />,
					AssessmentID = <cfqueryparam value="#arguments.AssessSection.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessSection.getAssessmentID())#" />,
					Sort = <cfqueryparam value="#arguments.AssessSection.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessSection.getSort())#" />,
					Created = <cfqueryparam value="#arguments.AssessSection.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessSection.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.AssessSection.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessSection.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.AssessSection.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessSection.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AssessSection.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessSection.getDeletedFlag())#" />
				WHERE	SectionID = <cfqueryparam value="#arguments.AssessSection.getSectionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AssessSection" type="_com.AssessSection.AssessSection" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_AssessSection 
				WHERE	SectionID = <cfqueryparam value="#arguments.AssessSection.getSectionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AssessSection" type="_com.AssessSection.AssessSection" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AssessSection
			WHERE	SectionID = <cfqueryparam value="#arguments.AssessSection.getSectionID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AssessSection" type="_com.AssessSection.AssessSection" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AssessSection)>
			<cfset success = update(arguments.AssessSection) />
		<cfelse>
			<cfset success = create(arguments.AssessSection) />
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
