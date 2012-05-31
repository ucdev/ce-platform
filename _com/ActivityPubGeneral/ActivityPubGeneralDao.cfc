<cfcomponent displayname="ActivityPubGeneralDAO" hint="table ID column = PubGeneralID">

	<cffunction name="init" access="public" output="false" returntype="_com.ActivityPubGeneral.ActivityPubGeneralDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubGeneral" type="_com.ActivityPubGeneral.ActivityPubGeneral" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_PubGeneral
					(
					ActivityID,
					LinkName,
					Overview,
					Keywords,
					Objectives,
					Goals,
					PublishFlag,
					PublishDate,
					RemoveDate,
					PaymentFlag,
					PaymentFee,
					TermsFlag,
					TermsText,
					AllowCommentFlag,
					CommentApproveFlag,
					NotifyEmails,
					StatViews,
					StatVoteCount,
					StatVoteValue,
					FeaturedFlag,
					ExtHostFlag,
					ExtHostLink,
					RestrictedFlag
					)
				VALUES
					(
					<cfqueryparam value="#arguments.ActivityPubGeneral.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getLinkName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getLinkName())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getOverview()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getOverview())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getKeywords()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getKeywords())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getObjectives()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getGoals()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getGoals())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getPublishFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getPublishFlag())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getPublishDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubGeneral.getPublishDate())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getRemoveDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubGeneral.getRemoveDate())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getPaymentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getPaymentFlag())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getPaymentFee()#" CFSQLType="cf_sql_float" null="#not len(arguments.ActivityPubGeneral.getPaymentFee())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getTermsFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getTermsFlag())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getTermsText()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getTermsText())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getAllowCommentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getAllowCommentFlag())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getCommentApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getCommentApproveFlag())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getNotifyEmails()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getNotifyEmails())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getStatViews()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubGeneral.getStatViews())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getStatVoteCount()#" CFSQLType="cf_sql_float" null="#not len(arguments.ActivityPubGeneral.getStatVoteCount())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getStatVoteValue()#" CFSQLType="cf_sql_float" null="#not len(arguments.ActivityPubGeneral.getStatVoteValue())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getFeaturedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getFeaturedFlag())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getExtHostFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getExtHostFlag())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getExtHostLink()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getExtHostLink())#" />,
					<cfqueryparam value="#arguments.ActivityPubGeneral.getRestrictedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getRestrictedFlag())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.ActivityPubGeneral.ActivityPubGeneral">
		<cfargument name="ActivityPubGeneral" type="_com.ActivityPubGeneral.ActivityPubGeneral" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					PubGeneralID,
					ActivityID,
					LinkName,
					Overview,
					Keywords,
					Objectives,
					Goals,
					PublishFlag,
					PublishDate,
					RemoveDate,
					PaymentFlag,
					PaymentFee,
					TermsFlag,
					TermsText,
					AllowCommentFlag,
					CommentApproveFlag,
					NotifyEmails,
					StatViews,
					StatVoteCount,
					StatVoteValue,
					FeaturedFlag,
					ExtHostFlag,
					ExtHostLink,
					RestrictedFlag,
					Updated
				FROM	ce_Activity_PubGeneral
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityPubGeneral.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset ActivityPubGeneralBean = arguments.ActivityPubGeneral.init(argumentCollection=strReturn)>
			<cfreturn ActivityPubGeneralBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubGeneral" type="_com.ActivityPubGeneral.ActivityPubGeneral" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_PubGeneral
				SET
					ActivityID = <cfqueryparam value="#arguments.ActivityPubGeneral.getActivityID()#" CFSQLType="cf_sql_integer" />,
					LinkName = <cfqueryparam value="#arguments.ActivityPubGeneral.getLinkName()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getLinkName())#" />,
					Overview = <cfqueryparam value="#arguments.ActivityPubGeneral.getOverview()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getOverview())#" />,
					Keywords = <cfqueryparam value="#arguments.ActivityPubGeneral.getKeywords()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getKeywords())#" />,
					Objectives = <cfqueryparam value="#arguments.ActivityPubGeneral.getObjectives()#" CFSQLType="cf_sql_varchar" />,
					Goals = <cfqueryparam value="#arguments.ActivityPubGeneral.getGoals()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getGoals())#" />,
					PublishFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getPublishFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getPublishFlag())#" />,
					PublishDate = <cfqueryparam value="#arguments.ActivityPubGeneral.getPublishDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubGeneral.getPublishDate())#" />,
					RemoveDate = <cfqueryparam value="#arguments.ActivityPubGeneral.getRemoveDate()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubGeneral.getRemoveDate())#" />,
					PaymentFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getPaymentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getPaymentFlag())#" />,
					PaymentFee = <cfqueryparam value="#arguments.ActivityPubGeneral.getPaymentFee()#" CFSQLType="cf_sql_float" null="#not len(arguments.ActivityPubGeneral.getPaymentFee())#" />,
					TermsFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getTermsFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getTermsFlag())#" />,
					TermsText = <cfqueryparam value="#arguments.ActivityPubGeneral.getTermsText()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getTermsText())#" />,
					AllowCommentFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getAllowCommentFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getAllowCommentFlag())#" />,
					CommentApproveFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getCommentApproveFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getCommentApproveFlag())#" />,
					NotifyEmails = <cfqueryparam value="#arguments.ActivityPubGeneral.getNotifyEmails()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getNotifyEmails())#" />,
					StatViews = <cfqueryparam value="#arguments.ActivityPubGeneral.getStatViews()#" CFSQLType="cf_sql_integer" null="#not len(arguments.ActivityPubGeneral.getStatViews())#" />,
					StatVoteCount = <cfqueryparam value="#arguments.ActivityPubGeneral.getStatVoteCount()#" CFSQLType="cf_sql_float" null="#not len(arguments.ActivityPubGeneral.getStatVoteCount())#" />,
					StatVoteValue = <cfqueryparam value="#arguments.ActivityPubGeneral.getStatVoteValue()#" CFSQLType="cf_sql_float" null="#not len(arguments.ActivityPubGeneral.getStatVoteValue())#" />,
					FeaturedFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getFeaturedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getFeaturedFlag())#" />,
					ExtHostFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getExtHostFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getExtHostFlag())#" />,
					ExtHostLink = <cfqueryparam value="#arguments.ActivityPubGeneral.getExtHostLink()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.ActivityPubGeneral.getExtHostLink())#" />,
					RestrictedFlag = <cfqueryparam value="#arguments.ActivityPubGeneral.getRestrictedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.ActivityPubGeneral.getRestrictedFlag())#" />,
					Updated = <cfqueryparam value="#arguments.ActivityPubGeneral.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.ActivityPubGeneral.getUpdated())#" />
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityPubGeneral.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubGeneral" type="_com.ActivityPubGeneral.ActivityPubGeneral" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_PubGeneral 
				WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityPubGeneral.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubGeneral" type="_com.ActivityPubGeneral.ActivityPubGeneral" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_PubGeneral
			WHERE	ActivityID = <cfqueryparam value="#arguments.ActivityPubGeneral.getActivityID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="ActivityPubGeneral" type="_com.ActivityPubGeneral.ActivityPubGeneral" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.ActivityPubGeneral)>
			<cfset success = update(arguments.ActivityPubGeneral) />
		<cfelse>
			<cfset success = create(arguments.ActivityPubGeneral) />
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
