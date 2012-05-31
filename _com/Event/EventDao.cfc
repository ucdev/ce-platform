<cfcomponent displayname="EventDAO" hint="table ID column = id">

	<cffunction name="init" access="public" output="false" returntype="_com.Event.EventDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Event" type="_com.Event.Event" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#">
				INSERT INTO ce_Event
					(
					ActivityID,
					name,
					description,
					date_started,
					date_ended,
					time_started,
					time_ended,
					is_all_day,
					repeat_type,
					color,
					date_updated,
					date_created
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Event.getActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Event.getActivityID())#" />,
					<cfqueryparam value="#arguments.Event.getname()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.getname())#" />,
					<cfqueryparam value="#arguments.Event.getdescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.Event.getdescription())#" />,
					<cfqueryparam value="#arguments.Event.getdate_started()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_started())#" />,
					<cfqueryparam value="#arguments.Event.getdate_ended()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_ended())#" />,
					<cfqueryparam value="#arguments.Event.gettime_started()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.gettime_started())#" />,
					<cfqueryparam value="#arguments.Event.gettime_ended()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.gettime_ended())#" />,
					<cfqueryparam value="#arguments.Event.getis_all_day()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.Event.getis_all_day())#" />,
					<cfqueryparam value="#arguments.Event.getrepeat_type()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.Event.getrepeat_type())#" />,
					<cfqueryparam value="#arguments.Event.getcolor()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.getcolor())#" />,
					<cfqueryparam value="#arguments.Event.getdate_updated()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_updated())#" />,
					<cfqueryparam value="#arguments.Event.getdate_created()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_created())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Event.Event">
		<cfargument name="Event" type="_com.Event.Event" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					id,
					ActivityID,
					name,
					description,
					date_started,
					date_ended,
					time_started,
					time_ended,
					is_all_day,
					repeat_type,
					color,
					date_updated,
					date_created
				FROM	ce_Event
				WHERE	id = <cfqueryparam value="#arguments.Event.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset EventBean = arguments.Event.init(argumentCollection=strReturn)>
			<cfreturn EventBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Event" type="_com.Event.Event" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Event
				SET
					ActivityID = <cfqueryparam value="#arguments.Event.getActivityID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Event.getActivityID())#" />,
					name = <cfqueryparam value="#arguments.Event.getname()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.getname())#" />,
					description = <cfqueryparam value="#arguments.Event.getdescription()#" CFSQLType="cf_sql_longvarchar" null="#not len(arguments.Event.getdescription())#" />,
					date_started = <cfqueryparam value="#arguments.Event.getdate_started()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_started())#" />,
					date_ended = <cfqueryparam value="#arguments.Event.getdate_ended()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_ended())#" />,
					time_started = <cfqueryparam value="#arguments.Event.gettime_started()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.gettime_started())#" />,
					time_ended = <cfqueryparam value="#arguments.Event.gettime_ended()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.gettime_ended())#" />,
					is_all_day = <cfqueryparam value="#arguments.Event.getis_all_day()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.Event.getis_all_day())#" />,
					repeat_type = <cfqueryparam value="#arguments.Event.getrepeat_type()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.Event.getrepeat_type())#" />,
					color = <cfqueryparam value="#arguments.Event.getcolor()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.Event.getcolor())#" />,
					date_updated = <cfqueryparam value="#arguments.Event.getdate_updated()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_updated())#" />,
					date_created = <cfqueryparam value="#arguments.Event.getdate_created()#" CFSQLType="cf_sql_date" null="#not len(arguments.Event.getdate_created())#" />
				WHERE	id = <cfqueryparam value="#arguments.Event.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Event" type="_com.Event.Event" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Event 
				WHERE	id = <cfqueryparam value="#arguments.Event.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Event" type="_com.Event.Event" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Event
			WHERE	id = <cfqueryparam value="#arguments.Event.getid()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Event" type="_com.Event.Event" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Event)>
			<cfset success = update(arguments.Event) />
		<cfelse>
			<cfset success = create(arguments.Event) />
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
