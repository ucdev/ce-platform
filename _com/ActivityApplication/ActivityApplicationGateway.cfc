<cfcomponent displayname="ActivityApplicationGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.ActivityApplication.ActivityApplicationGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="ApplicationID" type="numeric" required="false" />
		<cfargument name="ActivityID" type="numeric" required="false" />
		<cfargument name="ReceivedFlag" type="string" required="false" />
		<cfargument name="ReceivedDate" type="date" required="false" />
		<cfargument name="SentFlag" type="string" required="false" />
		<cfargument name="SentDate" type="date" required="false" />
		<cfargument name="ApprovedFlag" type="string" required="false" />
		<cfargument name="ApprovedDate" type="date" required="false" />
		<cfargument name="NeedsFlag" type="string" required="false" />
		<cfargument name="NeedsDate" type="date" required="false" />
		<cfargument name="ObjFlag" type="string" required="false" />
		<cfargument name="ObjDate" type="date" required="false" />
		<cfargument name="SuppFlag" type="string" required="false" />
		<cfargument name="SuppDate" type="date" required="false" />
		<cfargument name="AttendFlag" type="string" required="false" />
		<cfargument name="AttendDate" type="date" required="false" />
		<cfargument name="CVFlag" type="string" required="false" />
		<cfargument name="CVDate" type="date" required="false" />
		<cfargument name="BrochFlag" type="string" required="false" />
		<cfargument name="BrochDate" type="date" required="false" />
		<cfargument name="MembApprFlag" type="string" required="false" />
		<cfargument name="MembApprDate" type="date" required="false" />
		<cfargument name="ConflictFlag" type="string" required="false" />
		<cfargument name="ConflictDate" type="date" required="false" />
		<cfargument name="EvalFlag" type="string" required="false" />
		<cfargument name="EvalDate" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
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
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"ApplicationID") and len(arguments.ApplicationID)>
			AND	ApplicationID = <cfqueryparam value="#arguments.ApplicationID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ActivityID") and len(arguments.ActivityID)>
			AND	ActivityID = <cfqueryparam value="#arguments.ActivityID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ReceivedFlag") and len(arguments.ReceivedFlag)>
			AND	ReceivedFlag = <cfqueryparam value="#arguments.ReceivedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ReceivedDate") and len(arguments.ReceivedDate)>
			AND	ReceivedDate = <cfqueryparam value="#arguments.ReceivedDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"SentFlag") and len(arguments.SentFlag)>
			AND	SentFlag = <cfqueryparam value="#arguments.SentFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SentDate") and len(arguments.SentDate)>
			AND	SentDate = <cfqueryparam value="#arguments.SentDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"ApprovedFlag") and len(arguments.ApprovedFlag)>
			AND	ApprovedFlag = <cfqueryparam value="#arguments.ApprovedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ApprovedDate") and len(arguments.ApprovedDate)>
			AND	ApprovedDate = <cfqueryparam value="#arguments.ApprovedDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"NeedsFlag") and len(arguments.NeedsFlag)>
			AND	NeedsFlag = <cfqueryparam value="#arguments.NeedsFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"NeedsDate") and len(arguments.NeedsDate)>
			AND	NeedsDate = <cfqueryparam value="#arguments.NeedsDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"ObjFlag") and len(arguments.ObjFlag)>
			AND	ObjFlag = <cfqueryparam value="#arguments.ObjFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ObjDate") and len(arguments.ObjDate)>
			AND	ObjDate = <cfqueryparam value="#arguments.ObjDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"SuppFlag") and len(arguments.SuppFlag)>
			AND	SuppFlag = <cfqueryparam value="#arguments.SuppFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SuppDate") and len(arguments.SuppDate)>
			AND	SuppDate = <cfqueryparam value="#arguments.SuppDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"AttendFlag") and len(arguments.AttendFlag)>
			AND	AttendFlag = <cfqueryparam value="#arguments.AttendFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"AttendDate") and len(arguments.AttendDate)>
			AND	AttendDate = <cfqueryparam value="#arguments.AttendDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"CVFlag") and len(arguments.CVFlag)>
			AND	CVFlag = <cfqueryparam value="#arguments.CVFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CVDate") and len(arguments.CVDate)>
			AND	CVDate = <cfqueryparam value="#arguments.CVDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"BrochFlag") and len(arguments.BrochFlag)>
			AND	BrochFlag = <cfqueryparam value="#arguments.BrochFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"BrochDate") and len(arguments.BrochDate)>
			AND	BrochDate = <cfqueryparam value="#arguments.BrochDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"MembApprFlag") and len(arguments.MembApprFlag)>
			AND	MembApprFlag = <cfqueryparam value="#arguments.MembApprFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"MembApprDate") and len(arguments.MembApprDate)>
			AND	MembApprDate = <cfqueryparam value="#arguments.MembApprDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"ConflictFlag") and len(arguments.ConflictFlag)>
			AND	ConflictFlag = <cfqueryparam value="#arguments.ConflictFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"ConflictDate") and len(arguments.ConflictDate)>
			AND	ConflictDate = <cfqueryparam value="#arguments.ConflictDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"EvalFlag") and len(arguments.EvalFlag)>
			AND	EvalFlag = <cfqueryparam value="#arguments.EvalFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"EvalDate") and len(arguments.EvalDate)>
			AND	EvalDate = <cfqueryparam value="#arguments.EvalDate#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
