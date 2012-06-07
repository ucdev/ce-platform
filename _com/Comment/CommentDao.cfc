
<cfcomponent displayname="CommentDAO" hint="table ID column = ">

	<cffunction name="init" access="public" output="false" returntype="_com.Comment.CommentDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="Comment" type="_com.Comment.Comment" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Comment
					(
					ActivityID,
					Comment,
					ApproveFlag,
					ApprovedBy,
					CreatedBy
					)
				VALUES
					(
					<cfqueryparam value="#arguments.Comment.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.Comment.getComment()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.Comment.getApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Comment.getApproveFlag())#" />,
					<cfqueryparam value="#arguments.Comment.getApprovedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Comment.getApprovedBy())#" />,
					<cfqueryparam value="#arguments.Comment.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Comment.getCreatedBy())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.ID />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.Comment.Comment">
		<cfargument name="Comment" type="_com.Comment.Comment" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					CommentID,
					ActivityID,
					Comment,
					ApproveFlag,
					ApprovedBy,
					Created,
					CreatedBy,
					Updated,
					UpdatedBy,
					Deleted,
					DeletedFlag
				FROM	ce_Comment
				WHERE	
                <cfif Arguments.Comment.getActivityID() NEQ "" AND Arguments.Credit.getCreatedBy() NEQ "">
					ActivityID = <cfqueryparam value="#arguments.Comment.getActivityID()#" CFSQLType="cf_sql_int" /> AND CreatedBy = <cfqueryparam value="#arguments.Comment.getCreatedBy()#" CFSQLType="cf_sql_int" />
                <cfelse>
	                CommentID = <cfqueryparam value="#arguments.Comment.getCommentID()#" CFSQLType="cf_sql_int" />
                </cfif>
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset CommentBean = arguments.Comment.init(argumentCollection=strReturn)>
			<cfreturn CommentBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="Comment" type="_com.Comment.Comment" required="true" />

		<cfset var qUpdate = "" />
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Comment
				SET
					CommentID = <cfqueryparam value="#arguments.Comment.getCommentID()#" CFSQLType="cf_sql_integer" />,
					ActivityID = <cfqueryparam value="#arguments.Comment.getActivityID()#" CFSQLType="cf_sql_integer" />,
					Comment = <cfqueryparam value="#arguments.Comment.getComment()#" CFSQLType="cf_sql_varchar" />,
					ApproveFlag = <cfqueryparam value="#arguments.Comment.getApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Comment.getApproveFlag())#" />,
					ApprovedBy = <cfqueryparam value="#arguments.Comment.getApprovedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Comment.getApprovedBy())#" />,
					Created = <cfqueryparam value="#arguments.Comment.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Comment.getCreated())#" />,
					CreatedBy = <cfqueryparam value="#arguments.Comment.getCreatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Comment.getCreatedBy())#" />,
					Updated = <cfqueryparam value="#arguments.Comment.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Comment.getUpdated())#" />,
					UpdatedBy = <cfqueryparam value="#arguments.Comment.getUpdatedBy()#" CFSQLType="cf_sql_integer" null="#not len(arguments.Comment.getUpdatedBy())#" />,
					Deleted = <cfqueryparam value="#arguments.Comment.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.Comment.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.Comment.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.Comment.getDeletedFlag())#" />
				WHERE	
                <cfif Arguments.Comment.getActivityID() NEQ "" AND Arguments.Credit.getCreatedBy() NEQ "">
					ActivityID = <cfqueryparam value="#arguments.Comment.getActivityID()#" CFSQLType="cf_sql_int" /> AND CreatedBy = <cfqueryparam value="#arguments.Comment.getCreatedBy()#" CFSQLType="cf_sql_int" />
                <cfelse>
	                CommentID = <cfqueryparam value="#arguments.Comment.getCommentID()#" CFSQLType="cf_sql_int" />
                </cfif>
			</cfquery>
		<cftry>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="Comment" type="_com.Comment.Comment" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Comment
				WHERE		
                <cfif Arguments.Comment.getActivityID() NEQ "" AND Arguments.Credit.getCreatedBy() NEQ "">
					ActivityID = <cfqueryparam value="#arguments.Comment.getActivityID()#" CFSQLType="cf_sql_int" /> AND CreatedBy = <cfqueryparam value="#arguments.Comment.getCreatedBy()#" CFSQLType="cf_sql_int" />
                <cfelse>
	                CommentID = <cfqueryparam value="#arguments.Comment.getCommentID()#" CFSQLType="cf_sql_int" />
                </cfif>
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="Comment" type="_com.Comment.Comment" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Comment
			WHERE		
			<cfif Arguments.Comment.getActivityID() NEQ "" AND Arguments.Credit.getCreatedBy() NEQ "">
                ActivityID = <cfqueryparam value="#arguments.Comment.getActivityID()#" CFSQLType="cf_sql_int" /> AND CreatedBy = <cfqueryparam value="#arguments.Comment.getCreatedBy()#" CFSQLType="cf_sql_int" />
            <cfelse>
                CommentID = <cfqueryparam value="#arguments.Comment.getCommentID()#" CFSQLType="cf_sql_int" />
            </cfif>
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="Comment" type="_com.Comment.Comment" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.Comment)>
			<cfset success = update(arguments.Comment) />
		<cfelse>
			<cfset success = create(arguments.Comment) />
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
