<cfcomponent>
	<cffunction name="IndividualAssessmentReport" access="remote" output="true" returntype="string">
		<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="ResultID" type="string" required="true" />
    	<cfargument name="ReportID" type="string" required="true" />
        <cfargument name="Mode" type="string" required="no" default="" />
        
		<!--- GET EVALUATION --->
        <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
        <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
        
        <!--- GET RESULT INFO --->
        <cfquery name="qGetResult" datasource="#Application.Settings.DSN#">
        	SELECT ResultID, PersonID, AssessmentID, ResultStatusID, Score, Created, Updated, Deleted, DeletedFlag
            FROM ce_AssessResult
            WHERE ResultID = <cfqueryparam value="#Arguments.ResultID#" cfsqltype="cf_sql_integer" /> 
        </cfquery>
        
        <!--- GET PERSON NAME --->
        <cfquery name="qGetPerson" datasource="#Application.Settings.DSN#">
        	SELECT FirstName, LastName
            FROM ce_Person
            WHERE PersonID = <cfqueryparam value="#qGetResult.PersonID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <!--- BUILD PERSONNAME VAR FOR FILE NAME OUTPUT --->
        <cfset PersonName = LCase(Left(qGetPerson.FirstName, 1)) & LCase(qGetPerson.LastName)>
        <cfset PersonName = REReplace(PersonName, "[^a-zA-Z0-9]", "", "all")>
        
        <!--- GET ASSESS INFO --->
        <cfquery name="qGetAssess" datasource="#Application.Settings.DSN#">
            SELECT  ass.AssessmentID,
                    ass.Name,
                    ass.PassingScore,
                    sat.Name AS AssessType
            FROM ce_Assessment ass
            INNER JOIN ce_Sys_AssessType sat ON sat.AssessTypeID = ass.AssessTypeID
            WHERE ass.AssessmentID = <cfqueryparam value="#qGetResult.AssessmentID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <!--- CREATE ASSESS TYPE VAR --->
        <cfset AssessType = LCase(Replace(qGetAssess.AssessType, " ", "", "all"))>
        
        <!--- GET LIST OF QUESTIONS --->
        <cfset qQuestions = Application.Com.AssessQuestionGateway.getByAttributes(AssessmentID=qGetAssess.AssessmentID,DeletedFlag="N",OrderBy="Sort")>
        
		<cfset QuestionNo = 1>
        <cfset QuestionCount = 1>
        <cfset aAnswers = ArrayNew(2)>
        
		<!--- Excel Section --->
		<!--- Import POI Library --->
        <cfimport taglib="/_poi/" prefix="poi" />
        
        <!--- Create Report Folder variable --->
        <cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports")>
        
        <!--- Check if the report folder exists yet --->
        <cfif NOT DirectoryExists("#ReportPath#\#Arguments.ReportID#")>
            <cfdirectory action="Create" directory="#ReportPath#\#Arguments.ReportID#">
        </cfif>
        
        <!--- Define variables used in the CreateExcel object --->
        <cfset CurrFileName = "Assess_Report_#PersonName#-#AssessType#_#Arguments.ActivityID#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">
        <cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\" & CurrFileName>
        
        <!--- Start Building Excel file --->
        <poi:document name="Request.ExcelData" file="#ReportExtendedPath#">
            <poi:classes>
                    <poi:class name="Directions" style="font-weight: bold; background-color: GREY_25_PERCENT; text-align: center;" />
                    <poi:class name="Title" style="font-size:16pt; font-weight: bold; background-color: GREY_25_PERCENT; text-align: center;" />
                    <poi:class name="QuestionNumber" style="font-family: arial ; color: ##000 ;  font-size: 10pt; font-weight: bold; text-align: center ; background-color: SKY_BLUE;" />
                    <poi:class name="Question" style="font-family: arial ; color: ##000 ;  font-size: 10pt; font-weight: bold; text-align: left ; background-color: PALE_BLUE;" />
                    <poi:class name="Caption1" style="font-family: arial ; color: ##000 ;  font-size: 16pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE;" />
                    <poi:class name="Caption2" style="font-family: arial ; color: ##000 ;  font-size: 14pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE;" />
                    <poi:class name="Caption3" style="font-family: arial ; color: ##000 ;  font-size: 12pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE;" />
            </poi:classes>
            
            <poi:sheets>
                <poi:sheet name="Individual Assessment Report" orientation="landscape">
                    <poi:columns>
                        <poi:column style="width: 300px;" />
                        <poi:column style="width: 300px;" />
                        <poi:column style="width: 300px;" />
                    </poi:columns>
                    
                    <poi:row class="Title">
                        <poi:cell value="#ActivityBean.getTitle()#"
                                    colspan="3" />
                    </poi:row>
                    
                    <poi:row class="Title">
                        <poi:cell value="Question" />
                        <poi:cell value="Answer" />
                        <poi:cell value="Correct Answer" />
                    </poi:row>
                    
                    <cfloop query="qQuestions">
                        <cfif Len(qQuestions.CorrectField) GT 0 AND qQuestions.CorrectField NEQ "VC0">
                            <cfquery name="qGetCorrectAnswer" datasource="#Application.Settings.DSN#">
                                SELECT #qQuestions.CorrectField# AS CorrectAnswer
                                FROM ce_AssessQuestion
                                WHERE QuestionID = <cfqueryparam value="#qQuestions.QuestionID#" cfsqltype="cf_sql_integer" />
                            </cfquery>
                        </cfif>
                        
                        <cfquery name="qGetAnswer" datasource="#Application.Settings.DSN#">
                            SELECT AnswerID, VC1
                            FROM ce_AssessAnswer
                            WHERE QuestionID = <cfqueryparam value="#qQuestions.QuestionID#" cfsqltype="cf_sql_integer" /> AND ResultID = <cfqueryparam value="#Arguments.ResultID#" cfsqltype="cf_sql_integer" />
                        </cfquery>
                        
                        <cfswitch expression="#qQuestions.QuestionTypeID#">
                            <!--- CAPTION 1 --->
                            <cfcase value="5">
                            <poi:row class="Caption1">
                                <poi:cell value="#qQuestions.LabelText#"
                                    colspan="3" />
                            </poi:row>
                            </cfcase>
                            <!--- CAPTION 2 --->
                            <cfcase value="6">
                            <poi:row class="Caption2">
                                <poi:cell value="#qQuestions.LabelText#"
                                    colspan="3" />
                            </poi:row>
                            </cfcase>
                            <!--- CAPTION 3 --->
                            <cfcase value="7">
                            <poi:row class="Caption3">
                                <poi:cell value="#qQuestions.LabelText#"
                                    colspan="3" />
                            </poi:row>
                            </cfcase>
                            <!--- RATING 1-5, AGREE-DISAGREE --->
                            <cfcase value="9">
                            <poi:row>
                                <poi:cell value="#qQuestions.LabelText#" />
                                <poi:cell value="#qGetAnswer.VC1#" />
                                <poi:cell value="RATING" />
                            </poi:row>
                            </cfcase>
                            <cfdefaultcase>
                            <poi:row>
                                <poi:cell value="#qQuestions.LabelText#" />
                                <poi:cell value="#qGetAnswer.VC1#" />
                                <cfif isDefined("qGetCorrectAnswer.CorrectAnswer")>
                                    <poi:cell value="#qGetCorrectAnswer.CorrectAnswer#" />
                                <cfelse>
                                    <poi:cell value="" />
                                </cfif>
                            </poi:row>
                            </cfdefaultcase>
                        </cfswitch>
                    </cfloop>
                    
                    <cfif AssessType EQ "posttest" OR AssessType EQ "pretest">
                    <poi:row>
                    	<poi:cell value="" colspan="3" />
                    </poi:row>
                    
                    <poi:row class="Title">
                        <poi:cell value="Passing Score: #qGetAssess.PassingScore#%" />
                        <poi:cell value="Result Score: #qGetResult.Score#%" />
                        <cfif qGetResult.Score GTE qGetAssess.PassingScore>
                            <poi:cell value="PASS" />
                        <cfelse>
                            <poi:cell value="FAIL" />
                        </cfif>
                    </poi:row>
                    </cfif>
                        
                </poi:sheet>
            </poi:sheets>
        </poi:document>
        
        <!--- FORCE DOWNLOAD AFTER REPORT GENERATION --->
        <cfif Arguments.Mode EQ "Activity">
        <cfset Status = "Success|" & CurrFileName>
        <cfelse>
        <cfset Status = "Success|Your report has been generated!">
        </cfif>
                            
            
    	<cfreturn Status />
	</cffunction>
    
    <!--- ASSESSMENT REPORT
		NEW ASSESS REPORT IS IN IT'S OWN CFC IN Assess_AnswerDump.cfc
	
    <cffunction name="AssessmentReport" access="remote" output="true" returntype="string">
    	<cfargument name="AssessmentID" type="string" required="true" />
    	<cfargument name="ReportID" type="string" required="true" />
        
        <!--- GATHER EVAL DATA --->
        <cfquery name="qGetAssess" datasource="#Application.Settings.DSN#">
        	SELECT 	a.AssessmentID,
            		a.ActivityID,
            		a.Name, 
            		a.PassingScore,
                    a.MaxAttempts,
                    act.Title AS ActivityTitle
            FROM ce_Assessment a
            INNER JOIN ce_Activity act ON act.ActivityID = a.ActivityID
            WHERE a.AssessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" /> AND a.DeletedFlag = 'N'
        </cfquery>
        
        <cfif qGetAssess.RecordCount GT 0>
			<!--- GATHER QUESTION DATA --->
            <cfquery name="qGetQuestions" datasource="#Application.Settings.DSN#">
                SELECT 	aq.QuestionID,
                        aq.QuestionTypeID,
                        aq.LabelText,
                        aq.CorrectField,
                        aq.I1,
                        aq.I2,
                        aq.I3,
                        aq.I4,
                        aq.I5,
                        aq.I6,
                        aq.I7,
                        aq.I8,
                        aq.I9,
                        aq.I10,
                        aq.VC1,
                        aq.VC2,
                        aq.VC3,
                        aq.VC4,
                        aq.VC5,
                        aq.VC6,
                        aq.VC7,
                        aq.VC8,
                        aq.VC9,
                        aq.VC10,
                        aq.DT1,
                        aq.DT2,
                        aq.DT3,
                        aq.DT4,
                        aq.DT5,
                        aq.TXT1,
                        aq.TXT2,
                        aq.TXT3,
                        aq.TXT4,
                        aq.TXT5,
                        aqt.Name AS QuestionType
                FROM ce_AssessQuestion aq
                INNER JOIN ce_Sys_AssessQuestionType aqt ON aqt.QuestionTypeID = aq.QuestionTypeID
                WHERE aq.AssessmentID = <cfqueryparam value="#qGetAssess.AssessmentID#" cfsqltype="cf_sql_integer" /> AND aq.DeletedFlag = 'N'
                ORDER BY Sort
            </cfquery>
            
            <!--- SET LIST OF QUESTION TYPE EXCLUSIONS --->
            <cfset QuestionTypeExclusions = "Caption 1,Caption 2,Caption 3">
            
            <!--- Excel Section --->            
            <cftry> 
                <!--- Import POI Library --->
                <cfimport taglib="/_poi/" prefix="poi" />
                
                <!--- Create Report Folder variable --->
                <cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports")>
                
                <!--- Check if the report folder exists yet --->
                <cfif NOT DirectoryExists("#ReportPath#\#Arguments.ReportID#")>
                    <cfdirectory action="Create" directory="#ReportPath#\#Arguments.ReportID#">
                </cfif>
                
                <!--- Define variables used in the CreateExcel object --->
                <cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\Assessment_Report_#qGetAssess.ActivityID#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">
                
                <!--- Start Building Excel file --->
                <poi:document name="Request.ExcelData" file="#ReportExtendedPath#">
                    <poi:classes>
                        <poi:class name="Directions" style="font-weight: bold; background-color: GREY_25_PERCENT; text-align: center;" />
                        <poi:class name="Title" style="font-size:16pt; font-weight: bold; background-color: GREY_25_PERCENT; text-align: center;" />
                        <poi:class name="QuestionNumber" style="font-family: arial ; color: ##000 ;  font-size: 10pt; font-weight: bold; text-align: center ; background-color: SKY_BLUE;" />
                        <poi:class name="Question" style="font-family: arial ; color: ##000 ;  font-size: 10pt; font-weight: bold; text-align: left ; background-color: PALE_BLUE;" />
                        <poi:class name="Caption1" style="font-family: arial ; color: ##000 ;  font-size: 16pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE;" />
                        <poi:class name="Caption2" style="font-family: arial ; color: ##000 ;  font-size: 14pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE;" />
                        <poi:class name="Caption3" style="font-family: arial ; color: ##000 ;  font-size: 12pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE;" />
                    </poi:classes>
                    
                    <poi:sheets>
                        <poi:sheet name="Data Tally Report" orientation="landscape">
                            <poi:columns>
                                <poi:column style="width: 300px;" />
                                <poi:column style="width: 300px;" />
                            </poi:columns>
                            
                            <poi:row class="Title">
                                <poi:cell value="#qGetAssess.ActivityTitle#"
                                          colspan="2" />
                            </poi:row>
                            <poi:row class="Title">
                                <poi:cell value="#qGetAssess.Name#"
                                          colspan="2" />
                            </poi:row>
                            
                            <poi:row class="Directions">
                                <poi:cell value="Answer" />
                                <poi:cell value="Tally Count" />
                            </poi:row>
                            
                            <!--- CHECK IF THERE ARE QUESTIONS --->
                            <cfif qGetQuestions.RecordCount GT 0>
                                <!--- CREATE QUESTION COUNTER --->
                                <cfset QuestionCounter = 1>
                                
                                <cfloop query="qGetQuestions">
                                    <!--- CREATE QUESTION ROW ON EXCEL SHEET --->
                                    <cfswitch expression="#qGetQuestions.QuestionType#">
                                        <cfcase value="Caption 1">
                                            <poi:row class="Caption1">
                                                <poi:cell value="#qGetQuestions.LabelText#"
                                                          colspan="2" />
                                            </poi:row>
                                        </cfcase>
                                        <cfcase value="Caption 2">
                                            <poi:row class="Caption2">
                                                <poi:cell value="#qGetQuestions.LabelText#"
                                                          colspan="2" />
                                            </poi:row>
                                        </cfcase>
                                        <cfcase value="Caption 3">
                                            <poi:row class="Caption3">
                                                <poi:cell value="#qGetQuestions.LabelText#"
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
                                                <poi:cell value="#qGetQuestions.LabelText#"
                                                          colspan="2" />
                                            </poi:row>
                                        </cfdefaultcase>
                                    </cfswitch>
                                    
                                    <!--- CHECK IF QUESTIONTYPE IS FOUND IN EXCLUSIONS LIST --->
                                    <cfif NOT ListContains(QuestionTypeExclusions,qGetQuestions.QuestionType,",")>
                                        <!--- GET ANSWERS FOR EACH QUESTION --->
                                        <cfquery name="qGetAnswers" datasource="#Application.Settings.DSN#">
                                            SELECT 	I1,
                                                    VC1,
                                                    DT1,
                                                    TXT1
                                            FROM ce_AssessAnswer
                                            WHERE QuestionID = #qGetQuestions.QuestionID# AND DeletedFlag = 'N'
                                        </cfquery>
                                        
                                        <!--- GET TALLY DATA --->
                                        <cfif qGetAnswers.RecordCount GT 0>
                                            <cfif qGetQuestions.VC1 NEQ "">
                                                <cfquery name="qGetVC1" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC1#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC1#" />
                                                    <poi:cell value="#qGetVC1.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
											
                                            <!--- RATING 1-5 --->
											<cfif qGetQuestions.QuestionType EQ "Rating (1-5,Agree/Disagree)">
                                            	<cfloop from="1" to="5" index="RateCount">
                                                    <cfquery name="qGetVC1" datasource="#Application.Settings.DSN#">
                                                        SELECT Count(AnswerID) AS TallyCount
                                                        FROM ce_AssessAnswer
                                                        WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#RateCount#'
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
                                            
                                            <cfif qGetQuestions.VC2 NEQ "">
                                                <cfquery name="qGetVC2" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC2#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC2#" />
                                                    <poi:cell value="#qGetVC2.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC3 NEQ "">
                                                <cfquery name="qGetVC3" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC3#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC3#" />
                                                    <poi:cell value="#qGetVC3.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC4 NEQ "">
                                                <cfquery name="qGetVC4" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC4#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC4#" />

                                                    <poi:cell value="#qGetVC4.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC5 NEQ "">
                                                <cfquery name="qGetVC5" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC5#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC5#" />
                                                    <poi:cell value="#qGetVC5.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC6 NEQ "">
                                                <cfquery name="qGetVC6" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC6#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC6#" />
                                                    <poi:cell value="#qGetVC6.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC7 NEQ "">
                                                <cfquery name="qGetVC7" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC7#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC7#" />
                                                    <poi:cell value="#qGetVC7.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC8 NEQ "">
                                                <cfquery name="qGetVC8" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC8#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC8#" />
                                                    <poi:cell value="#qGetVC8.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC9 NEQ "">
                                                <cfquery name="qGetVC9" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC9#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC9#" />
                                                    <poi:cell value="#qGetVC9.TallyCount#"
                                                              type="numeric" 
                                                              numberformat="0"
                                                              style="text-align:left;" />
                                                </poi:row>
                                            </cfif>
                                            
                                            <cfif qGetQuestions.VC10 NEQ "">
                                                <cfquery name="qGetVC10" datasource="#Application.Settings.DSN#">
                                                    SELECT Count(AnswerID) AS TallyCount
                                                    FROM ce_AssessAnswer
                                                    WHERE QuestionID = #qGetQuestions.QuestionID# AND VC1 = '#qGetQuestions.VC10#'
                                                </cfquery>
                                                <poi:row>
                                                    <poi:cell value="#qGetQuestions.VC10#" />
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
                        
                        <poi:sheet name="Actual Data Report" orientation="landscape">
                            <poi:columns>
                                <cfloop query="qGetQuestions">
                                <poi:column style="width: 300px;" />
                                </cfloop>
                            </poi:columns>
                            
                            <!--- CHECK IF THERE ARE QUESTIONS --->
                            <cfif qGetQuestions.RecordCount GT 0>
                                <!--- CREATE QUESTION COUNTER --->
                                <cfset QuestionCounter = 1>
                                
                                <poi:row class="QuestionNumber">
                                <cfloop query="qGetQuestions">
                                    <cfif NOT ListContains(QuestionTypeExclusions,qGetQuestions.QuestionType,",")>
										<!--- CREATE QUESTION ON EXCEL SHEET --->
                                        <poi:cell value="###QuestionCounter# #qGetQuestions.LabelText#" />
                                        <cfset QuestionCounter = QuestionCounter + 1>
                                    </cfif>
                                </cfloop>
                                </poi:row>
                                
                                <!--- GET ALL ASSESSMENT RESULTS --->
                                <cfquery name="qGetResults" datasource="#Application.Settings.DSN#">
                                	SELECT 	ResultID, 
                                    		PersonID,
                                            Score
                                   	FROM ce_AssessResult
                                    WHERE assessmentID = <cfqueryparam value="#Arguments.AssessmentID#" cfsqltype="cf_sql_integer" />
                                </cfquery>
                                
                                <cfloop query="qGetResults">
                                    <!--- GET ANSWERS FOR EACH QUESTION --->
                                    <cfquery name="qGetAnswers" datasource="#Application.Settings.DSN#">
                                        SELECT 	aa.QuestionID,
                                        		aa.vc1,
                                        		aq.LabelText
                                        FROM ce_AssessAnswer aa
                                        INNER JOIN ce_AssessQuestion aq ON aq.QuestionID = aa.QuestionID
                                        WHERE aa.ResultID = <cfqueryparam value="#qGetResults.ResultID#" cfsqltype="cf_sql_integer" />
                                        ORDER BY aq.Sort,aq.QuestionID
                                    </cfquery>
                                    
                                    <!--- OUTPUT ANSWERS --->
                                    <poi:row>
                                    <cfloop query="qGetQuestions">
                                    	<cfif NOT ListContains(QuestionTypeExclusions,qGetQuestions.QuestionType,",")>
                                            <cfquery name="qGetAnswer" dbtype="query">
                                                SELECT VC1
                                                FROM qGetAnswers
                                                WHERE QuestionID = <cfqueryparam value="#qGetQuestions.QuestionID#" cfsqltype="cf_sql_integer" />
                                            </cfquery>
                                            
                                            <cfif qGetAnswer.RecordCount GT 0>
                                            <poi:cell value="#qGetAnswer.VC1#" />
                                            <cfelse>
                                            <poi:cell value="" />
                                            </cfif>
                                        </cfif>
                                    </cfloop>
                                    </poi:row>
                                </cfloop>
                            </cfif>
                            
                        </poi:sheet>
                    </poi:sheets>
                </poi:document>
                       
                <cfset Status = "Success|Your report has been generated!">
                <cfcatch type="any">
                    <cfset Status = "Fail|Error: " & cfcatch.Message>
                </cfcatch>
            </cftry>
        <cfelse>
        	<cfset Status="Fail|Cannot do this.">
        </cfif>
        
        <cfreturn Status />
    </cffunction> --->
</cfcomponent>