<cfcomponent displayname="AssessQuestionDAO" hint="table ID column = QuestionID">

	<cffunction name="init" access="public" output="false" returntype="_com.AssessQuestion.AssessQuestionDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="AssessQuestion" type="_com.AssessQuestion.AssessQuestion" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ce_AssessQuestion
					(
					QuestionTypeID,
					AssessmentID,
					LabelText,
					DetailText,
					RequiredFlag,
					CorrectField,
					SectionID,
					Sort,
					i1,
					i2,
					i3,
					i4,
					i5,
					i6,
					i7,
					i8,
					i9,
					i10,
					vc1,
					vc2,
					vc3,
					vc4,
					vc5,
					vc6,
					vc7,
					vc8,
					vc9,
					vc10,
					dt1,
					dt2,
					dt3,
					dt4,
					dt5,
					txt1,
					txt2,
					txt3,
					txt4,
					txt5,
					ExternalID
					)
				VALUES
					(
					<cfqueryparam value="#arguments.AssessQuestion.getQuestionTypeID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.AssessQuestion.getAssessmentID()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.AssessQuestion.getLabelText()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.AssessQuestion.getDetailText()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getDetailText())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getRequiredFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessQuestion.getRequiredFlag())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getCorrectField()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessQuestion.getCorrectField())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getSectionID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.getSectionID())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.getSort())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti1()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti1())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti2()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti2())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti3()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti3())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti4()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti4())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti5()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti5())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti6()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti6())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti7()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti7())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti8()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti8())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti9()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti9())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.geti10()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti10())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc1())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc2())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc3())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc4()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc4())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc5()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc5())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc6()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc6())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc7()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc7())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc8()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc8())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc9()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc9())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getvc10()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc10())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getdt1()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt1())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getdt2()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt2())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getdt3()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt3())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getdt4()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt4())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getdt5()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt5())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.gettxt1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt1())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.gettxt2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt2())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.gettxt3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt3())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.gettxt4()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt4())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.gettxt5()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt5())#" />,
					<cfqueryparam value="#arguments.AssessQuestion.getExternalID()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getExternalID())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="_com.AssessQuestion.AssessQuestion">
		<cfargument name="AssessQuestion" type="_com.AssessQuestion.AssessQuestion" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					QuestionID,
					QuestionTypeID,
					AssessmentID,
					LabelText,
					DetailText,
					RequiredFlag,
					CorrectField,
					SectionID,
					Sort,
					i1,
					i2,
					i3,
					i4,
					i5,
					i6,
					i7,
					i8,
					i9,
					i10,
					vc1,
					vc2,
					vc3,
					vc4,
					vc5,
					vc6,
					vc7,
					vc8,
					vc9,
					vc10,
					dt1,
					dt2,
					dt3,
					dt4,
					dt5,
					txt1,
					txt2,
					txt3,
					txt4,
					txt5,
					ExternalID,
					Created,
					Updated,
					Deleted,
					DeletedFlag
				FROM	ce_AssessQuestion
				WHERE	QuestionID = <cfqueryparam value="#arguments.AssessQuestion.getQuestionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset AssessQuestionBean = arguments.AssessQuestion.init(argumentCollection=strReturn)>
			<cfreturn AssessQuestionBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="AssessQuestion" type="_com.AssessQuestion.AssessQuestion" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ce_AssessQuestion
				SET
					QuestionTypeID = <cfqueryparam value="#arguments.AssessQuestion.getQuestionTypeID()#" CFSQLType="cf_sql_integer" />,
					AssessmentID = <cfqueryparam value="#arguments.AssessQuestion.getAssessmentID()#" CFSQLType="cf_sql_integer" />,
					LabelText = <cfqueryparam value="#arguments.AssessQuestion.getLabelText()#" CFSQLType="cf_sql_varchar" />,
					DetailText = <cfqueryparam value="#arguments.AssessQuestion.getDetailText()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getDetailText())#" />,
					RequiredFlag = <cfqueryparam value="#arguments.AssessQuestion.getRequiredFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessQuestion.getRequiredFlag())#" />,
					CorrectField = <cfqueryparam value="#arguments.AssessQuestion.getCorrectField()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessQuestion.getCorrectField())#" />,
					SectionID = <cfqueryparam value="#arguments.AssessQuestion.getSectionID()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.getSectionID())#" />,
					Sort = <cfqueryparam value="#arguments.AssessQuestion.getSort()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.getSort())#" />,
					i1 = <cfqueryparam value="#arguments.AssessQuestion.geti1()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti1())#" />,
					i2 = <cfqueryparam value="#arguments.AssessQuestion.geti2()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti2())#" />,
					i3 = <cfqueryparam value="#arguments.AssessQuestion.geti3()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti3())#" />,
					i4 = <cfqueryparam value="#arguments.AssessQuestion.geti4()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti4())#" />,
					i5 = <cfqueryparam value="#arguments.AssessQuestion.geti5()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti5())#" />,
					i6 = <cfqueryparam value="#arguments.AssessQuestion.geti6()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti6())#" />,
					i7 = <cfqueryparam value="#arguments.AssessQuestion.geti7()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti7())#" />,
					i8 = <cfqueryparam value="#arguments.AssessQuestion.geti8()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti8())#" />,
					i9 = <cfqueryparam value="#arguments.AssessQuestion.geti9()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti9())#" />,
					i10 = <cfqueryparam value="#arguments.AssessQuestion.geti10()#" CFSQLType="cf_sql_integer" null="#not len(arguments.AssessQuestion.geti10())#" />,
					vc1 = <cfqueryparam value="#arguments.AssessQuestion.getvc1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc1())#" />,
					vc2 = <cfqueryparam value="#arguments.AssessQuestion.getvc2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc2())#" />,
					vc3 = <cfqueryparam value="#arguments.AssessQuestion.getvc3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc3())#" />,
					vc4 = <cfqueryparam value="#arguments.AssessQuestion.getvc4()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc4())#" />,
					vc5 = <cfqueryparam value="#arguments.AssessQuestion.getvc5()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc5())#" />,
					vc6 = <cfqueryparam value="#arguments.AssessQuestion.getvc6()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc6())#" />,
					vc7 = <cfqueryparam value="#arguments.AssessQuestion.getvc7()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc7())#" />,
					vc8 = <cfqueryparam value="#arguments.AssessQuestion.getvc8()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc8())#" />,
					vc9 = <cfqueryparam value="#arguments.AssessQuestion.getvc9()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc9())#" />,
					vc10 = <cfqueryparam value="#arguments.AssessQuestion.getvc10()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getvc10())#" />,
					dt1 = <cfqueryparam value="#arguments.AssessQuestion.getdt1()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt1())#" />,
					dt2 = <cfqueryparam value="#arguments.AssessQuestion.getdt2()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt2())#" />,
					dt3 = <cfqueryparam value="#arguments.AssessQuestion.getdt3()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt3())#" />,
					dt4 = <cfqueryparam value="#arguments.AssessQuestion.getdt4()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt4())#" />,
					dt5 = <cfqueryparam value="#arguments.AssessQuestion.getdt5()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getdt5())#" />,
					txt1 = <cfqueryparam value="#arguments.AssessQuestion.gettxt1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt1())#" />,
					txt2 = <cfqueryparam value="#arguments.AssessQuestion.gettxt2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt2())#" />,
					txt3 = <cfqueryparam value="#arguments.AssessQuestion.gettxt3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt3())#" />,
					txt4 = <cfqueryparam value="#arguments.AssessQuestion.gettxt4()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt4())#" />,
					txt5 = <cfqueryparam value="#arguments.AssessQuestion.gettxt5()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.gettxt5())#" />,
					ExternalID = <cfqueryparam value="#arguments.AssessQuestion.getExternalID()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.AssessQuestion.getExternalID())#" />,
					Created = <cfqueryparam value="#arguments.AssessQuestion.getCreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getCreated())#" />,
					Updated = <cfqueryparam value="#arguments.AssessQuestion.getUpdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getUpdated())#" />,
					Deleted = <cfqueryparam value="#arguments.AssessQuestion.getDeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.AssessQuestion.getDeleted())#" />,
					DeletedFlag = <cfqueryparam value="#arguments.AssessQuestion.getDeletedFlag()#" CFSQLType="cf_sql_char" null="#not len(arguments.AssessQuestion.getDeletedFlag())#" />
				WHERE	QuestionID = <cfqueryparam value="#arguments.AssessQuestion.getQuestionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="AssessQuestion" type="_com.AssessQuestion.AssessQuestion" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ce_AssessQuestion 
				WHERE	QuestionID = <cfqueryparam value="#arguments.AssessQuestion.getQuestionID()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="AssessQuestion" type="_com.AssessQuestion.AssessQuestion" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ce_AssessQuestion
			WHERE	QuestionID = <cfqueryparam value="#arguments.AssessQuestion.getQuestionID()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="AssessQuestion" type="_com.AssessQuestion.AssessQuestion" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.AssessQuestion)>
			<cfset success = update(arguments.AssessQuestion) />
		<cfelse>
			<cfset success = create(arguments.AssessQuestion) />
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
