<cfcomponent displayname="AssessAnswerGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.AssessAnswer.AssessAnswerGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="AnswerID" type="numeric" required="false" />
		<cfargument name="ResultID" type="numeric" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="QuestionID" type="numeric" required="false" />
		<cfargument name="I1" type="numeric" required="false" />
		<cfargument name="I2" type="numeric" required="false" />
		<cfargument name="VC1" type="string" required="false" />
		<cfargument name="VC2" type="string" required="false" />
		<cfargument name="DT1" type="date" required="false" />
		<cfargument name="DT2" type="date" required="false" />
		<cfargument name="TXT1" type="string" required="false" />
		<cfargument name="TXT2" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				AnswerID,
				ResultID,
				AssessmentID,
				QuestionID,
				I1,
				I2,
				VC1,
				VC2,
				DT1,
				DT2,
				TXT1,
				TXT2,
				Created,
				Updated,
				Deleted,
				DeletedFlag
			FROM	ce_AssessAnswer
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"AnswerID") and len(arguments.AnswerID)>
			AND	AnswerID = <cfqueryparam value="#arguments.AnswerID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"ResultID") and len(arguments.ResultID)>
			AND	ResultID = <cfqueryparam value="#arguments.ResultID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"QuestionID") and len(arguments.QuestionID)>
			AND	QuestionID = <cfqueryparam value="#arguments.QuestionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"I1") and len(arguments.I1)>
			AND	I1 = <cfqueryparam value="#arguments.I1#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"I2") and len(arguments.I2)>
			AND	I2 = <cfqueryparam value="#arguments.I2#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"VC1") and len(arguments.VC1)>
			AND	VC1 = <cfqueryparam value="#arguments.VC1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"VC2") and len(arguments.VC2)>
			AND	VC2 = <cfqueryparam value="#arguments.VC2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DT1") and len(arguments.DT1)>
			AND	DT1 = <cfqueryparam value="#arguments.DT1#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DT2") and len(arguments.DT2)>
			AND	DT2 = <cfqueryparam value="#arguments.DT2#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"TXT1") and len(arguments.TXT1)>
			AND	TXT1 = <cfqueryparam value="#arguments.TXT1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"TXT2") and len(arguments.TXT2)>
			AND	TXT2 = <cfqueryparam value="#arguments.TXT2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND	Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND	Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND	Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND	DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
