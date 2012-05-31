<cfcomponent displayname="AgendaDAO" hint="table ID column = AgendaID">

	<cffunction name="init" access="public" output="false" returntype="_com.Agenda.AgendaDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Agenda" type="_com.Agenda.Agenda" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Agenda
					(
					ActivityID,
					EventDate,
					StartTime,
					EndTime,
					Description,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Agenda.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Agenda.getEventDate()#" CFSQLType="cf_sql_timestamp" />,
					<cfqueryparam value="#arguments.Agenda.getStartTime()#" CFSQLType="cf_sql_timestamp" />,
					<cfqueryparam value="#arguments.Agenda.getEndTime()#" CFSQLType="cf_sql_timestamp" />,
					<cfqueryparam value="#arguments.Agenda.getDescription()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Agenda.getCreatedBy()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Agenda.Agenda">
		<cfargument name="Agenda" type="_com.Agenda.Agenda" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AgendaID,
					ActivityID,
					EventDate,
					StartTime,
					EndTime,
					Description,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Agenda
				WHERE	AgendaID = <cfqueryparam value="#arguments.Agenda.getAgendaID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AgendaBean = arguments.Agenda.init(argumentCollection=strReturn)>
			<cfreturn AgendaBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Agenda" type="_com.Agenda.Agenda" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Agenda
				SET
					ActivityID = <cfqueryparam value="#arguments.Agenda.getActivityID()#" CFSQLType="cf_sql_integer" />,
					EventDate = <cfqueryparam value="#arguments.Agenda.getEventDate()#" CFSQLType="cf_sql_timestamp" />,
					StartTime = <cfqueryparam value="#arguments.Agenda.getStartTime()#" CFSQLType="cf_sql_timestamp" />,
					EndTime = <cfqueryparam value="#arguments.Agenda.getEndTime()#" CFSQLType="cf_sql_timestamp" />,
					Description = <cfqueryparam value="#arguments.Agenda.getDescription()#" CFSQLType="cf_sql_varchar" />,
					Created = <cfqueryparam value="#arguments.Agenda.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Agenda.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Agenda.getCreatedBy()#" CFSQLType="cf_sql_integer" />,
					Updated = <cfqueryparam value="#arguments.Agenda.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Agenda.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Agenda.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Agenda.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Agenda.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Agenda.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Agenda.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Agenda.getDeletedFlag())#" />
				WHERE	AgendaID = <cfqueryparam value="#arguments.Agenda.getAgendaID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Agenda" type="_com.Agenda.Agenda" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Agenda 
				WHERE	AgendaID = <cfqueryparam value="#arguments.Agenda.getAgendaID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Agenda" type="_com.Agenda.Agenda" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Agenda
			WHERE	AgendaID = <cfqueryparam value="#arguments.Agenda.getAgendaID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Agenda" type="_com.Agenda.Agenda" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Agenda)>
			<cfset success = update(arguments.Agenda) />
		<cfelse>
			<cfset success = create(arguments.Agenda) />
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
