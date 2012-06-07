<cfcomponent displayname="HistoryStyleDAO" hint="table ID column = HistoryStyleID">

	<cffunction name="init" access="public" output="false" returntype="_com.HistoryStyle.HistoryStyleDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="HistoryStyle" type="_com.HistoryStyle.HistoryStyle" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Sys_HistoryStyle
					(
					HistoryTypeID,
					Title,
					TemplateFrom,
					TemplateTo,
					PossessiveFlag,
					IconImg
					)
				VALUES
					(
					<cfqueryparam value="#arguments.HistoryStyle.getHistoryTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.HistoryStyle.getHistoryTypeID())#" />,
					<cfqueryparam value="#arguments.HistoryStyle.getTitle()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.HistoryStyle.getTemplateFrom()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.HistoryStyle.getTemplateTo()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.HistoryStyle.getPossessiveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.HistoryStyle.getPossessiveFlag())#" />,
					<cfqueryparam value="#arguments.HistoryStyle.getIconImg()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.HistoryStyle.getIconImg())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.HistoryStyle.HistoryStyle">
		<cfargument name="HistoryStyle" type="_com.HistoryStyle.HistoryStyle" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					HistoryStyleID,
					HistoryTypeID,
					Title,
					TemplateFrom,
					TemplateTo,
					PossessiveFlag,
					IconImg
				FROM	ce_Sys_HistoryStyle
				WHERE	HistoryStyleID = <cfqueryparam value="#arguments.HistoryStyle.getHistoryStyleID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset HistoryStyleBean = arguments.HistoryStyle.init(argumentCollection=strReturn)>
			<cfreturn HistoryStyleBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="HistoryStyle" type="_com.HistoryStyle.HistoryStyle" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Sys_HistoryStyle
				SET
					HistoryTypeID = <cfqueryparam value="#arguments.HistoryStyle.getHistoryTypeID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.HistoryStyle.getHistoryTypeID())#" />,
					Title = <cfqueryparam value="#arguments.HistoryStyle.getTitle()#" CFSQLType="cf_sql_varchar" />,
					TemplateFrom = <cfqueryparam value="#arguments.HistoryStyle.getTemplateFrom()#" CFSQLType="cf_sql_varchar" />,
					TemplateTo = <cfqueryparam value="#arguments.HistoryStyle.getTemplateTo()#" CFSQLType="cf_sql_varchar" />,
					PossessiveFlag = <cfqueryparam value="#arguments.HistoryStyle.getPossessiveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.HistoryStyle.getPossessiveFlag())#" />,
					IconImg = <cfqueryparam value="#arguments.HistoryStyle.getIconImg()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.HistoryStyle.getIconImg())#" />
				WHERE	HistoryStyleID = <cfqueryparam value="#arguments.HistoryStyle.getHistoryStyleID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="HistoryStyle" type="_com.HistoryStyle.HistoryStyle" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Sys_HistoryStyle 
				WHERE	HistoryStyleID = <cfqueryparam value="#arguments.HistoryStyle.getHistoryStyleID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="HistoryStyle" type="_com.HistoryStyle.HistoryStyle" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Sys_HistoryStyle
			WHERE	HistoryStyleID = <cfqueryparam value="#arguments.HistoryStyle.getHistoryStyleID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="HistoryStyle" type="_com.HistoryStyle.HistoryStyle" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.HistoryStyle)>
			<cfset success = update(arguments.HistoryStyle) />
		<cfelse>
			<cfset success = create(arguments.HistoryStyle) />
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
