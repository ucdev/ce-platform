
<cfcomponent displayname="ActivityPubGeneralGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityPubGeneral.ActivityPubGeneralGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="PubGeneralID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="LinkName" type="string" required="false" />
		<cfargument name="Overview" type="string" required="false" />
		<cfargument name="Keywords" type="string" required="false" />
		<cfargument name="Objectives" type="string" required="false" />
		<cfargument name="Goals" type="string" required="false" />
		<cfargument name="PublishFlag" type="string" required="false" />
		<cfargument name="PublishDate" type="date" required="false" />
		<cfargument name="RemoveDate" type="date" required="false" />
		<cfargument name="PaymentFlag" type="string" required="false" />
		<cfargument name="TermsFlag" type="string" required="false" />
		<cfargument name="TermsText" type="string" required="false" />
		<cfargument name="AllowCommentFlag" type="string" required="false" />
		<cfargument name="CommentApproveFlag" type="string" required="false" />
		<cfargument name="NotifyEmails" type="string" required="false" />
		<cfargument name="StatViews" type="numeric" required="false" />
		<cfargument name="StatVoteCount" type="numeric" required="false" />
		<cfargument name="StatVoteValue" type="numeric" required="false" />
		<cfargument name="FeaturedFlag" type="string" required="false" />
		<cfargument name="ExtHostFlag" type="string" required="false" />
		<cfargument name="ExtHostLink" type="string" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
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
				Updated
			FROM	ce_Activity_PubGeneral
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"PubGeneralID") and len(arguments.PubGeneralID)>
			AND	PubGeneralID = <cfqueryparam value="#arguments.PubGeneralID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"LinkName") and len(arguments.LinkName)>
			AND	LinkName = <cfqueryparam value="#arguments.LinkName#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Overview") and len(arguments.Overview)>
			AND	Overview = <cfqueryparam value="#arguments.Overview#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Keywords") and len(arguments.Keywords)>
			AND	Keywords = <cfqueryparam value="#arguments.Keywords#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Objectives") and len(arguments.Objectives)>
			AND	Objectives = <cfqueryparam value="#arguments.Objectives#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Goals") and len(arguments.Goals)>
			AND	Goals = <cfqueryparam value="#arguments.Goals#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PublishFlag") and len(arguments.PublishFlag)>
			AND	PublishFlag = <cfqueryparam value="#arguments.PublishFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"PublishDate") and len(arguments.PublishDate)>
			AND	PublishDate = <cfqueryparam value="#arguments.PublishDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"RemoveDate") and len(arguments.RemoveDate)>
			AND	RemoveDate = <cfqueryparam value="#arguments.RemoveDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"PaymentFlag") and len(arguments.PaymentFlag)>
			AND	PaymentFlag = <cfqueryparam value="#arguments.PaymentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"TermsFlag") and len(arguments.TermsFlag)>
			AND	TermsFlag = <cfqueryparam value="#arguments.TermsFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"TermsText") and len(arguments.TermsText)>
			AND	TermsText = <cfqueryparam value="#arguments.TermsText#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"AllowCommentFlag") and len(arguments.AllowCommentFlag)>
			AND	AllowCommentFlag = <cfqueryparam value="#arguments.AllowCommentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CommentApproveFlag") and len(arguments.CommentApproveFlag)>
			AND	CommentApproveFlag = <cfqueryparam value="#arguments.CommentApproveFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"NotifyEmails") and len(arguments.NotifyEmails)>
			AND	NotifyEmails = <cfqueryparam value="#arguments.NotifyEmails#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"StatViews") and len(arguments.StatViews)>
			AND	StatViews = <cfqueryparam value="#arguments.StatViews#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"StatVoteCount") and len(arguments.StatVoteCount)>
			AND	StatVoteCount = <cfqueryparam value="#arguments.StatVoteCount#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"StatVoteValue") and len(arguments.StatVoteValue)>
			AND	StatVoteValue = <cfqueryparam value="#arguments.StatVoteValue#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"FeaturedFlag") and len(arguments.FeaturedFlag)>
			AND	FeaturedFlag = <cfqueryparam value="#arguments.FeaturedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ExtHostFlag") and len(arguments.ExtHostFlag)>
			AND	ExtHostFlag = <cfqueryparam value="#arguments.ExtHostFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ExtHostLink") and len(arguments.ExtHostLink)>
			AND	ExtHostLink = <cfqueryparam value="#arguments.ExtHostLink#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
