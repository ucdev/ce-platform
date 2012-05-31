<cfcomponent displayname="AssessQuestionGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="_com.AssessQuestion.AssessQuestionGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="QuestionID" type="numeric" required="false" />
		<cfargument name="QuestionTypeID" type="numeric" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="LabelText" type="string" required="false" />
		<cfargument name="DetailText" type="string" required="false" />
		<cfargument name="RequiredFlag" type="string" required="false" />
		<cfargument name="CorrectField" type="string" required="false" />
		<cfargument name="SectionID" type="numeric" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="i1" type="numeric" required="false" />
		<cfargument name="i2" type="numeric" required="false" />
		<cfargument name="i3" type="numeric" required="false" />
		<cfargument name="i4" type="numeric" required="false" />
		<cfargument name="i5" type="numeric" required="false" />
		<cfargument name="i6" type="numeric" required="false" />
		<cfargument name="i7" type="numeric" required="false" />
		<cfargument name="i8" type="numeric" required="false" />
		<cfargument name="i9" type="numeric" required="false" />
		<cfargument name="i10" type="numeric" required="false" />
		<cfargument name="vc1" type="string" required="false" />
		<cfargument name="vc2" type="string" required="false" />
		<cfargument name="vc3" type="string" required="false" />
		<cfargument name="vc4" type="string" required="false" />
		<cfargument name="vc5" type="string" required="false" />
		<cfargument name="vc6" type="string" required="false" />
		<cfargument name="vc7" type="string" required="false" />
		<cfargument name="vc8" type="string" required="false" />
		<cfargument name="vc9" type="string" required="false" />
		<cfargument name="vc10" type="string" required="false" />
		<cfargument name="dt1" type="date" required="false" />
		<cfargument name="dt2" type="date" required="false" />
		<cfargument name="dt3" type="date" required="false" />
		<cfargument name="dt4" type="date" required="false" />
		<cfargument name="dt5" type="date" required="false" />
		<cfargument name="txt1" type="string" required="false" />
		<cfargument name="txt2" type="string" required="false" />
		<cfargument name="txt3" type="string" required="false" />
		<cfargument name="txt4" type="string" required="false" />
		<cfargument name="txt5" type="string" required="false" />
		<cfargument name="ExternalID" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
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
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"QuestionID") and len(arguments.QuestionID)>
			AND	QuestionID = <cfqueryparam value="#arguments.QuestionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"QuestionTypeID") and len(arguments.QuestionTypeID)>
			AND	QuestionTypeID = <cfqueryparam value="#arguments.QuestionTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"LabelText") and len(arguments.LabelText)>
			AND	LabelText = <cfqueryparam value="#arguments.LabelText#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DetailText") and len(arguments.DetailText)>
			AND	DetailText = <cfqueryparam value="#arguments.DetailText#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"RequiredFlag") and len(arguments.RequiredFlag)>
			AND	RequiredFlag = <cfqueryparam value="#arguments.RequiredFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CorrectField") and len(arguments.CorrectField)>
			AND	CorrectField = <cfqueryparam value="#arguments.CorrectField#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SectionID") and len(arguments.SectionID)>
			AND	SectionID = <cfqueryparam value="#arguments.SectionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i1") and len(arguments.i1)>
			AND	i1 = <cfqueryparam value="#arguments.i1#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i2") and len(arguments.i2)>
			AND	i2 = <cfqueryparam value="#arguments.i2#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i3") and len(arguments.i3)>
			AND	i3 = <cfqueryparam value="#arguments.i3#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i4") and len(arguments.i4)>
			AND	i4 = <cfqueryparam value="#arguments.i4#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i5") and len(arguments.i5)>
			AND	i5 = <cfqueryparam value="#arguments.i5#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i6") and len(arguments.i6)>
			AND	i6 = <cfqueryparam value="#arguments.i6#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i7") and len(arguments.i7)>
			AND	i7 = <cfqueryparam value="#arguments.i7#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i8") and len(arguments.i8)>
			AND	i8 = <cfqueryparam value="#arguments.i8#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i9") and len(arguments.i9)>
			AND	i9 = <cfqueryparam value="#arguments.i9#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i10") and len(arguments.i10)>
			AND	i10 = <cfqueryparam value="#arguments.i10#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"vc1") and len(arguments.vc1)>
			AND	vc1 = <cfqueryparam value="#arguments.vc1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc2") and len(arguments.vc2)>
			AND	vc2 = <cfqueryparam value="#arguments.vc2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc3") and len(arguments.vc3)>
			AND	vc3 = <cfqueryparam value="#arguments.vc3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc4") and len(arguments.vc4)>
			AND	vc4 = <cfqueryparam value="#arguments.vc4#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc5") and len(arguments.vc5)>
			AND	vc5 = <cfqueryparam value="#arguments.vc5#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc6") and len(arguments.vc6)>
			AND	vc6 = <cfqueryparam value="#arguments.vc6#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc7") and len(arguments.vc7)>
			AND	vc7 = <cfqueryparam value="#arguments.vc7#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc8") and len(arguments.vc8)>
			AND	vc8 = <cfqueryparam value="#arguments.vc8#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc9") and len(arguments.vc9)>
			AND	vc9 = <cfqueryparam value="#arguments.vc9#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc10") and len(arguments.vc10)>
			AND	vc10 = <cfqueryparam value="#arguments.vc10#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"dt1") and len(arguments.dt1)>
			AND	dt1 = <cfqueryparam value="#arguments.dt1#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt2") and len(arguments.dt2)>
			AND	dt2 = <cfqueryparam value="#arguments.dt2#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt3") and len(arguments.dt3)>
			AND	dt3 = <cfqueryparam value="#arguments.dt3#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt4") and len(arguments.dt4)>
			AND	dt4 = <cfqueryparam value="#arguments.dt4#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt5") and len(arguments.dt5)>
			AND	dt5 = <cfqueryparam value="#arguments.dt5#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"txt1") and len(arguments.txt1)>
			AND	txt1 = <cfqueryparam value="#arguments.txt1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt2") and len(arguments.txt2)>
			AND	txt2 = <cfqueryparam value="#arguments.txt2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt3") and len(arguments.txt3)>
			AND	txt3 = <cfqueryparam value="#arguments.txt3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt4") and len(arguments.txt4)>
			AND	txt4 = <cfqueryparam value="#arguments.txt4#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt5") and len(arguments.txt5)>
			AND	txt5 = <cfqueryparam value="#arguments.txt5#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExternalID") and len(arguments.ExternalID)>
			AND	ExternalID = <cfqueryparam value="#arguments.ExternalID#" CFSQLType="cf_sql_varchar" />
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
	
	<cffunction name="getByViewAttributes" access="public" output="false" returntype="query">
		<cfargument name="QuestionID" type="numeric" required="false" />
		<cfargument name="QuestionTypeID" type="numeric" required="false" />
		<cfargument name="AssessmentID" type="numeric" required="false" />
		<cfargument name="LabelText" type="string" required="false" />
		<cfargument name="DetailText" type="string" required="false" />
		<cfargument name="RequiredFlag" type="string" required="false" />
		<cfargument name="CorrectField" type="string" required="false" />
		<cfargument name="SectionID" type="numeric" required="false" />
		<cfargument name="Sort" type="numeric" required="false" />
		<cfargument name="i1" type="numeric" required="false" />
		<cfargument name="i2" type="numeric" required="false" />
		<cfargument name="i3" type="numeric" required="false" />
		<cfargument name="i4" type="numeric" required="false" />
		<cfargument name="i5" type="numeric" required="false" />
		<cfargument name="i6" type="numeric" required="false" />
		<cfargument name="i7" type="numeric" required="false" />
		<cfargument name="i8" type="numeric" required="false" />
		<cfargument name="i9" type="numeric" required="false" />
		<cfargument name="i10" type="numeric" required="false" />
		<cfargument name="vc1" type="string" required="false" />
		<cfargument name="vc2" type="string" required="false" />
		<cfargument name="vc3" type="string" required="false" />
		<cfargument name="vc4" type="string" required="false" />
		<cfargument name="vc5" type="string" required="false" />
		<cfargument name="vc6" type="string" required="false" />
		<cfargument name="vc7" type="string" required="false" />
		<cfargument name="vc8" type="string" required="false" />
		<cfargument name="vc9" type="string" required="false" />
		<cfargument name="vc10" type="string" required="false" />
		<cfargument name="dt1" type="date" required="false" />
		<cfargument name="dt2" type="date" required="false" />
		<cfargument name="dt3" type="date" required="false" />
		<cfargument name="dt4" type="date" required="false" />
		<cfargument name="dt5" type="date" required="false" />
		<cfargument name="txt1" type="string" required="false" />
		<cfargument name="txt2" type="string" required="false" />
		<cfargument name="txt3" type="string" required="false" />
		<cfargument name="txt4" type="string" required="false" />
		<cfargument name="txt5" type="string" required="false" />
		<cfargument name="ExternalID" type="string" required="false" />
		<cfargument name="Created" type="date" required="false" />
		<cfargument name="Updated" type="date" required="false" />
		<cfargument name="Deleted" type="date" required="false" />
		<cfargument name="DeletedFlag" type="string" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				AQ.QuestionID,
				AQ.QuestionTypeID,
				AQ.AssessmentID,
				AQ.LabelText,
				AQ.DetailText,
				AQ.RequiredFlag,
				AQ.CorrectField,
				AQ.SectionID,
				AQ.Sort,
				AQ.i1,
				AQ.i2,
				AQ.i3,
				AQ.i4,
				AQ.i5,
				AQ.i6,
				AQ.i7,
				AQ.i8,
				AQ.i9,
				AQ.i10,
				AQ.vc1,
				AQ.vc2,
				AQ.vc3,
				AQ.vc4,
				AQ.vc5,
				AQ.vc6,
				AQ.vc7,
				AQ.vc8,
				AQ.vc9,
				AQ.vc10,
				AQ.dt1,
				AQ.dt2,
				AQ.dt3,
				AQ.dt4,
				AQ.dt5,
				AQ.txt1,
				AQ.txt2,
				AQ.txt3,
				AQ.txt4,
				AQ.txt5,
				AQ.ExternalID,
				AQ.Created,
				AQ.Updated,
				AQ.Deleted,
				AQ.DeletedFlag,
                AQT.Name,
                (SELECT COUNT(aa.answerId) FROM ce_AssessAnswer AS aa WHERE aa.questionId = AQ.questionId) AS answerCount
			FROM         ce_AssessQuestion AS AQ 
			INNER JOIN ce_Sys_AssessQuestionType AS AQT ON AQ.QuestionTypeID = aqt.QuestionTypeID 
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"QuestionID") and len(arguments.QuestionID)>
			AND	AQ.QuestionID = <cfqueryparam value="#arguments.QuestionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"QuestionTypeID") and len(arguments.QuestionTypeID)>
			AND	AQ.QuestionTypeID = <cfqueryparam value="#arguments.QuestionTypeID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"AssessmentID") and len(arguments.AssessmentID)>
			AND	AQ.AssessmentID = <cfqueryparam value="#arguments.AssessmentID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"LabelText") and len(arguments.LabelText)>
			AND	AQ.LabelText = <cfqueryparam value="#arguments.LabelText#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"DetailText") and len(arguments.DetailText)>
			AND	AQ.DetailText = <cfqueryparam value="#arguments.DetailText#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"RequiredFlag") and len(arguments.RequiredFlag)>
			AND	AQ.RequiredFlag = <cfqueryparam value="#arguments.RequiredFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"CorrectField") and len(arguments.CorrectField)>
			AND	AQ.CorrectField = <cfqueryparam value="#arguments.CorrectField#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"SectionID") and len(arguments.SectionID)>
			AND	AQ.SectionID = <cfqueryparam value="#arguments.SectionID#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"Sort") and len(arguments.Sort)>
			AND	AQ.Sort = <cfqueryparam value="#arguments.Sort#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i1") and len(arguments.i1)>
			AND	AQ.i1 = <cfqueryparam value="#arguments.i1#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i2") and len(arguments.i2)>
			AND	AQ.i2 = <cfqueryparam value="#arguments.i2#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i3") and len(arguments.i3)>
			AND	AQ.i3 = <cfqueryparam value="#arguments.i3#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i4") and len(arguments.i4)>
			AND	AQ.i4 = <cfqueryparam value="#arguments.i4#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i5") and len(arguments.i5)>
			AND AQ.i5 = <cfqueryparam value="#arguments.i5#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i6") and len(arguments.i6)>
			AND AQ.i6 = <cfqueryparam value="#arguments.i6#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i7") and len(arguments.i7)>
			AND AQ.i7 = <cfqueryparam value="#arguments.i7#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i8") and len(arguments.i8)>
			AND AQ.i8 = <cfqueryparam value="#arguments.i8#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i9") and len(arguments.i9)>
			AND AQ.i9 = <cfqueryparam value="#arguments.i9#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"i10") and len(arguments.i10)>
			AND AQ.i10 = <cfqueryparam value="#arguments.i10#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"vc1") and len(arguments.vc1)>
			AND AQ.vc1 = <cfqueryparam value="#arguments.vc1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc2") and len(arguments.vc2)>
			AND AQ.vc2 = <cfqueryparam value="#arguments.vc2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc3") and len(arguments.vc3)>
			AND AQ.vc3 = <cfqueryparam value="#arguments.vc3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc4") and len(arguments.vc4)>
			AND AQ.vc4 = <cfqueryparam value="#arguments.vc4#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc5") and len(arguments.vc5)>
			AND AQ.vc5 = <cfqueryparam value="#arguments.vc5#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc6") and len(arguments.vc6)>
			AND AQ.vc6 = <cfqueryparam value="#arguments.vc6#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc7") and len(arguments.vc7)>
			AND AQ.vc7 = <cfqueryparam value="#arguments.vc7#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc8") and len(arguments.vc8)>
			AND AQ.vc8 = <cfqueryparam value="#arguments.vc8#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc9") and len(arguments.vc9)>
			AND AQ.vc9 = <cfqueryparam value="#arguments.vc9#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"vc10") and len(arguments.vc10)>
			AND AQ.vc10 = <cfqueryparam value="#arguments.vc10#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"dt1") and len(arguments.dt1)>
			AND AQ.dt1 = <cfqueryparam value="#arguments.dt1#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt2") and len(arguments.dt2)>
			AND AQ.dt2 = <cfqueryparam value="#arguments.dt2#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt3") and len(arguments.dt3)>
			AND AQ.dt3 = <cfqueryparam value="#arguments.dt3#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt4") and len(arguments.dt4)>
			AND AQ.dt4 = <cfqueryparam value="#arguments.dt4#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"dt5") and len(arguments.dt5)>
			AND AQ.dt5 = <cfqueryparam value="#arguments.dt5#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"txt1") and len(arguments.txt1)>
			AND AQ.txt1 = <cfqueryparam value="#arguments.txt1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt2") and len(arguments.txt2)>
			AND AQ.txt2 = <cfqueryparam value="#arguments.txt2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt3") and len(arguments.txt3)>
			AND AQ.txt3 = <cfqueryparam value="#arguments.txt3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt4") and len(arguments.txt4)>
			AND AQ.txt4 = <cfqueryparam value="#arguments.txt4#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"txt5") and len(arguments.txt5)>
			AND AQ.txt5 = <cfqueryparam value="#arguments.txt5#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"ExternalID") and len(arguments.ExternalID)>
			AND AQ.ExternalID = <cfqueryparam value="#arguments.ExternalID#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"Created") and len(arguments.Created)>
			AND AQ.Created = <cfqueryparam value="#arguments.Created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Updated") and len(arguments.Updated)>
			AND AQ.Updated = <cfqueryparam value="#arguments.Updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"Deleted") and len(arguments.Deleted)>
			AND AQ.Deleted = <cfqueryparam value="#arguments.Deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"DeletedFlag") and len(arguments.DeletedFlag)>
			AND AQ.DeletedFlag = <cfqueryparam value="#arguments.DeletedFlag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
