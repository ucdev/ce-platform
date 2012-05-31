<cfcomponent displayname="ACCME Preparation" output="no">
	<cfimport taglib="/_poi/" prefix="poi" />
	
	<!--- CONFIGURATION --->
	<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports/23/")>
	<cfset ReportFileName = "cpdEvals-#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#-#Session.AccountID#.xls">
	<cfset ColumnCount = 3>
	<cfset Title = "Old CPD Evals">
	<cfset BookName = "Old CPD Evals">
	
	<cfif NOT DirectoryExists("#ReportPath#")><cfdirectory action="Create" directory="#ReportPath#"></cfif>
	
	<!--- RUN METHOD --->
	<cffunction name="Run" access="remote" output="yes">
		<cfargument name="CourseID" type="string" required="yes" />
		
		<cfset var QuestionLabels = "">
		<cfset var qQuestions = "">
		<cfset var EvalType = "">
		<cfset var NewEvalLabels = "">
		<cfset var OldEvalLabels = "">
		
		<cfquery name="qCourseInfo" datasource="#application.settings.dsn#">
			SELECT Title FROM ec_Course WHERE CourseID=<cfqueryparam value="#Arguments.CourseID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfquery name="qQuestions" datasource="#Application.Settings.DSN#">
			SELECT     
				QuestionText
			FROM dbo.ec_TestQuestion
			WHERE
				TestID=464
			ORDER BY SequenceNumber
		</cfquery>
		
		<cfloop query="qQuestions">
			<cfset NewEvalQuestionCount = 6>
			<cfset NewEvalLabels = ListAppend(NewEvalLabels,qQuestions.QuestionText,'|')>
		</cfloop>
		
		<cfquery name="qQuestions" datasource="#Application.Settings.DSN#">
		SELECT     
				QuestionText
			FROM dbo.ec_TestQuestion
			WHERE
				TestID=118
			ORDER BY SequenceNumber
		</cfquery>
		
		<cfloop query="qQuestions">
			<cfset OldEvalQuestionCount = 5>
			<cfset OldEvalLabels = ListAppend(OldEvalLabels,qQuestions.QuestionText,'|')>
		</cfloop>
		
		<cfset qRecords = queryNew("Question1,Question2,Question3,Question4,Question5,Question6")>
		
		<cfquery name="qTraining" datasource="#Application.Settings.DSN#">
			SELECT     PersonId, CourseId, CreditTypeId, TrainingStatusId, EffectiveDate, TestScore
			FROM         dbo.ec_Person_Training
			WHERE     (CourseID = <cfqueryparam value="#Arguments.CourseID#" cfsqltype="cf_sql_integer" />) AND TrainingStatusID=1
		</cfquery>
		
		<cfif qTraining.RecordCount GT 0>
			<cfloop query="qTraining">
				<cfquery name="qTestResults" datasource="#Application.Settings.DSN#">
					SELECT     TOP 1 PersonTestResultId, PersonId, TestId, TestDate, TestStatusId
					FROM         dbo.ec_Person_TestResult
					WHERE     (TestId IN (464,118)) AND TestStatusID=5 AND PersonID=#qTraining.PersonID# AND TestDate BETWEEN #CreateODBCDateTime(DateAdd('n',-10,qTraining.EffectiveDate))# AND #CreateODBCDateTime(DateAdd('n',10,qTraining.EffectiveDate))#
				</cfquery>
				
				<cfif qTestResults.RecordCount GT 0>
					<cfloop query="qTestResults">
						<cfif qTestResults.TestId EQ 118>
							<cfset EvalType = "Old">
						<cfelse>
							<cfset EvalType = "New">
						</cfif>
						<cfquery name="qTestAnswers" datasource="#Application.Settings.DSN#">
							SELECT    PersonTestAnswerId, PersonTestResultId, TestQuestionId, VC1, CreationDate, LastUpdate
							FROM         dbo.ec_Person_TestAnswer
							WHERE PersonTestResultID=#qTestResults.PersonTestResultId#
						</cfquery>
						
						<cfset queryAddRow(qRecords)>
						<cfloop query="qTestAnswers">
							<cfset querySetCell(qRecords,"Question#qTestAnswers.CurrentRow#",qTestAnswers.VC1)>
						</cfloop>
					</cfloop>
				</cfif>
			</cfloop>
		</cfif>
			
			<cfif qRecords.RecordCount GT 0>
			<poi:document name="Request.ExcelData" file="#ReportPath##ReportFileName#">
				<poi:classes>
					<poi:class name="title" style="font-family: arial; vertical-align:middle; color: ##000; height:45px; font-size:12pt; font-weight:bold;  background-color: PALE_BLUE; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
					<poi:class name="headers" style="font-family: arial ; color: ##000; background-color:GREY_25_PERCENT;  font-size: 10pt; font-weight: bold; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
					<poi:class name="data" style="font-family: arial ; color: ##000 ;  font-size: 10pt; border-bottom:2px GREY_50_PERCENT;" />
				</poi:classes>
				
				<poi:sheets>
					<poi:sheet name="#BookName#" orientation="landscape">
						<poi:columns>
							<poi:column style="width:145px;" />
							<poi:column style="width:145px;" />
							<poi:column style="width:145px;" />
							<poi:column style="width:145px;" />
							<poi:column style="width:145px;" />
							<poi:column style="width:145px;" />
						</poi:columns>
						
						<poi:row class="title">
							<poi:cell value="#qCourseInfo.Title#" colspan="6" />
						</poi:row>
						
						<poi:row class="headers">
							<cfloop list="#Evaluate('#EvalType#EvalLabels')#" index="i" delimiters="|">
							<poi:cell value="#i#" />
							</cfloop>
						</poi:row>

						<cfloop query="qRecords">
						<poi:row class="data">
							<poi:cell value="#qRecords.Question1#" />
							<poi:cell value="#qRecords.Question2#" />
							<poi:cell value="#qRecords.Question3#" />
							<poi:cell value="#qRecords.Question4#" />
							<poi:cell value="#qRecords.Question5#" />
							<poi:cell value="#qRecords.Question6#" />
						</poi:row>
						</cfloop>
					</poi:sheet>
				</poi:sheets>
			</poi:document>
		
		<cfheader name="Content-Type" value="application/msexcel">
		<cfheader name="Content-Disposition" value="attachment; filename=#ReportFileName#">
		<cfcontent type="application/msexcel" file="#ReportPath##ReportFileName#" deletefile="No">
		</cfif>
	</cffunction>
</cfcomponent>

