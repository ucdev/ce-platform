
<cfcomponent displayname="activityOtherGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.activityOther.activityOtherGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="OtherID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="DidacticHrs" type="numeric" required="false" />
		<cfargument name="ExperimentalHrs" type="numeric" required="false" />
		<cfargument name="SecClinSiteFlag" type="string" required="false" />
		<cfargument name="CollabPTCFlag" type="string" required="false" />
		<cfargument name="CollabPTCSpecify" type="string" required="false" />
		<cfargument name="CollabAgencyFlag" type="string" required="false" />
		<cfargument name="CollabAgencySpecify" type="string" required="false" />
		<cfargument name="competenceDesign" type="numeric" required="false" />
		<cfargument name="performanceDesign" type="numeric" required="false" />
		<cfargument name="outcomesDesign" type="numeric" required="false" />
		<cfargument name="competenceEval" type="numeric" required="false" />
		<cfargument name="performanceEval" type="numeric" required="false" />
		<cfargument name="outcomesEval" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				OtherID,
				ActivityID,
				DidacticHrs,
				ExperimentalHrs,
				SecClinSiteFlag,
				CollabPTCFlag,
				CollabPTCSpecify,
				CollabAgencyFlag,
				CollabAgencySpecify,
				competenceDesign,
				performanceDesign,
				outcomesDesign,
				competenceEval,
				performanceEval,
				outcomesEval
			FROM	ce_Activity_Other
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"OtherID") and len(arguments.OtherID)>
			AND	OtherID = <cfqueryparam value="#arguments.OtherID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"DidacticHrs") and len(arguments.DidacticHrs)>
			AND	DidacticHrs = <cfqueryparam value="#arguments.DidacticHrs#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"ExperimentalHrs") and len(arguments.ExperimentalHrs)>
			AND	ExperimentalHrs = <cfqueryparam value="#arguments.ExperimentalHrs#" CFSQLType="cf_sql_float" />
		</cfif>
		<cfif structKeyExists(arguments,"SecClinSiteFlag") and len(arguments.SecClinSiteFlag)>
			AND	SecClinSiteFlag = <cfqueryparam value="#arguments.SecClinSiteFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CollabPTCFlag") and len(arguments.CollabPTCFlag)>
			AND	CollabPTCFlag = <cfqueryparam value="#arguments.CollabPTCFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CollabPTCSpecify") and len(arguments.CollabPTCSpecify)>
			AND	CollabPTCSpecify = <cfqueryparam value="#arguments.CollabPTCSpecify#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"CollabAgencyFlag") and len(arguments.CollabAgencyFlag)>
			AND	CollabAgencyFlag = <cfqueryparam value="#arguments.CollabAgencyFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CollabAgencySpecify") and len(arguments.CollabAgencySpecify)>
			AND	CollabAgencySpecify = <cfqueryparam value="#arguments.CollabAgencySpecify#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"competenceDesign") and len(arguments.competenceDesign)>
			AND	competenceDesign = <cfqueryparam value="#arguments.competenceDesign#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"performanceDesign") and len(arguments.performanceDesign)>
			AND	performanceDesign = <cfqueryparam value="#arguments.performanceDesign#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"outcomesDesign") and len(arguments.outcomesDesign)>
			AND	outcomesDesign = <cfqueryparam value="#arguments.outcomesDesign#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"competenceEval") and len(arguments.competenceEval)>
			AND	competenceEval = <cfqueryparam value="#arguments.competenceEval#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"performanceEval") and len(arguments.performanceEval)>
			AND	performanceEval = <cfqueryparam value="#arguments.performanceEval#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"outcomesEval") and len(arguments.outcomesEval)>
			AND	outcomesEval = <cfqueryparam value="#arguments.outcomesEval#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
