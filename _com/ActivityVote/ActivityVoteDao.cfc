<cfcomponent displayname="ActivityVoteDAO" hint="table ID column = ActivityVoteID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityVote.ActivityVoteDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityVote" type="_com.ActivityVote.ActivityVote" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_Vote
					(
					ActivityID,
					PersonID,
					VoteValue
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ActivityVote.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityVote.getPersonID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityVote.getVoteValue()#" CFSQLType="cf_sql_float" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityVote.ActivityVote">
		<cfargument name="ActivityVote" type="_com.ActivityVote.ActivityVote" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ActivityVoteID,
					ActivityID,
					PersonID,
					VoteValue,
					Created
				FROM	ce_Activity_Vote
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityVote.getActivityID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.ActivityVote.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivityVoteBean = arguments.ActivityVote.init(argumentCollection=strReturn)>
			<cfreturn ActivityVoteBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityVote" type="_com.ActivityVote.ActivityVote" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_Vote
				SET
					ActivityID = <cfqueryparam value="#arguments.ActivityVote.getActivityID()#" CFSQLType="cf_sql_integer" />,
					PersonID = <cfqueryparam value="#arguments.ActivityVote.getPersonID()#" CFSQLType="cf_sql_integer" />,
					VoteValue = <cfqueryparam value="#arguments.ActivityVote.getVoteValue()#" CFSQLType="cf_sql_float" />,
					Created = <cfqueryparam value="#arguments.ActivityVote.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityVote.getCreated())#" />
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityVote.getActivityID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.ActivityVote.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityVote" type="_com.ActivityVote.ActivityVote" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_Vote 
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityVote.getActivityID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.ActivityVote.getPersonID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityVote" type="_com.ActivityVote.ActivityVote" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_Vote
			WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityVote.getActivityID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.ActivityVote.getPersonID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityVote" type="_com.ActivityVote.ActivityVote" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ActivityVote)>
			<cfset success = update(arguments.ActivityVote) />
		<cfelse>
			<cfset success = create(arguments.ActivityVote) />
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
