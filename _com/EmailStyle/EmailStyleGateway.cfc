<cfcomponent displayname="EmailStyleGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.EmailStyle.EmailStyleGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="EmailStyleID" type="numeric" required="false" />
		<cfargument name="Subject" type="string" required="false" />
		<cfargument name="TemplateHTML" type="string" required="false" />
		<cfargument name="TemplatePlain" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				EmailStyleID,
				Subject,
				TemplateHTML,
				TemplatePlain
			FROM	ce_Sys_EmailStyle
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"EmailStyleID") and len(arguments.EmailStyleID)>
			AND	EmailStyleID = <cfqueryparam value="#arguments.EmailStyleID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Subject") and len(arguments.Subject)>
			AND	Subject = <cfqueryparam value="#arguments.Subject#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"TemplateHTML") and len(arguments.TemplateHTML)>
			AND	TemplateHTML = <cfqueryparam value="#arguments.TemplateHTML#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"TemplatePlain") and len(arguments.TemplatePlain)>
			AND	TemplatePlain = <cfqueryparam value="#arguments.TemplatePlain#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
