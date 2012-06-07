<cfcomponent displayname="ActivityPubComponentDAO" hint="table ID column = PubComponentID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityPubComponent.ActivityPubComponentDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubComponent" type="_com.ActivityPubComponent.ActivityPubComponent" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_PubComponent
					(
					ComponentID,
					ActivityID,
					Sort,
					DisplayName,
					Description,
					ExternalURL,
					AssessmentID,
					FileID,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ActivityPubComponent.getComponentID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubComponent.getSort())#" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getDisplayName()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubComponent.getDescription())#" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getExternalURL()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubComponent.getExternalURL())#" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubComponent.getAssessmentID())#" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubComponent.getFileID())#" />,
					<cfqueryparam value="#arguments.ActivityPubComponent.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityPubComponent.ActivityPubComponent">
		<cfargument name="ActivityPubComponent" type="_com.ActivityPubComponent.ActivityPubComponent" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE	
                	PubComponentID = <cfqueryparam value="#arguments.ActivityPubComponent.getPubComponentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivityPubComponentBean = arguments.ActivityPubComponent.init(argumentCollection=strReturn)>
			<cfreturn ActivityPubComponentBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubComponent" type="_com.ActivityPubComponent.ActivityPubComponent" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_PubComponent
				SET
					ComponentID = <cfqueryparam value="#arguments.ActivityPubComponent.getComponentID()#" CFSQLType="cf_sql_integer" />,
					ActivityID = <cfqueryparam value="#arguments.ActivityPubComponent.getActivityID()#" CFSQLType="cf_sql_integer" />,
					Sort = <cfqueryparam value="#arguments.ActivityPubComponent.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubComponent.getSort())#" />,
					DisplayName = <cfqueryparam value="#arguments.ActivityPubComponent.getDisplayName()#" CFSQLType="cf_sql_varchar" />,
					Description = <cfqueryparam value="#arguments.ActivityPubComponent.getDescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubComponent.getDescription())#" />,
					ExternalURL = <cfqueryparam value="#arguments.ActivityPubComponent.getExternalURL()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubComponent.getExternalURL())#" />,
					AssessmentID = <cfqueryparam value="#arguments.ActivityPubComponent.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubComponent.getAssessmentID())#" />,
					FileID = <cfqueryparam value="#arguments.ActivityPubComponent.getFileID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubComponent.getFileID())#" />,
					Created = <cfqueryparam value="#arguments.ActivityPubComponent.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubComponent.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.ActivityPubComponent.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.ActivityPubComponent.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubComponent.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.ActivityPubComponent.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubComponent.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.ActivityPubComponent.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubComponent.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.ActivityPubComponent.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubComponent.getDeletedFlag())#" />
				WHERE	
                	PubComponentID = <cfqueryparam value="#arguments.ActivityPubComponent.getPubComponentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubComponent" type="_com.ActivityPubComponent.ActivityPubComponent" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_PubComponent 
				WHERE	
                	PubComponentID = <cfqueryparam value="#arguments.ActivityPubComponent.getPubComponentID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubComponent" type="_com.ActivityPubComponent.ActivityPubComponent" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_PubComponent
			WHERE	
                PubComponentID = <cfqueryparam value="#arguments.ActivityPubComponent.getPubComponentID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubComponent" type="_com.ActivityPubComponent.ActivityPubComponent" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ActivityPubComponent)>
			<cfset success = update(arguments.ActivityPubComponent) />
		<cfelse>
			<cfset success = create(arguments.ActivityPubComponent) />
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
