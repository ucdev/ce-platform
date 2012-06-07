<cfcomponent displayname="ActivityApplicationDAO" hint="table ID column = ApplicationID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityApplication.ActivityApplicationDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityApplication" type="_com.ActivityApplication.ActivityApplication" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_Application
					(
					ActivityID,
					ReceivedFlag,
					ReceivedDate,
					SentFlag,
					SentDate,
					ApprovedFlag,
					ApprovedDate,
					NeedsFlag,
					NeedsDate,
					ObjFlag,
					ObjDate,
					SuppFlag,
					SuppDate,
					AttendFlag,
					AttendDate,
					CVFlag,
					CVDate,
					BrochFlag,
					BrochDate,
					MembApprFlag,
					MembApprDate,
					ConflictFlag,
					ConflictDate,
					EvalFlag,
					EvalDate
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ActivityApplication.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityApplication.getReceivedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getReceivedFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getReceivedDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getReceivedDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getSentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getSentFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getSentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getSentDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getApprovedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getApprovedFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getApprovedDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getApprovedDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getNeedsFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getNeedsFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getNeedsDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getNeedsDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getObjFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getObjFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getObjDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getObjDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getSuppFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getSuppFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getSuppDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getSuppDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getAttendFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getAttendFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getAttendDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getAttendDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getCVFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getCVFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getCVDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getCVDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getBrochFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getBrochFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getBrochDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getBrochDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getMembApprFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getMembApprFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getMembApprDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getMembApprDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getConflictFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getConflictFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getConflictDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getConflictDate())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getEvalFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getEvalFlag())#" />,
					<cfqueryparam value="#arguments.ActivityApplication.getEvalDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getEvalDate())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityApplication.ActivityApplication">
		<cfargument name="ActivityApplication" type="_com.ActivityApplication.ActivityApplication" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ApplicationID,
					ActivityID,
					ReceivedFlag,
					ReceivedDate,
					SentFlag,
					SentDate,
					ApprovedFlag,
					ApprovedDate,
					NeedsFlag,
					NeedsDate,
					ObjFlag,
					ObjDate,
					SuppFlag,
					SuppDate,
					AttendFlag,
					AttendDate,
					CVFlag,
					CVDate,
					BrochFlag,
					BrochDate,
					MembApprFlag,
					MembApprDate,
					ConflictFlag,
					ConflictDate,
					EvalFlag,
					EvalDate
				FROM	ce_Activity_Application
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityApplication.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivityApplicationBean = arguments.ActivityApplication.init(argumentCollection=strReturn)>
			<cfreturn ActivityApplicationBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityApplication" type="_com.ActivityApplication.ActivityApplication" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_Application
				SET
					ActivityID = <cfqueryparam value="#arguments.ActivityApplication.getActivityID()#" CFSQLType="cf_sql_integer" />,
					ReceivedFlag = <cfqueryparam value="#arguments.ActivityApplication.getReceivedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getReceivedFlag())#" />,
					ReceivedDate = <cfqueryparam value="#arguments.ActivityApplication.getReceivedDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getReceivedDate())#" />,
					SentFlag = <cfqueryparam value="#arguments.ActivityApplication.getSentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getSentFlag())#" />,
					SentDate = <cfqueryparam value="#arguments.ActivityApplication.getSentDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getSentDate())#" />,
					ApprovedFlag = <cfqueryparam value="#arguments.ActivityApplication.getApprovedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getApprovedFlag())#" />,
					ApprovedDate = <cfqueryparam value="#arguments.ActivityApplication.getApprovedDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getApprovedDate())#" />,
					NeedsFlag = <cfqueryparam value="#arguments.ActivityApplication.getNeedsFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getNeedsFlag())#" />,
					NeedsDate = <cfqueryparam value="#arguments.ActivityApplication.getNeedsDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getNeedsDate())#" />,
					ObjFlag = <cfqueryparam value="#arguments.ActivityApplication.getObjFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getObjFlag())#" />,
					ObjDate = <cfqueryparam value="#arguments.ActivityApplication.getObjDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getObjDate())#" />,
					SuppFlag = <cfqueryparam value="#arguments.ActivityApplication.getSuppFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getSuppFlag())#" />,
					SuppDate = <cfqueryparam value="#arguments.ActivityApplication.getSuppDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getSuppDate())#" />,
					AttendFlag = <cfqueryparam value="#arguments.ActivityApplication.getAttendFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getAttendFlag())#" />,
					AttendDate = <cfqueryparam value="#arguments.ActivityApplication.getAttendDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getAttendDate())#" />,
					CVFlag = <cfqueryparam value="#arguments.ActivityApplication.getCVFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getCVFlag())#" />,
					CVDate = <cfqueryparam value="#arguments.ActivityApplication.getCVDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getCVDate())#" />,
					BrochFlag = <cfqueryparam value="#arguments.ActivityApplication.getBrochFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getBrochFlag())#" />,
					BrochDate = <cfqueryparam value="#arguments.ActivityApplication.getBrochDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getBrochDate())#" />,
					MembApprFlag = <cfqueryparam value="#arguments.ActivityApplication.getMembApprFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getMembApprFlag())#" />,
					MembApprDate = <cfqueryparam value="#arguments.ActivityApplication.getMembApprDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getMembApprDate())#" />,
					ConflictFlag = <cfqueryparam value="#arguments.ActivityApplication.getConflictFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getConflictFlag())#" />,
					ConflictDate = <cfqueryparam value="#arguments.ActivityApplication.getConflictDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getConflictDate())#" />,
					EvalFlag = <cfqueryparam value="#arguments.ActivityApplication.getEvalFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityApplication.getEvalFlag())#" />,
					EvalDate = <cfqueryparam value="#arguments.ActivityApplication.getEvalDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityApplication.getEvalDate())#" />
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityApplication.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityApplication" type="_com.ActivityApplication.ActivityApplication" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_Application 
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityApplication.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityApplication" type="_com.ActivityApplication.ActivityApplication" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_Application
			WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityApplication.getActivityID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityApplication" type="_com.ActivityApplication.ActivityApplication" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ActivityApplication)>
			<cfset success = update(arguments.ActivityApplication) />
		<cfelse>
			<cfset success = create(arguments.ActivityApplication) />
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
