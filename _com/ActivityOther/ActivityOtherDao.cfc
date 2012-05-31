
<cfcomponent displayname="activityOtherDAO" hint="table ID column = OtherID">

	<cffunction name="init" access="public" output="false" returntype="_com.activityOther.activityOtherDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="activityOther" type="_com.activityOther.activityOther" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_Activity_Other
					(
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
					)
				VALUES
					(
					<cfqueryparam value="#arguments.activityOther.getActivityID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.activityOther.getDidacticHrs()#" CFSQLType="cf_sql_float" null="#not len(arguments.activityOther.getDidacticHrs())#" />,
					<cfqueryparam value="#arguments.activityOther.getExperimentalHrs()#" CFSQLType="cf_sql_float" null="#not len(arguments.activityOther.getExperimentalHrs())#" />,
					<cfqueryparam value="#arguments.activityOther.getSecClinSiteFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.activityOther.getSecClinSiteFlag())#" />,
					<cfqueryparam value="#arguments.activityOther.getCollabPTCFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.activityOther.getCollabPTCFlag())#" />,
					<cfqueryparam value="#arguments.activityOther.getCollabPTCSpecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.activityOther.getCollabPTCSpecify())#" />,
					<cfqueryparam value="#arguments.activityOther.getCollabAgencyFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.activityOther.getCollabAgencyFlag())#" />,
					<cfqueryparam value="#arguments.activityOther.getCollabAgencySpecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.activityOther.getCollabAgencySpecify())#" />,
					<cfqueryparam value="#arguments.activityOther.getcompetenceDesign()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getcompetenceDesign())#" />,
					<cfqueryparam value="#arguments.activityOther.getperformanceDesign()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getperformanceDesign())#" />,
					<cfqueryparam value="#arguments.activityOther.getoutcomesDesign()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getoutcomesDesign())#" />,
					<cfqueryparam value="#arguments.activityOther.getcompetenceEval()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getcompetenceEval())#" />,
					<cfqueryparam value="#arguments.activityOther.getperformanceEval()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getperformanceEval())#" />,
					<cfqueryparam value="#arguments.activityOther.getoutcomesEval()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getoutcomesEval())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.activityOther.activityOther">
		<cfargument name="activityOther" type="_com.activityOther.activityOther" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE	activityID = <cfqueryparam value="#arguments.activityOther.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset activityOtherBean = arguments.activityOther.init(argumentCollection=strReturn)>
			<cfreturn activityOtherBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="activityOther" type="_com.activityOther.activityOther" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_Activity_Other
				SET
					ActivityID = <cfqueryparam value="#arguments.activityOther.getActivityID()#" CFSQLType="cf_sql_integer" />,
					DidacticHrs = <cfqueryparam value="#arguments.activityOther.getDidacticHrs()#" CFSQLType="cf_sql_float" null="#not len(arguments.activityOther.getDidacticHrs())#" />,
					ExperimentalHrs = <cfqueryparam value="#arguments.activityOther.getExperimentalHrs()#" CFSQLType="cf_sql_float" null="#not len(arguments.activityOther.getExperimentalHrs())#" />,
					SecClinSiteFlag = <cfqueryparam value="#arguments.activityOther.getSecClinSiteFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.activityOther.getSecClinSiteFlag())#" />,
					CollabPTCFlag = <cfqueryparam value="#arguments.activityOther.getCollabPTCFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.activityOther.getCollabPTCFlag())#" />,
					CollabPTCSpecify = <cfqueryparam value="#arguments.activityOther.getCollabPTCSpecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.activityOther.getCollabPTCSpecify())#" />,
					CollabAgencyFlag = <cfqueryparam value="#arguments.activityOther.getCollabAgencyFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.activityOther.getCollabAgencyFlag())#" />,
					CollabAgencySpecify = <cfqueryparam value="#arguments.activityOther.getCollabAgencySpecify()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.activityOther.getCollabAgencySpecify())#" />,
					competenceDesign = <cfqueryparam value="#arguments.activityOther.getcompetenceDesign()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getcompetenceDesign())#" />,
					performanceDesign = <cfqueryparam value="#arguments.activityOther.getperformanceDesign()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getperformanceDesign())#" />,
					outcomesDesign = <cfqueryparam value="#arguments.activityOther.getoutcomesDesign()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getoutcomesDesign())#" />,
					competenceEval = <cfqueryparam value="#arguments.activityOther.getcompetenceEval()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getcompetenceEval())#" />,
					performanceEval = <cfqueryparam value="#arguments.activityOther.getperformanceEval()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getperformanceEval())#" />,
					outcomesEval = <cfqueryparam value="#arguments.activityOther.getoutcomesEval()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.activityOther.getoutcomesEval())#" />
				WHERE	activityID = <cfqueryparam value="#arguments.activityOther.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="activityOther" type="_com.activityOther.activityOther" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_Activity_Other 
				WHERE	activityID = <cfqueryparam value="#arguments.activityOther.getActivityID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="activityOther" type="_com.activityOther.activityOther" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_Activity_Other
			WHERE	activityID = <cfqueryparam value="#arguments.activityOther.getActivityID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="activityOther" type="_com.activityOther.activityOther" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.activityOther)>
			<cfset success = update(arguments.activityOther) />
		<cfelse>
			<cfset success = create(arguments.activityOther) />
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
