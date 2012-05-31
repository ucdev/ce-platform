<cfcomponent displayname="AssessAnswerDAO" hint="table ID column = AnswerID">

	<cffunction name="init" access="public" output="false" returntype="_com.AssessAnswer.AssessAnswerDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AssessAnswer" type="_com.AssessAnswer.AssessAnswer" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_AssessAnswer
					(
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
					CorrectFlag
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AssessAnswer.getResultID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getResultID())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getAssessmentID())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getQuestionID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getQuestionID())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getI1()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getI1())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getI2()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getI2())#" />,
					dbo.HTMLDecode(<cfqueryparam value="#arguments.AssessAnswer.getVC1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getVC1())#" />),
					dbo.HTMLDecode(<cfqueryparam value="#arguments.AssessAnswer.getVC2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getVC2())#" />),
					<cfqueryparam value="#arguments.AssessAnswer.getDT1()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessAnswer.getDT1())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getDT2()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessAnswer.getDT2())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getTXT1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getTXT1())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getTXT2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getTXT2())#" />,
					<cfqueryparam value="#arguments.AssessAnswer.getCorrectFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessAnswer.getCorrectFlag())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.AssessAnswer.AssessAnswer">
		<cfargument name="AssessAnswer" type="_com.AssessAnswer.AssessAnswer" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					AnswerID,
					ResultID,
					AssessmentID,
					QuestionID,
					I1,
					I2,
					dbo.HTMLDecode(VC1) AS VC1,
					dbo.HTMLDecode(VC2) AS VC2,
					DT1,
					DT2,
					TXT1,
					TXT2,
					CorrectFlag,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_AssessAnswer
				WHERE	ResultID = <cfqueryparam value="#arguments.AssessAnswer.getResultID()#" CFSQLType="cf_sql_integer" /> AND QuestionID = <cfqueryparam value="#arguments.AssessAnswer.getQuestionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessAnswerBean = arguments.AssessAnswer.init(argumentCollection=strReturn)>
			<cfreturn AssessAnswerBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AssessAnswer" type="_com.AssessAnswer.AssessAnswer" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AssessAnswer
				SET
					ResultID = <cfqueryparam value="#arguments.AssessAnswer.getResultID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getResultID())#" />,
					AssessmentID = <cfqueryparam value="#arguments.AssessAnswer.getAssessmentID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getAssessmentID())#" />,
					QuestionID = <cfqueryparam value="#arguments.AssessAnswer.getQuestionID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getQuestionID())#" />,
					I1 = <cfqueryparam value="#arguments.AssessAnswer.getI1()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getI1())#" />,
					I2 = <cfqueryparam value="#arguments.AssessAnswer.getI2()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessAnswer.getI2())#" />,
					VC1 = dbo.HTMLDecode(<cfqueryparam value="#arguments.AssessAnswer.getVC1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getVC1())#" />),
					VC2 = dbo.HTMLDecode(<cfqueryparam value="#arguments.AssessAnswer.getVC2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getVC2())#" />),
					DT1 = <cfqueryparam value="#arguments.AssessAnswer.getDT1()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessAnswer.getDT1())#" />,
					DT2 = <cfqueryparam value="#arguments.AssessAnswer.getDT2()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessAnswer.getDT2())#" />,
					TXT1 = <cfqueryparam value="#arguments.AssessAnswer.getTXT1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getTXT1())#" />,
					TXT2 = <cfqueryparam value="#arguments.AssessAnswer.getTXT2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessAnswer.getTXT2())#" />,
					CorrectFlag = <cfqueryparam value="#arguments.AssessAnswer.getCorrectFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessAnswer.getCorrectFlag())#" />,
					Created = <cfqueryparam value="#arguments.AssessAnswer.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessAnswer.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.AssessAnswer.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessAnswer.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.AssessAnswer.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessAnswer.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AssessAnswer.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessAnswer.getDeletedFlag())#" />
				WHERE	ResultID = <cfqueryparam value="#arguments.AssessAnswer.getResultID()#" CFSQLType="cf_sql_integer" /> AND QuestionID = <cfqueryparam value="#arguments.AssessAnswer.getQuestionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AssessAnswer" type="_com.AssessAnswer.AssessAnswer" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_AssessAnswer 
				WHERE	ResultID = <cfqueryparam value="#arguments.AssessAnswer.getResultID()#" CFSQLType="cf_sql_integer" /> AND QuestionID = <cfqueryparam value="#arguments.AssessAnswer.getQuestionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AssessAnswer" type="_com.AssessAnswer.AssessAnswer" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AssessAnswer
			WHERE	ResultID = <cfqueryparam value="#arguments.AssessAnswer.getResultID()#" CFSQLType="cf_sql_integer" /> AND QuestionID = <cfqueryparam value="#arguments.AssessAnswer.getQuestionID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AssessAnswer" type="_com.AssessAnswer.AssessAnswer" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AssessAnswer)>
			<cfset success = update(arguments.AssessAnswer) />
		<cfelse>
			<cfset success = create(arguments.AssessAnswer) />
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
