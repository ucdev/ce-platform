<cfcomponent displayname="HistoryStyleGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.HistoryStyle.HistoryStyleGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="HistoryStyleID" type="numeric" required="false" />
		<cfargument name="HistoryTypeID" type="numeric" required="false" />
		<cfargument name="Title" type="string" required="false" />
		<cfargument name="TemplateFrom" type="string" required="false" />
		<cfargument name="TemplateTo" type="string" required="false" />
		<cfargument name="PossessiveFlag" type="string" required="false" />
		<cfargument name="IconImg" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				HistoryStyleID,
				HistoryTypeID,
				Title,
				TemplateFrom,
				TemplateTo,
				PossessiveFlag,
				IconImg
			FROM	ce_Sys_HistoryStyle
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"HistoryStyleID") and len(arguments.HistoryStyleID)>
			AND	HistoryStyleID = <cfqueryparam value="#arguments.HistoryStyleID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"HistoryTypeID") and len(arguments.HistoryTypeID)>
			AND	HistoryTypeID = <cfqueryparam value="#arguments.HistoryTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Title") and len(arguments.Title)>
			AND	Title = <cfqueryparam value="#arguments.Title#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"TemplateFrom") and len(arguments.TemplateFrom)>
			AND	TemplateFrom = <cfqueryparam value="#arguments.TemplateFrom#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"TemplateTo") and len(arguments.TemplateTo)>
			AND	TemplateTo = <cfqueryparam value="#arguments.TemplateTo#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"PossessiveFlag") and len(arguments.PossessiveFlag)>
			AND	PossessiveFlag = <cfqueryparam value="#arguments.PossessiveFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"IconImg") and len(arguments.IconImg)>
			AND	IconImg = <cfqueryparam value="#arguments.IconImg#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
