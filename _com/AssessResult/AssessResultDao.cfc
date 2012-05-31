
<cfcomponent displayname="AssessResultDAO" hint="table ID column = ResultID">

	<cffunction name="init" access="public" output="false" returntype="_com.AssessResult.AssessResultDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_AssessResult
					(
					PersonID,
					AssessmentID,
					ResultStatusID,
					Score
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getPersonID())#" />,
					<cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getAssessmentID())#" />,
					<cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getResultStatusID())#" />,
					<cfqueryparam value="#arguments.AssessResult.getScore()#" CFSQLType="cf_sql_float" null="#not len(arguments.AssessResult.getScore())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.AssessResult.AssessResult">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ResultID,
					PersonID,
					AssessmentID,
					ResultStatusID,
					Score,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_AssessResult
				WHERE	AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" />
				<!---<cfif arguments.AssessResult.getResultStatusID() GT 0>
					AND ResultStatusID = <cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" />
				</cfif>--->
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessResultBean = arguments.AssessResult.init(argumentCollection=strReturn)>
			<cfreturn AssessResultBean>
		</cfif>
	</cffunction>

	<cffunction name="readPosttest" access="public" output="false" returntype="_com.AssessResult.AssessResult">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT TOP 1
					ResultID,
					PersonID,
					AssessmentID,
					ResultStatusID,
					Score,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_AssessResult
				WHERE	AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" /> AND DeletedFlag = <cfqueryparam value="N" CFSQLType="cf_sql_char" />
                ORDER BY Score DESC
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessResultBean = arguments.AssessResult.init(argumentCollection=strReturn)>
			<cfreturn AssessResultBean>
		</cfif>
	</cffunction>

	<cffunction name="readOpenPosttest" access="public" output="false" returntype="_com.AssessResult.AssessResult">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT TOP 1
					ResultID,
					PersonID,
					AssessmentID,
					ResultStatusID,
					Score,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_AssessResult
				WHERE	AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" /> AND DeletedFlag = <cfqueryparam value="N" CFSQLType="cf_sql_char" /> AND Score IS NULL
                ORDER BY Score DESC
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessResultBean = arguments.AssessResult.init(argumentCollection=strReturn)>
			<cfreturn AssessResultBean>
		</cfif>
	</cffunction>

	<cffunction name="readByResultID" access="public" output="false" returntype="_com.AssessResult.AssessResult">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					ResultID,
					PersonID,
					AssessmentID,
					ResultStatusID,
					Score,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_AssessResult
				WHERE	ResultID = <cfqueryparam value="#arguments.AssessResult.getResultID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessResultBean = arguments.AssessResult.init(argumentCollection=strReturn)>
			<cfreturn AssessResultBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AssessResult
				SET
					PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getPersonID())#" />,
					AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getAssessmentID())#" />,
					ResultStatusID = <cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getResultStatusID())#" />,
					Score = <cfqueryparam value="#arguments.AssessResult.getScore()#" CFSQLType="cf_sql_float" null="#not len(arguments.AssessResult.getScore())#" />,
					Created = <cfqueryparam value="#arguments.AssessResult.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessResult.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.AssessResult.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessResult.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.AssessResult.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessResult.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AssessResult.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessResult.getDeletedFlag())#" />
				WHERE	AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" />
				<!---
				NOT SURE WHY THIS CODE WAS IN HERE // 12/16/2009
				<cfif arguments.AssessResult.getResultStatusID() GT 0>
					AND ResultStatusID = <cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" />
				</cfif>--->
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="updateByResultID" hint="User for public_Assessment.MarkComplete functoinality." access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AssessResult
				SET
					PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getPersonID())#" />,
					AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getAssessmentID())#" />,
					ResultStatusID = <cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessResult.getResultStatusID())#" />,
					Score = <cfqueryparam value="#arguments.AssessResult.getScore()#" CFSQLType="cf_sql_float" null="#not len(arguments.AssessResult.getScore())#" />,
					Created = <cfqueryparam value="#arguments.AssessResult.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessResult.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.AssessResult.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessResult.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.AssessResult.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessResult.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AssessResult.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessResult.getDeletedFlag())#" />
				WHERE	ResultID = <cfqueryparam value="#arguments.AssessResult.getResultID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_AssessResult 
				WHERE	AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" />
				<!---<cfif arguments.AssessResult.getResultStatusID() GT 0>
					AND ResultStatusID = <cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" />
				</cfif>--->
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AssessResult
				WHERE	AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" />
				<!---<cfif arguments.AssessResult.getResultStatusID() GT 0>
					AND ResultStatusID = <cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" />
				</cfif>--->
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="existsOpenPostTest" hint="Checks if there is a post test result that is open" access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AssessResult
				WHERE	AssessmentID = <cfqueryparam value="#arguments.AssessResult.getAssessmentID()#" CFSQLType="cf_sql_integer" /> AND PersonID = <cfqueryparam value="#arguments.AssessResult.getPersonID()#" CFSQLType="cf_sql_integer" /> AND Score IS NULL
				<!---<cfif arguments.AssessResult.getResultStatusID() GT 0>
					AND ResultStatusID = <cfqueryparam value="#arguments.AssessResult.getResultStatusID()#" CFSQLType="cf_sql_integer" />
				</cfif>--->
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="existsByResultID" access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AssessResult
			WHERE	ResultID = <cfqueryparam value="#arguments.AssessResult.getResultID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AssessResult" type="_com.AssessResult.AssessResult" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AssessResult)>
			<cfset success = update(arguments.AssessResult) />
		<cfelse>
			<cfset success = create(arguments.AssessResult) />
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
