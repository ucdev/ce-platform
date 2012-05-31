<cfcomponent displayname="Answer Dump" output="no">
	<cfparam name="url.AssessmentID" type="numeric" />
	
	<cffunction name="getQuestions" access="public" returntype="query">
		<cfset var qQuestions = "">
		
		<cfquery name="qQuestions" datasource="#Application.Settings.DSN#">
			SELECT     
				Q.QuestionID, 
				Q.LabelText, 
				QT.Name AS QuestionType,
                Q.VC1,
                Q.VC2,
                Q.VC3,
                Q.VC4,
                Q.VC5,
                Q.VC6,
                Q.VC7,
                Q.VC8,
                Q.VC9,
                Q.VC10
			FROM         ce_AssessQuestion AS Q INNER JOIN
					  ce_Sys_AssessQuestionType AS QT ON Q.QuestionTypeID = QT.QuestionTypeID
			WHERE     (Q.AssessmentID = <cfqueryparam value="#url.AssessmentID#" cfsqltype="cf_sql_integer" />) AND (Q.QuestionTypeID NOT IN (5, 6, 7)) AND Q.DeletedFlag='N'
			ORDER BY Q.Sort
		</cfquery>
		
		<cfreturn qQuestions />
	</cffunction>
	
	<cffunction name="getAssessInfo" access="public" returntype="query">
		<cfset var qAssessInfo = "">
		<cfquery name="qAssessInfo" datasource="#Application.Settings.DSN#">
			SELECT     
            	ActivityTitle = Act.Title, 
                AssessmentName = Ass.Name, 
                AssessType = AsT.Name
			FROM
            	ce_Assessment AS Ass 
            INNER JOIN
			  	ce_Activity AS Act ON Ass.ActivityID = Act.ActivityID 
            INNER JOIN
			  	ce_Sys_AssessType AS AsT ON Ass.AssessTypeID = AsT.AssessTypeID
			 WHERE 
             	AssessmentID=<cfqueryparam value="#url.AssessmentID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		
		<cfreturn qAssessInfo />
	</cffunction>
	
	<cffunction name="Run" access="remote" output="yes">
		<cfset var Questions = getQuestions()>
		<cfset var AssessInfo = getAssessInfo()>
		
		

		
		<cfquery name="Results" datasource="#Application.Settings.DSN#">
			SELECT
            	R.ResultID, 
                P.firstname, 
                P.lastname, 
                RS.Name
			FROM
            	ce_AssessResult AS R 
            INNER JOIN
				ce_Sys_AssessResultStatus AS RS ON R.ResultStatusID = RS.ResultStatusID 
            INNER JOIN
				dbo.ce_Person AS P ON R.PersonID = P.personid
			WHERE
            	(R.AssessmentID = <cfqueryparam value="#url.AssessmentID#" cfsqltype="cf_sql_integer" />) AND 
                (R.DeletedFlag='N')
		</cfquery>
        
		<cfquery name="Answers" datasource="#Application.Settings.DSN#">
			SELECT     AnswerID, ResultID, AssessmentID, QuestionID, I1, I2, VC1, VC2, DT1, DT2, TXT1, TXT2, CorrectFlag, Created, Updated, Deleted, DeletedFlag
			FROM         ce_AssessAnswer
			WHERE     (AssessmentID = <cfqueryparam value="#url.AssessmentID#" cfsqltype="cf_sql_integer" />) AND DeletedFlag='N'
		</cfquery>
		
		 <!--- Import POI Library --->
		<cfimport taglib="/_poi/" prefix="poi" />
		
		<!--- Create Report Folder variable --->
		<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports/18/")>
		
		<!--- Check if the report folder exists yet --->

		<cfif NOT DirectoryExists("#ReportPath#")>
			<cfdirectory action="Create" directory="#ReportPath#">
		</cfif>
		
		<cfset ReportFileName = "result-#Application.UDF.StripAllBut(LCase(AssessInfo.AssessType),'abcdefghijklmnopqrstuvwxyz',false)#-#url.AssessmentID#-#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">
		
		<cfset ColumnCount = Questions.RecordCount+2> <!--- Add how many extra columns for like Name and Status --->

		<!--- Start Building Excel file --->
		<poi:document name="Request.ExcelData" file="#ReportPath##ReportFileName#">
			<poi:classes>
				<poi:class name="title" style="font-family: arial; color: ##000; font-size:12pt; font-weight:bold;  background-color: PALE_BLUE; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="headers" style="font-family: arial ; color: ##000; background-color:GREY_25_PERCENT;  font-size: 10pt; font-weight: bold; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="data" style="font-family: arial ; color: ##000 ;  font-size: 10pt; border-bottom:2px GREY_50_PERCENT;" />
			</poi:classes>
			
			<poi:sheets>
				<poi:sheet name="Assess Answers" orientation="landscape">
					<poi:columns>
						<cfloop from="1" to="#ColumnCount#" index="i">
						<poi:column style="width:150px;" />
						</cfloop>
					</poi:columns>
					
					<poi:row class="title">
						<poi:cell value="#AssessInfo.ActivityTitle# #AssessInfo.AssessType# Results - #DateFormat(now(),'mm/dd/yyyy')# #TimeFormat(now(),'hh:mm TT')#" colspan="#ColumnCount#" />
					</poi:row>
					
					<poi:row class="headers">
						<poi:cell value="Person Name" />
						<poi:cell value="Result Status" />
						<cfloop query="Questions">
						<poi:cell value="#Questions.LabelText#" />
						</cfloop>
					</poi:row>
					
					<cfloop query="Results">
						<cfquery name="Answers" datasource="#Application.Settings.DSN#">
						SELECT QuestionID,VC1 FROM ce_AssessAnswer WHERE (ResultID = <cfqueryparam value="#Results.ResultID#" cfsqltype="cf_sql_integer" />) AND DeletedFlag='N'
						</cfquery>
					<poi:row class="data">
						<poi:cell value="#Results.LastName#, #Results.FirstName#" />
						<poi:cell value="#Results.Name#" />
						<cfloop query="Questions">
							<cfquery name="Answer" dbtype="query">
							SELECT VC1 FROM Answers WHERE QuestionID=#Questions.QuestionID#
							</cfquery>
							<cfif isNumeric(Answer.VC1)>
							<poi:cell value="#Answer.VC1#" type="numeric" numberformat="0" />
                            <cfelse>
							<poi:cell value="#Answer.VC1#" />
							</cfif>
						</cfloop>
					</poi:row>
					</cfloop>
				</poi:sheet>
                
                <!--- GET QUERY DATA --->
                <cfset qAssessInfo = getAssessInfo()>
                <cfset qQuestions = getQuestions()>
                
				<!--- SET LIST OF QUESTION TYPE EXCLUSIONS --->
                <cfset QuestionTypeExclusions = "Caption 1,Caption 2,Caption 3">
                
                <poi:sheet name="Data Tally Report" orientation="landscape">
                    <poi:columns>
                        <poi:column style="width: 300px;" />
                        <poi:column style="width: 300px;" />
                    </poi:columns>
                    
                    <poi:row class="Title">
                        <poi:cell value="#qAssessInfo.ActivityTitle#"
                                  colspan="2" />
                    </poi:row>
                    <poi:row class="Title">
                        <poi:cell value="#qAssessInfo.AssessmentName#"
                                  colspan="2" />
                    </poi:row>
                    
                    <poi:row class="Directions">
                        <poi:cell value="Answer" />
                        <poi:cell value="Tally Count" />
                    </poi:row>
                    
                    <!--- CHECK IF THERE ARE QUESTIONS --->
                    <cfif qQuestions.RecordCount GT 0>
                        <!--- CREATE QUESTION COUNTER --->
                        <cfset QuestionCounter = 1>
                        
                        <cfloop query="qQuestions">
                            <!--- CREATE QUESTION ROW ON EXCEL SHEET --->
                            <cfswitch expression="#qQuestions.QuestionType#">
                                <cfcase value="Caption 1">
                                    <poi:row class="Caption1">
                                        <poi:cell value="#qQuestions.LabelText#"
                                                  colspan="2" />
                                    </poi:row>
                                </cfcase>
                                <cfcase value="Caption 2">
                                    <poi:row class="Caption2">
                                        <poi:cell value="#qQuestions.LabelText#"
                                                  colspan="2" />
                                    </poi:row>
                                </cfcase>
                                <cfcase value="Caption 3">
                                    <poi:row class="Caption3">
                                        <poi:cell value="#qQuestions.LabelText#"
                                                  colspan="2" />
                                    </poi:row>
                                </cfcase>
                                <cfcase value="Text (Single Line)">
                                </cfcase>
                                <cfcase value="Text (Multi Line)">
                                </cfcase>
                                <cfdefaultcase>
                                    <!--- CREATE QUESTION NUMBER ROW ON EXCEL SHEET --->
                                    <poi:row class="QuestionNumber">
                                        <poi:cell value="Question ###QuestionCounter#"
                                                  colspan="2"
                                                  style="text-align:left;" />
                                    </poi:row>
                                    <!--- OUTPUT QUESTION ON EXCEL SHEET --->
                                    <poi:row class="Question">
                                        <poi:cell value="#qQuestions.LabelText#"
                                                  colspan="2" />
                                    </poi:row>
                                </cfdefaultcase>
                            </cfswitch>
                            
                            <!--- CHECK IF QUESTIONTYPE IS FOUND IN EXCLUSIONS LIST --->
                            <cfif NOT ListContains(QuestionTypeExclusions,qQuestions.QuestionType,",")>
                                <!--- GET ANSWERS FOR EACH QUESTION --->
                                <cfquery name="qGetAnswers" datasource="#Application.Settings.DSN#">
                                    SELECT 	I1,
                                            VC1,
                                            DT1,
                                            TXT1
                                    FROM ce_AssessAnswer
                                    WHERE QuestionID = #qQuestions.QuestionID# AND DeletedFlag = 'N'
                                </cfquery>
                                
                                <!--- GET TALLY DATA --->
                                <cfif qGetAnswers.RecordCount GT 0>
                                    <cfif qQuestions.VC1 NEQ "">
                                        <cfquery name="qGetVC1" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC1#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC1#" />
                                            <poi:cell value="#qGetVC1.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <!--- RATING 1-5 --->
                                    <cfif qQuestions.QuestionType EQ "Rating (1-5,Agree/Disagree)">
                                        <cfloop from="1" to="5" index="RateCount">
                                            <cfquery name="qGetVC1" datasource="#Application.Settings.DSN#">
                                                SELECT Count(AnswerID) AS TallyCount
                                                FROM ce_AssessAnswer
                                                WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#RateCount#'
                                            </cfquery>
                                            <poi:row>
                                                <poi:cell value="#RateCount#"
                                                          type="numeric" 
                                                          numberformat="0"
                                                          style="text-align:left;" />
                                                <poi:cell value="#qGetVC1.TallyCount#"
                                                          type="numeric" 
                                                          numberformat="0"
                                                          style="text-align:left;" />
                                            </poi:row>
                                        </cfloop>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC2 NEQ "">
                                        <cfquery name="qGetVC2" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC2#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC2#" />
                                            <poi:cell value="#qGetVC2.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC3 NEQ "">
                                        <cfquery name="qGetVC3" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC3#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC3#" />
                                            <poi:cell value="#qGetVC3.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC4 NEQ "">
                                        <cfquery name="qGetVC4" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC4#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC4#" />

                                            <poi:cell value="#qGetVC4.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC5 NEQ "">
                                        <cfquery name="qGetVC5" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC5#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC5#" />
                                            <poi:cell value="#qGetVC5.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC6 NEQ "">
                                        <cfquery name="qGetVC6" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC6#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC6#" />
                                            <poi:cell value="#qGetVC6.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC7 NEQ "">
                                        <cfquery name="qGetVC7" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC7#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC7#" />
                                            <poi:cell value="#qGetVC7.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC8 NEQ "">
                                        <cfquery name="qGetVC8" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC8#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC8#" />
                                            <poi:cell value="#qGetVC8.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC9 NEQ "">
                                        <cfquery name="qGetVC9" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC9#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC9#" />
                                            <poi:cell value="#qGetVC9.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                    
                                    <cfif qQuestions.VC10 NEQ "">
                                        <cfquery name="qGetVC10" datasource="#Application.Settings.DSN#">
                                            SELECT Count(AnswerID) AS TallyCount
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qQuestions.QuestionID# AND VC1 = '#qQuestions.VC10#'
                                        </cfquery>
                                        <poi:row>
                                            <poi:cell value="#qQuestions.VC10#" />
                                            <poi:cell value="#qGetVC10.TallyCount#"
                                                      type="numeric" 
                                                      numberformat="0"
                                                      style="text-align:left;" />
                                        </poi:row>
                                    </cfif>
                                </cfif>
                            </cfif>
                            
                            <cfset QuestionCounter = QuestionCounter + 1>
                        </cfloop>
                    </cfif>
                </poi:sheet>
			</poi:sheets>
		</poi:document>
		
		<cfheader name="Content-Type" value="application/msexcel">
		<cfheader name="Content-Disposition" value="attachment; filename=#ReportFileName#">
		<cfcontent type="application/msexcel" file="#ReportPath##ReportFileName#" deletefile="No">
	</cffunction>
</cfcomponent>