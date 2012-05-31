<cfcomponent displayname="ActivityVoteGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityVote.ActivityVoteGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="ActivityVoteID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="PersonID" type="numeric" required="false" />
		<cfargument name="VoteValue" type="numeric" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				ActivityVoteID,
				ActivityID,
				PersonID,
				VoteValue,
				Created
			FROM	ce_Activity_Vote
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ActivityVoteID") and len(arguments.ActivityVoteID)>
			AND	ActivityVoteID = <cfqueryparam value="#arguments.ActivityVoteID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"PersonID") and len(arguments.PersonID)>
			AND	PersonID = <cfqueryparam value="#arguments.PersonID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"VoteValue") and len(arguments.VoteValue)>
			AND	VoteValue = <cfqueryparam value="#arguments.VoteValue#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
