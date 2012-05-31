<cfcomponent>
	<!--- CDC ACTIVITY REPORT --->
	<cffunction name="CDCActivityReport" access="remote" output="true" returntype="any">
    	<cfargument name="StartDate" required="true" type="string" />
    	<cfargument name="EndDate" required="true" type="string" />
    	<cfargument name="MarkSent" required="true" type="string" />
    	<cfargument name="ReportID" required="true" type="string" />
        
        <cfset var Status = "">
        
		<cfif Arguments.StartDate EQ "">
            <cfset Status = "Fail|Start Date is required.">
        </cfif>
        
        <cfif Arguments.EndDate EQ "">
            <cfif Status EQ "">
                <cfset Status = "Fail|End Date is required.">
            <cfelse>
                <cfset Status = "Fail|Start Date and End Date is required.">
            </cfif>
        </cfif>
        
        <cfif Status EQ "">
        	<!--- CHANGED THE TOTAL STUDENTS WHERE CLAUSE TO CHECK BETWEEN START AND END DATE --->
			<cfquery name="qGetCDCCourses" datasource="#Application.Settings.DSN#">
				DECLARE @EndDate datetime
				DECLARE @StartDate datetime
				SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate,'mm/dd/yyyy')# 00:00:00" cfsqltype="cf_sql_varchar" />
				SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate,'mm/dd/yyyy')# 23:59:59" cfsqltype="cf_sql_varchar" />
                SELECT     
					act.ActivityID, 
					act.Title, 
					act.StartDate, 
					act.ExternalID,
					ato.DidacticHrs, 
					ato.ExperimentalHrs,
					/* Total Students */
				  	(SELECT COUNT(ACDC.AttendeeID) AS AttCount
					 FROM ce_AttendeeCDC AS ACDC 
                     INNER JOIN ce_Attendee AS A ON ACDC.AttendeeID = A.AttendeeID
					 WHERE 	(ACDC.SentFlag = 'N') AND 
                     		(A.ActivityID = act.ActivityID) AND 
                     		(A.DeletedFlag = 'N') AND
                            (A.CompleteDate <= @EndDate)) AS TotalStudents, 
					act.City,
					act.State,
                    ato.SecClinSiteFlag, 
                    ato.CollabPTCFlag, 
                    ato.CollabPTCSpecify, 
                    ato.CollabAgencyFlag,
                    ato.CollabAgencySpecify
				FROM ce_Activity AS act 
				LEFT OUTER JOIN ce_Activity_Other AS ato ON ato.ActivityID = act.ActivityID 
				INNER JOIN ce_Activity_Site AS ASi ON ASi.ActivityID = act.ActivityID 
				
				/* CRITERIA */
				WHERE 
					(ASi.SiteID = 4) AND 
                    (act.StatusID = 3) AND
					(SELECT COUNT(ACDC.AttendeeID) AS AttCount
					 FROM ce_AttendeeCDC AS ACDC 
                     INNER JOIN ce_Attendee AS A ON ACDC.AttendeeID = A.AttendeeID
					 WHERE 	(ACDC.SentFlag = 'N') AND 
                     		(A.ActivityID = act.ActivityID) AND 
                     		(A.DeletedFlag = 'N') AND
                     		(A.CompleteDate <= @EndDate)) > 0
				ORDER BY act.StartDate
			</cfquery>
						
			<!--- Define NewQuery Variable and RowCount Variable --->
           	<cfset qReport = QueryNew("CrsTitle,CrsDate,CourseID,OtherCourse,DidHrs,PracHrs,Students,City,State,ClinSit2,CollPTC,Cspecify,CollOth,CoSpecify")>
            <cfset RowCount = 0>
            <cfset TotalDidHrs = 0>
            <cfset TotalPracHrs = 0>
            <cfset OverallStudents = 0>
            
            <!--- Fill NewQuery Variable --->
            <cfloop from="1" to="#qGetCDCCourses.RecordCount#" index="Index1">
                <!--- SET CDCCOURSEID --->
                <cfset CDCCourseID = "CI" & Replace(qGetCDCCourses.ExternalID[Index1], "CDC-", "") & "001A">
                
                <!--- SET CDCCOURSEDATE --->
                <cfif DateCompare(qGetCDCCourses.StartDate[Index1],Arguments.StartDate) EQ -1>
                	<cfset CDCCourseDate = DateFormat(Arguments.EndDate, "MM/DD/YYYY")>
                <cfelse>
                	<cfset CDCCourseDate = DateFormat(qGetCDCCourses.StartDate[Index1], "MM/DD/YYYY")>
                </cfif>
                
                <cfscript>
                    queryAddRow(qReport,1);
                    RowCount = IncrementValue(RowCount);
					
					querySetCell(qReport,"CrsTitle",qGetCDCCourses.Title[Index1],RowCount);
                    querySetCell(qReport,"CrsDate",CDCCourseDate,RowCount);
                    querySetCell(qReport,"CourseID",CDCCourseID,RowCount);
                    querySetCell(qReport,"OtherCourse","",RowCount);
                    querySetCell(qReport,"DidHrs",qGetCDCCourses.DidacticHrs[Index1],RowCount);
                    querySetCell(qReport,"PracHrs",qGetCDCCourses.ExperimentalHrs[Index1],RowCount);
                    querySetCell(qReport,"Students",qGetCDCCourses.TotalStudents[Index1],RowCount);
                    querySetCell(qReport,"City",qGetCDCCourses.City[Index1],RowCount);
                    querySetCell(qReport,"State",qGetCDCCourses.State[Index1],RowCount);
                    querySetCell(qReport,"ClinSit2",qGetCDCCourses.SecClinSiteFlag[Index1],RowCount);
                    querySetCell(qReport,"CollPTC",qGetCDCCourses.CollabPTCFlag[Index1],RowCount);
                    querySetCell(qReport,"Cspecify",qGetCDCCourses.CollabPTCSpecify[Index1],RowCount);
                    querySetCell(qReport,"CollOth",qGetCDCCourses.CollabAgencyFlag[Index1],RowCount);
                    querySetCell(qReport,"CoSpecify",qGetCDCCourses.CollabAgencySpecify[Index1],RowCount);
                </cfscript>
                
                <cfif Len(qGetCDCCourses.DidacticHrs[Index1]) GT 0>
					<cfset TotalDidHrs = TotalDidHrs + qGetCDCCourses.DidacticHrs[Index1]>
                </cfif>
                <cfif Len(qGetCDCCourses.ExperimentalHrs[Index1]) GT 0>
                	<cfset TotalPracHrs = TotalPracHrs + qGetCDCCourses.ExperimentalHrs[Index1]>
                </cfif>
                <cfif Len(qGetCDCCourses.TotalStudents[Index1]) GT 0>
                	<cfset OverallStudents = OverallStudents + qGetCDCCourses.TotalStudents[Index1]>
                </cfif>
            </cfloop>
            
            <cfquery name="qReport" dbtype="query">
            	SELECT *
                FROM qReport
                ORDER BY CrsDate
            </cfquery>
            
            <!--- FORMAT COURSEDATE --->
            <cfloop query="qReport">
            	<cfset qReport.Crsdate = DateFormat(qReport.Crsdate, "M/DD/YYYY")>
            </cfloop>
            
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
                <cfif Arguments.MarkSent EQ "Y">
					<cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\CDC_Activity_Report_#DateFormat(Arguments.StartDate,'MDDYY')#-#DateFormat(Arguments.EndDate,'MDDYY')#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#_MarkedSent.xls">
                <cfelse>
                    <cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\CDC_Activity_Report_#DateFormat(Arguments.StartDate,'MDDYY')#-#DateFormat(Arguments.EndDate,'MDDYY')#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">
                </cfif>
                
                <!--- Start Building Excel file --->
                <poi:document name="Request.ExcelData" file="#ReportExtendedPath#">
                    <poi:classes>
                        <poi:class name="title" style="font-family: arial ; color: ##000 ;  font-size: 10pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
                        <poi:class name="BottomRow" style="border-top:3px BLACK; border-bottom:3px BLACK;" />
                    </poi:classes>
                    
                    <poi:sheets>
                        <poi:sheet name="CDC Activity Report" orientation="landscape">
                            <poi:columns>
                                <poi:column style="width:67px; text-align:center;" />
                                <poi:column style="width:33px; text-align:center;" />
                                <poi:column style="width:425px;" />
                                <poi:column style="width:71px;" />
                                <poi:column style="width:83px;" />
                                <poi:column style="width:91px; text-align:center;" />
                                <poi:column style="width:54px;" />
                                <poi:column style="width:65px;" id="PracHrs" />
                                <poi:column style="width:172px;" />
                                <poi:column style="width:90px;" />
                                <poi:column style="width:45px; text-align:center;" />
                                <poi:column style="width:60px; text-align:center;" />
                                <poi:column style="width:66px; text-align:center;" />
                                <poi:column style="width:69px; text-align:center;" />
                                <poi:column style="width:59px; text-align:center;" />
                                <poi:column style="width:229px;" />
                            </poi:columns>
                            
                            <poi:row style="font-weight: bold;">
                            	<poi:cell value="" />
                            	<poi:cell value="" />
                            	<poi:cell value="" />
                            	<poi:cell value="National Network of STD/HIV Prevention Training Centers" 
                                		  colspan="7" 
                                          style="background: YELLOW; text-align:center;" />
                            </poi:row>
                            
                            <poi:row style="font-weight: bold;">
                            	<poi:cell value="" />
                            	<poi:cell value="" />
                            	<poi:cell value="" />
                            	<poi:cell value="Quarterly Event Activity Report" colspan="7" style="background: YELLOW; text-align:center;" />
                            </poi:row>
                            
                            <poi:row style="font-weight: bold;">
                            	<poi:cell value="" />
                            </poi:row>
                            
                            <poi:row style="font-weight: bold;">
                            	<poi:cell value="PTC/Part:" 
                                		  colspan="2" 
                                          style="background: YELLOW;" />
                            	<poi:cell value="Cincinnati" 
                                          style="background: LIGHT_GREEN;" />
                            	<poi:cell value="" 
                                          style="background: LIGHT_GREEN;" />
                            	<poi:cell value="" 
                                          style="background: LIGHT_GREEN;" />
                            	<poi:cell value="" />
                            	<poi:cell value="" />
                            	<poi:cell value="" />
                            	<poi:cell value="Quarter/Year:" 
                                		  style="background: YELLOW; text-align:right;" />
                            	<poi:cell value="#DateFormat(Arguments.StartDate, 'MMM')#-#DateFormat(Arguments.EndDate, 'MMM')# #Year(Arguments.StartDate)#" 
                                		  colspan="5" 
                                          style="background: LIGHT_GREEN;" />
                            </poi:row>
                            
                            <poi:row>
                            	<poi:cell value=" " />
                            	<poi:cell value="" />
                            	<poi:cell value=" " />
                            	<poi:cell value="" />
                            	<poi:cell value=" " />
                            	<poi:cell value="" />
                            	<poi:cell value=" " />
                            	<poi:cell value="" />
                            </poi:row>
                            
                            <poi:row class="title">
                                <poi:cell value="PTC" />
                                <poi:cell value="Part" />
                                <poi:cell value="CrsTitle" />
                                <poi:cell value="Crsdate" />
                                <poi:cell value="CourseID" />
                                <poi:cell value="OtherCourse" />
                                <poi:cell value="DidHrs" />
                                <poi:cell value="PracHrs" />
                                <poi:cell value="Students" />
                                <poi:cell value="City" />
                                <poi:cell value="State" />
                                <poi:cell value="ClinSit2" />
                                <poi:cell value="CollPTC" />
                                <poi:cell value="Cspecify" />
                                <poi:cell value="CollOth" />
                                <poi:cell value="CoSpecify" style="border-right: 3px BLACK;" />
                            </poi:row>
                            
                            <cfloop query="qReport">
                                <poi:row style="border:2px solid BLACK;">
                                    <poi:cell value="CI" 
                                    		  style="text-align:center;" />
                                    <poi:cell value="1" 
                                    		  type="numeric" 
                                              numberformat="0" 
                                              style="text-align:center;" />
                                    <poi:cell value="#qReport.CrsTitle#" />
                                    <poi:cell value="#qReport.CrsDate#" />
                                    <poi:cell value="#qReport.CourseID#" />
                                    <poi:cell value="#qReport.OtherCourse#" 
                                    		  style="text-align:center;" />
                                    <poi:cell value="#qReport.DidHrs#" 
                                    		  type="numeric" 
                                              numberformat="0.00"
                                    		  style="text-align:right;" />
                                    <poi:cell value="#qReport.PracHrs#" 
                                    		  type="numeric" 
                                              numberformat="0.00"
                                    		  style="text-align:right;" />
                                    <poi:cell value="#qReport.Students#" 
                                    		  type="numeric" 
                                              numberformat="0"
                                    		  style="text-align:right;" />
                                    <poi:cell value="#qReport.City#" />
                                    <poi:cell value="#qReport.State#" 
                                    		  style="text-align:center;" />
                                    <poi:cell value="#qReport.ClinSit2#" 
                                    		  style="text-align:center;" />
                                    <poi:cell value="#qReport.CollPTC#" 

                                    		  style="text-align:center;" />
                                    <poi:cell value="#qReport.Cspecify#" 
                                    		  style="text-align:center;" />
                                    <poi:cell value="#qReport.CollOth#" 
                                    		  style="text-align:center;" />
                                    <poi:cell value="#qReport.CoSpecify#" 
                                    		  style="border-right: 3px BLACK;" />
                                </poi:row>
                            </cfloop>
                            
                            <poi:row class="BottomRow">
                            	<poi:cell value="Totals" style="text-align:center; border-right:2px BLACK;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE; border-right:2px BLACK;" />
                            	<poi:cell value="#TotalDidHrs#" 
                                    	  type="numeric" 
                                          numberformat="0"
                                		  style="border-right:2px BLACK;"/>
                            	<poi:cell value="#TotalPracHrs#"
                                    	  type="numeric" 
                                          numberformat="0"
                                		  style="border-right:2px BLACK;" />
                            	<poi:cell value="#OverallStudents#" 
                                    	  type="numeric" 
                                          numberformat="0"
                                		  style="border-right:2px BLACK;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE;" />
                            	<poi:cell value="" style="background: PALE_BLUE; border-right:3px BLACK;" />
                            </poi:row>
                        </poi:sheet>
                    </poi:sheets>
                </poi:document>
                                    
                <cfset Status = "Success|Your report has been generated!">
                <cfcatch type="any">
                    <cfset Status = "Fail|Error: " & cfcatch.Message>
                </cfcatch>
            </cftry>
        </cfif>
        <cfreturn Status />
    </cffunction>
    
    <!--- CDC PIF REPORT --->
    <cffunction name="CDCPIFReport" access="remote" output="true" returntype="string">
    	<cfargument name="ActivityID" type="string" required="true" />
    	<cfargument name="ReportID" type="string" required="true" />
        
		<cfset qAttendees = Application.Com.AttendeeGateway.getByPIFAttributes(ActivityID=Arguments.ActivityID,OrderBy="p.LastName,p.FirstName DESC")>

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
            <cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\CDC_PIF_Report_#Arguments.ActivityID#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">

            <!--- Start Building Excel file --->
            <poi:document name="Request.ExcelData" file="#ReportExtendedPath#">
                <poi:classes>
                    <poi:class name="title" style="font-family: arial ; color: ##000 ;  font-size: 10pt; font-weight: bold; text-align: center ; background-color: PALE_BLUE; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
                </poi:classes>
                
                <poi:sheets>
                    <poi:sheet name="CDC PIF Report" orientation="landscape">
                        <poi:columns>
                            <poi:column />
                            <poi:column style="width: 75px;" id="PersonID" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" id="Profession" />
                            <poi:column style="width: 125px;" />
                            <poi:column style="width: 150px;" />
                            <poi:column style="width: 115px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" id="Pro. Focus (HIV/AIDS)" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" id="Pop. Focus (Other)" />
                            <poi:column style="width: 150px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                            <poi:column style="width: 75px;" />
                        </poi:columns>
                        
                        <poi:row class="title">
                            <poi:cell value="PersonID" />
                            <poi:cell value="First Name" />
                            <poi:cell value="Middle Name" />
                            <poi:cell value="Last Name" />
                            <poi:cell value="Registration Date" />
                            <poi:cell value="Degree(s)" />
                            <poi:cell value="Title/Position" />
                            <poi:cell value="Gender" />
                            <poi:cell value="Racial Background" />
                            <poi:cell value="Occupational Classification" />
                            <poi:cell value="Profession" />
                            <poi:cell value="Primary Functional Role" />
                            <poi:cell value="Occupational Organization" />
                            <poi:cell value="Occupation Location" />
                            <poi:cell value="Employment Setting" />
                            <poi:cell value="Programmatic Focus (STDs)" />
                            <poi:cell value="Pro. Focus (Women's Reproductive Health)" />
                            <poi:cell value="Pro. Focus (Adolescent/Student Health)" />
                            <poi:cell value="Pro. Focus (Substance use/Addiction)" />
                            <poi:cell value="Pro. Focus (Corrections)" />
                            <poi:cell value="Pro. Focus (HIV/AIDS)" />
                            <poi:cell value="Pro. Focus (General Medicine or Family Practice)" />
                            <poi:cell value="Pro. Focus (Mental Health)" />
                            <poi:cell value="Pro. Focus (Emergency Medicine)" />
                            <poi:cell value="Pro. Focus (Other)" />
                            <poi:cell value="Population Focus (General)" />
                            <poi:cell value="Pop. Focus (Gay/Lesbian/Bisexual/MSM)" />
                            <poi:cell value="Pop. Focus (Homeless)" />
                            <poi:cell value="Pop. Focus (Pregnant Women)" />
                            <poi:cell value="Pop. Focus (African Americans)" />
                            <poi:cell value="Pop. Focus (Native Hawaiian/Pacific Islanders)" />
                            <poi:cell value="Pop. Focus (Hispanic/Latinos)" />
                            <poi:cell value="Pop. Focus (Substance users)" />
                            <poi:cell value="Pop. Focus (HIV+ Individuals)" />
                            <poi:cell value="Pop. Focus (Adolescents)" />
                            <poi:cell value="Pop. Focus (Transgender)" />
                            <poi:cell value="Pop. Focus (Incarcerated Individuals/Parolees)" />
                            <poi:cell value="Pop. Focus (Sex Workers)" />
                            <poi:cell value="Pop. Focus (Asians)" />
                            <poi:cell value="Pop. Focus (American Indian/Native Alaskans)" />
                            <poi:cell value="Pop. Focus (Recent Immigrants/Refugees)" />
                            <poi:cell value="Pop. Focus (IDU)" />
                            <poi:cell value="Pop. Focus (Other)" />
                            <poi:cell value="Course Recommendation" />
                            <poi:cell value="Contact Consent (Updates)" />
                            <poi:cell value="Contact Consent (Evaluations)" />
                            <poi:cell value="CDC Prevention Alert Add" />
                            <poi:cell value="Currently Enrolled in Licensure" />
                            <poi:cell value="PTC training contribute hours" />
                            <poi:cell value="Primary motivation to supplement training" />
                        </poi:row>
                        
                        <cfloop query="qAttendees">
                            <poi:row>
                                <poi:cell value="#qAttendees.PersonID#"
                                          type="numeric" 
                                          numberformat="0" />
                                <poi:cell value="#qAttendees.FirstName#" />
                                <poi:cell value="#qAttendees.MiddleName#" />
                                <poi:cell value="#qAttendees.LastName#" />
                                <poi:cell value="#DateFormat(qAttendees.CheckIn, 'MM/DD/YYYY')# @ #TimeFormat(qAttendees.CheckIn, 'hh:mmTT')#" />
                                <poi:cell value="#qAttendees.DisplayDegree#" />
                                <poi:cell value="N/A" />
                                <poi:cell value="#qAttendees.Gender#" />
                                <poi:cell value="#qAttendees.Ethnicity#" />
                                <poi:cell value="#qAttendees.OccupationalClass#" />
                                <poi:cell value="#qAttendees.ProfCName#" />
                                <poi:cell value="#qAttendees.FunRNName#" />
                                <poi:cell value="#qAttendees.OrgName#" />
                                <poi:cell value="#qAttendees.WorkState#, #qAttendees.WorkZip#" />
                                <poi:cell value="" />
                                <poi:cell value="#qAttendees.FocSTD#" />
                                <poi:cell value="#qAttendees.FocWRH#" />
                                <poi:cell value="#qAttendees.FocAdol#" />
                                <poi:cell value="#qAttendees.FocSub#" />
                                <poi:cell value="#qAttendees.FocCor#" />
                                <poi:cell value="#qAttendees.FocHIV#" />
                                <poi:cell value="#qAttendees.FocGen#" />
                                <poi:cell value="#qAttendees.FocMH#" />
                                <poi:cell value="#qAttendees.FocEm#" />
                                <poi:cell value="#qAttendees.FocOth#" />
                                <poi:cell value="#qAttendees.PopGen#" />
                                <poi:cell value="#qAttendees.PopGLB#" />
                                <poi:cell value="#qAttendees.PopHome#" />
                                <poi:cell value="#qAttendees.PopPreg#" />
                                <poi:cell value="#qAttendees.PopAA#" />
                                <poi:cell value="#qAttendees.PopNH#" />
                                <poi:cell value="#qAttendees.PopHisp#" />
                                <poi:cell value="#qAttendees.PopSub#" />
                                <poi:cell value="#qAttendees.PopHIV#" />
                                <poi:cell value="#qAttendees.PopAdol#" />
                                <poi:cell value="#qAttendees.PopTran#" />
                                <poi:cell value="#qAttendees.PopCorr#" />
                                <poi:cell value="#qAttendees.PopSW#" />
                                <poi:cell value="#qAttendees.PopAs#" />
                                <poi:cell value="#qAttendees.PopAIAN#" />
                                <poi:cell value="#qAttendees.PopImm#" />
                                <poi:cell value="#qAttendees.PopIDU#" />
                                <poi:cell value="#qAttendees.PopOth#" />
                                <poi:cell value="#qAttendees.MarketName#" />
                                <poi:cell value="#qAttendees.Updates#" />
                                <poi:cell value="#qAttendees.Eval#" />
                                <poi:cell value="#qAttendees.TrainingAlert#" />
                                <poi:cell value="#qAttendees.CurrentlyEnrolled#"
                                          type="numeric" 
                                          numberformat="0" />
                                <poi:cell value="#qAttendees.RelevantTraining#"
                                          type="numeric" 
                                          numberformat="0" />
                                <poi:cell value="#qAttendees.MotivationTraining#"
                                          type="numeric" 
                                          numberformat="0" />
                            </poi:row>
                        </cfloop>
                        
                    </poi:sheet>
                </poi:sheets>
            </poi:document>
                                
            <cfset Status = "Success|Your report has been generated!">
            <cfcatch type="any">
                <cfset Status = "Fail|Error: " & cfcatch.Message>
            </cfcatch>
        </cftry>
        
        <cfreturn Status />
    </cffunction>
    
    <!--- CDC STUDENT REPORT --->
	<cffunction name="CDCStudentReport" access="remote" output="true" returntype="any">
    	<cfargument name="StartDate" required="true" type="string" />
    	<cfargument name="EndDate" required="true" type="string" />
    	<cfargument name="ReportID" required="true" type="string" />
    	<cfargument name="MarkSent" required="true" type="string" />
        
        <cfset var Status = "">
        
		<cfif Arguments.StartDate EQ "">
            <cfset Status = "Fail|Start Date is required.">
        </cfif>
        
        <cfif Arguments.EndDate EQ "">
            <cfif Status EQ "">
                <cfset Status = "Fail|End Date is required.">
            <cfelse>
                <cfset Status = "Fail|Start Date and End Date is required.">
            </cfif>
        </cfif>
        
        <cfif Status EQ "">
        	<cfquery name="qGetAttendees" datasource="#Application.Settings.DSN#">
            	DECLARE @StartDate datetime
				DECLARE @EndDate datetime
				SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate,'mm/dd/yyyy')# 00:00:00" cfsqltype="cf_sql_varchar" />
				SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate,'mm/dd/yyyy')# 23:59:59" cfsqltype="cf_sql_varchar" />
                
                SELECT
                    act.activityid,
                    REPLACE(act.ExternalID,'CDC-','') AS ExternalID,
                    act.StartDate,
                    p.PersonID,
                    p.SSN,
                    p.FirstName,
                    p.LastName,
                    p.Birthdate,
                    p.Gender,
                    p.EthnicityID,
                    att.AttendeeID,
                    acdc.ProfCID,
                    acdc.ProfCSp,
                    acdc.FunRCID,
                    acdc.FunRCSp,
                    acdc.ProfNID,
                    acdc.ProfNSp,
                    acdc.FunRNID,
                    acdc.FunRNSp,
                    acdc.OccClassID,
                    acdc.OrgTypeID,
                    acdc.WorkState,
                    acdc.WorkZip,
                    acdc.OrgTypeID,
                    acdc.TSpecify,
                    acdc.CBOFundID,
                    acdc.CBOCDC,
                    acdc.CBOOth,
                    acdc.CBAFundID,
                    acdc.CBACDC,
                    acdc.CBAOth,
                    acdc.FocSTD,
                    acdc.FocHIV,
                    acdc.FocWRH,
                    acdc.FocGen,
                    acdc.FocAdol,
                    acdc.FocMH,
                    acdc.FocSub,
                    acdc.FocEm,
                    acdc.FocCor,
                    acdc.FocOth,
                    acdc.FocSpec,
                    acdc.PopGen,
                    acdc.PopAdol,
                    acdc.PopGLB,
                    acdc.PopTran,
                    acdc.PopHome,
                    acdc.PopCorr,
                    acdc.PopPreg,
                    acdc.PopSW,
                    acdc.PopAA,
                    acdc.PopAs,
                    acdc.PopNH,
                    acdc.PopAIAN,
                    acdc.PopHisp,
                    acdc.PopImm,
                    acdc.PopIDU,
                    acdc.PopSub,
                    acdc.PopHIV,
                    acdc.PopOth,
                    acdc.PopSpec,
                    acdc.MarketID,
                    acdc.MSpecify,
                    acdc.SentFlag
                FROM	ce_Activity act
                INNER JOIN ce_Attendee att ON att.ActivityID = act.ActivityID
                INNER JOIN ce_AttendeeCDC acdc ON acdc.AttendeeID = att.AttendeeID
                INNER JOIN ce_Person p ON p.PersonID = att.PersonID
                WHERE 	
                    (acdc.SentFlag = 'N') AND 
                    (act.StartDate < @EndDate) AND 
                    (att.CheckIn <= @EndDate) AND 
                    (act.StatusID = 3) AND 
                    (act.DeletedFlag='N') AND 
                    (att.DeletedFlag='N')
                ORDER BY act.StartDate
            </cfquery>
            
            <!--- MARK ATTENDEES AS SENT --->
            <cfif Arguments.MarkSent EQ "Y" AND qGetAttendees.RecordCount NEQ 0>
            	<cfset PersonList = "">
                
            	<cfloop query="qGetAttendees">
            		<cfset PersonList = ListAppend(PersonList, qGetAttendees.AttendeeID,",")>
                </cfloop>
                
                <cfquery name="qUpdateSentFlag" datasource="#Application.Settings.DSN#">
                	UPDATE ce_AttendeeCDC
                  	SET SentFlag = 'Y',
                    	SentDate = <cfqueryparam value="#DateFormat(Now(), "MM/DD/YYYY")# #TimeFormat(Now(), "hh:mm:ssTT")#" cfsqltype="cf_sql_date" />
                    WHERE AttendeeID IN (#PersonList#)
                </cfquery>
            </cfif>
            
			<!--- Create a new part query. --->
			<cfset qReport = QueryNew("CourseID,Part,Crsdate,StuID,ID,LName,FName,MName,Degree,Title,OrgName,Phone,Phone2,Fax,Email,OrgAdd1,OrgAdd2,OrgCity,OrgState,OrgZip,OrgCountry,Sex,Amind,Asian,Black,White,Pacific,Hispanic,OccClas,ProfC,ProfCSp,FunRC,FunRCSp,ProfN,ProfNSp,FunRN,FunRNSp,WorkSt,WorkZip,OrgType,Tspecify,CBOFund,CBOCDC,CBOOth,CBAFund,CBACDC,CBAOth,FocSTD,FocHIV,FocWRH,FocGen,FocAdol,FocMH,FocSub,FocEm,FocCor,FocOth,FocSpec,PopGen,PopAdol,PopGLB,PopTran,PopHome,PopCorr,PopPreg,PopSW,PopAA,PopAs,PopNH,PopAIAN,PopHisp,PopImm,PopIDU,PopSub,PopHIV,PopOth,PopSpec,Market,Mspecify","cf_sql_varchar, cf_sql_varchar, cf_sql_date, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, 
									  																																																																																																																																																   cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar") />
			<!--- Create some record. --->
			<cfloop query="qGetAttendees">
            	<!--- FORMAT STARTDATE ---->
                <cfset ActivityStartDate = DateFormat(qGetAttendees.StartDate, "MM/DD/YYYY")>
                <!--- SET CDCCOURSEDATE --->
                <cfif DateCompare(qGetAttendees.StartDate,Arguments.StartDate) EQ -1>
                	<cfset CDCCourseDate = DateFormat(Arguments.EndDate, "MM/DD/YYYY")>
                <cfelse>
                	<cfset CDCCourseDate = DateFormat(qGetAttendees.StartDate, "MM/DD/YYYY")>
                </cfif>
                
				<cfscript>                                
				/* CLEAR VARS */
				Amind = "";
				Asian = "";
				Black = "";
				White = "";
				Pacific = "";
				Hispanic = "";
				CDCCourseID = "";
				CDCStuID = "";
				CompleteCDCID = 0;
				
				/* DEFINE VAR CONTENT */
				CDCCourseID = "CI" & qGetAttendees.ExternalID & "001A";
				IF (Len(DateFormat(qGetAttendees.Birthdate,"MMDD")) NEQ 4) {
					CDCStuID = qGetAttendees.CBAOth;
				} ELSE {
					CDCStuID = UCase(Left(qGetAttendees.FirstName,2)) & UCase(Left(qGetAttendees.LastName,2)) & DateFormat(qGetAttendees.Birthdate,"MMDD");
				}
				CompleteCDCID = CDCCourseID & ActivityStartDate & CDCStuID;
				
				switch(qGetAttendees.EthnicityID) {
					case 1:
						Amind = "Y";
						Asian = "N";
						Black = "N";
						White = "N";
						Pacific = "N";
						Hispanic = "N";
					case 4:
						Amind = "N";
						Asian = "Y";
						Black = "N";
						White = "N";
						Pacific = "N";
						Hispanic = "N";
					case 2:
						Amind = "N";
						Asian = "N";
						Black = "Y";
						White = "N";
						Pacific = "N";
						Hispanic = "N";
					case 3:
						Amind = "N";
						Asian = "N";
						Black = "N";
						White = "Y";
						Pacific = "N";
						Hispanic = "N";
					case 10:
						Amind = "N";
						Asian = "N";
						Black = "N";
						White = "N";
						Pacific = "Y";
						Hispanic = "N";
					case 5:
						Amind = "N";
						Asian = "N";
						Black = "N";
						White = "N";
						Pacific = "N";
						Hispanic = "Y";
				}
				</cfscript>
                
				<!--- Add a row to the query. --->
                <cfset QueryAddRow( qReport ) />
                 
                <!--- Populate row with random data. --->
                <cfset qReport["CourseID"][ qReport.RecordCount ] = JavaCast("string", CDCCourseID) />
                <cfset qReport["Part"][ qReport.RecordCount ] = JavaCast("string", "1") />
                <cfset qReport["Crsdate"][qReport.RecordCount] = JavaCast("string", CDCCourseDate) />
                <cfset qReport["StuID"][qReport.RecordCount] = JavaCast("string", CDCStuID) />
                <cfset qReport["ID"][qReport.RecordCount] = JavaCast("string", CompleteCDCID) />
                <cfset qReport["Sex"][qReport.RecordCount] = JavaCast("string", qGetAttendees.Gender) />
                <cfset qReport["Amind"][qReport.RecordCount] = JavaCast("string", Amind) />
                <cfset qReport["Asian"][qReport.RecordCount] = JavaCast("string", Asian) />
                <cfset qReport["Black"][qReport.RecordCount] = JavaCast("string", Black) />
                <cfset qReport["White"][qReport.RecordCount] = JavaCast("string", White) />
                <cfset qReport["Pacific"][qReport.RecordCount] = JavaCast("string", Pacific) />
                <cfset qReport["Hispanic"][qReport.RecordCount] = JavaCast("string", Hispanic) />
                <cfset qReport["OccClas"][qReport.RecordCount] = JavaCast("string", qGetAttendees.OccClassID) />
                <cfset qReport["ProfC"][qReport.RecordCount] = JavaCast("string", qGetAttendees.ProfCID) />
                <cfset qReport["ProfCSp"][qReport.RecordCount] = JavaCast("string", qGetAttendees.ProfCSp) />
                <cfset qReport["FunRC"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FunRCID) />
                <cfset qReport["FunRCSp"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FunRCSp) />
                <cfset qReport["ProfN"][qReport.RecordCount] = JavaCast("string", qGetAttendees.ProfNID) />
                <cfset qReport["ProfNSp"][qReport.RecordCount] = JavaCast("string", qGetAttendees.ProfNSp) />
                <cfset qReport["FunRN"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FunRNID) />
                <cfset qReport["FunRNSp"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FunRNSp) />
                <cfset qReport["WorkSt"][qReport.RecordCount] = JavaCast("string", qGetAttendees.WorkState) />
                <cfset qReport["WorkZip"][qReport.RecordCount] = JavaCast("string", qGetAttendees.WorkZip) />
                <cfset qReport["OrgType"][qReport.RecordCount] = JavaCast("string", qGetAttendees.OrgTypeID) />
                <cfset qReport["Tspecify"][qReport.RecordCount] = JavaCast("string", qGetAttendees.TSpecify) />
                <cfset qReport["CBOFund"][qReport.RecordCount] = JavaCast("string", qGetAttendees.CBOFundID) />
                <cfset qReport["CBOCDC"][qReport.RecordCount] = JavaCast("string", qGetAttendees.CBOCDC) />
                <cfset qReport["CBOOth"][qReport.RecordCount] = JavaCast("string", qGetAttendees.CBOOth) />
                <cfset qReport["CBAFund"][qReport.RecordCount] = JavaCast("string", qGetAttendees.CBAFundID) />
                <cfset qReport["CBACDC"][qReport.RecordCount] = JavaCast("string", qGetAttendees.CBACDC) />
                <cfset qReport["CBAOth"][qReport.RecordCount] = JavaCast("string", "") />
                <cfset qReport["FocSTD"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocSTD) />
                <cfset qReport["FocHIV"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocHIV) />
                <cfset qReport["FocWRH"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocWRH) />
                <cfset qReport["FocGen"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocGen) />
                <cfset qReport["FocAdol"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocAdol) />
                <cfset qReport["FocMH"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocMH) />
                <cfset qReport["FocSub"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocSub) />
                <cfset qReport["FocEm"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocEm) />
                <cfset qReport["FocCor"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocCor) />
                <cfset qReport["FocOth"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocOth) />
                <cfset qReport["FocSpec"][qReport.RecordCount] = JavaCast("string", qGetAttendees.FocSpec) />
                <cfset qReport["PopGen"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopGen) />
                <cfset qReport["PopAdol"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopAdol) />
                <cfset qReport["PopGLB"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopGLB) />
                <cfset qReport["PopTran"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopTran) />
                <cfset qReport["PopHome"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopHome) />
                <cfset qReport["PopCorr"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopCorr) />
                <cfset qReport["PopPreg"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopPreg) />
                <cfset qReport["PopSW"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopSW) />
                <cfset qReport["PopAA"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopAA) />
                <cfset qReport["PopAs"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopAs) />
                <cfset qReport["PopNH"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopNH) />
                <cfset qReport["PopAIAN"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopAIAN) />
                <cfset qReport["PopHisp"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopHisp) />
                <cfset qReport["PopImm"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopImm) />
                <cfset qReport["PopIDU"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopIDU) />
                <cfset qReport["PopSub"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopSub) />
                <cfset qReport["PopHIV"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopHIV) />
                <cfset qReport["PopOth"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopOth) />
                <cfset qReport["PopSpec"][qReport.RecordCount] = JavaCast("string", qGetAttendees.PopSpec) />
                <cfset qReport["Market"][qReport.RecordCount] = JavaCast("string", qGetAttendees.MarketID) />
                <cfset qReport["Mspecify"][qReport.RecordCount] = JavaCast("string", qGetAttendees.MSpecify) />
			</cfloop>
             
             <!--- SORT qReport BY COURSEDATE --->
             <cfquery name="qReport" dbtype="query">
             	SELECT *
                FROM qReport
                ORDER BY Crsdate
             </cfquery>
             
			<!--- Get the CSV value. --->
			<cfset strOutput = Application.UDF.QueryToCSV(qReport,"CourseID,Part,Crsdate,StuID,ID,LName,FName,MName,Degree,Title,OrgName,Phone,Phone2,Fax,Email,OrgAdd1,OrgAdd2,OrgCity,OrgState,OrgZip,OrgCountry,Sex,Amind,Asian,Black,White,Pacific,Hispanic,OccClas,ProfC,ProfCSp,FunRC,FunRCSp,ProfN,ProfNSp,FunRN,FunRNSp,WorkSt,WorkZip,Orgtype,Tspecify,CBOFund,CBOCDC,CBOOth,CBAFund,CBACDC,CBAOth,FocSTD,FocHIV,FocWRH,FocGen,FocAdol,FocMH,FocSub,FocEm,FocCor,FocOth,FocSpec,PopGen,PopAdol,PopGLB,PopTran,PopHome,PopCorr,PopPreg,PopSW,PopAA,PopAs,PopNH,PopAIAN,PopHisp,PopImm,PopIDU,PopSub,PopHIV,PopOth,PopSpec,Market,Mspecify") />
            
			<!--- Create Report Folder variable --->
			<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports")>
            
            <!--- Check if the report folder exists yet --->

            <cfif NOT DirectoryExists("#ReportPath#\#Arguments.ReportID#")>
                <cfdirectory action="Create" directory="#ReportPath#\#Arguments.ReportID#">
            </cfif>
            
            <!--- Define variables used in the CreateExcel object --->
            <cfif Arguments.MarkSent EQ "Y">
            	<cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\CDC_Student_Report_#DateFormat(Arguments.StartDate,'MDDYY')#-#DateFormat(Arguments.EndDate,'MDDYY')#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#_MarkedSent.csv">
            <cfelse>
            	<cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\CDC_Student_Report_#DateFormat(Arguments.StartDate,'MDDYY')#-#DateFormat(Arguments.EndDate,'MDDYY')#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.csv">
            </cfif>
                
            <cffile action="write" file="#ReportExtendedPath#" output="#strOutput#">
                                    
            <cfset Status = "Success|Your report has been generated!">
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="CDCOverviewReport" hint="A detailed report on activities and attendees based on date range and location" access="remote" output="true" returntype="string">
    	<cfargument name="StartDate" default="" required="true" />
    	<cfargument name="EndDate" default="" required="true" />
    	<cfargument name="SectionList" default="" required="true" />
    	<cfargument name="ReportID" default="16" required="true" />
        
        <cfset var Status = "">
        
        <cfif Arguments.StartDate EQ "" AND Arguments.EndDate EQ "">
        	<cfset Status = "Fail|You must enter a Start and End date">
        <cfelseif Arguments.StartDate EQ "" AND Arguments.EndDate NEQ "">
        	<cfset Status = "Fail|You must enter a Start date">
        <cfelseif Arguments.StartDate NEQ "" AND Arguments.EndDate EQ "">
        	<cfset Status = "Fail|You must enter an End date">
        </cfif>
        
        <cfif Status EQ "">
        	<!--- GET CDC COURSES --->
            <cfset qCDCActivities = Application.Com.ActivityGateway.getByCDCAttributes(Sponsor='Cincinnati STD/HIV Prevention Training Center',ReleaseDate=DateFormat(Arguments.StartDate,"MM/DD/YYYY")& "00:00:00",EndDate=DateFormat(Arguments.EndDate,"MM/DD/YYYY") & "23:59:59",OrderBy="a.Title DESC")>
            
			<!--- GET SECOND QUERY TO PREVENT NAMING ISSUES --->
            <cfset qLoopCDCActivities = Application.Com.ActivityGateway.getByCDCAttributes(Sponsor='Cincinnati STD/HIV Prevention Training Center',StartDate=DateFormat(Arguments.StartDate,"MM/DD/YYYY")& "00:00:00",EndDate=DateFormat(Arguments.EndDate,"MM/DD/YYYY") & "23:59:59",OrderBy="a.Title DESC")>
            
            <cfif ListFind(Arguments.SectionList, "Course", ",")>
				<!--- CREATE VARIABLES FOR COUNTING ACTIVITIES --->
				<cfset RowCounter = 1>
				<cfset ActivityExcludeList = "">
            	<cfset TotalActivityCount = 0>
				<cfset aActivityCount = ArrayNew(2)>
				
				<!--- LOOP THROUGH LIST OF ACTIVITIES --->
				<cfloop query="qCDCActivities">
					<!--- CHECK IF ACTIVITY IS FOUND IN EXCLUDE LIST --->
					<cfif NOT ListFind(ActivityExcludeList,qCDCActivities.Title,",")>
						<!--- CREATE ARRAY RECORD --->
						<cfset aActivityCount[RowCounter][1] = qCDCActivities.Title>
						<cfset aActivityCount[RowCounter][2] = 0>
						
						<!--- GET COUNT OF COURSES --->
						<cfloop query="qLoopCDCActivities">
							<!--- CHECK IF CURRENT ACITIVITY TITLE MATCHES CURRENT LOOP ACTIVITY TITLE --->
							<cfif aActivityCount[RowCounter][1] EQ qLoopCDCActivities.Title>
								<cfset aActivityCount[RowCounter][2] = aActivityCount[RowCounter][2] + 1>
                                <cfset TotalActivityCount = TotalActivityCount + 1>
							</cfif>
						</cfloop>
						
						<!--- PLACE ACTIVITY IN EXCLUDE LIST --->
						<cfset ActivityExcludeList = ListAppend(ActivityExcludeList, qCDCActivities.Title,",")>
						<cfset RowCounter = RowCounter + 1>
					</cfif>
				</cfloop>
            
				<!--- LOOP THROUGH LIST OF ACTIVITIES --->
                <cfloop query="qCDCActivities">
                    <!--- CHECK IF ACTIVITY IS FOUND IN EXCLUDE LIST --->
                    <cfif NOT ListFind(ActivityExcludeList,qCDCActivities.Title,",")>
                        <!--- CREATE ARRAY RECORD --->
                        <cfset aActivityCount[RowCounter][1] = qCDCActivities.Title>
                        <cfset aActivityCount[RowCounter][2] = 0>
                        
                        <!--- GET COUNT OF COURSES --->
                        <cfloop query="qLoopCDCActivities">
                            <!--- CHECK IF CURRENT ACITIVITY TITLE MATCHES CURRENT LOOP ACTIVITY TITLE --->
                            <cfif aActivityCount[RowCounter][1] EQ qLoopCDCActivities.Title>
                                <cfset aActivityCount[RowCounter][2] = aActivityCount[RowCounter][2] + 1>
                            </cfif>
                        </cfloop>
                        
                        <!--- PLACE ACTIVITY IN EXCLUDE LIST --->
                        <cfset ActivityExcludeList = ListAppend(ActivityExcludeList, qCDCActivities.Title,",")>
                        <cfset RowCounter = RowCounter + 1>
                    </cfif>
                </cfloop>
            </cfif>
            
            <cfif ListFind(Arguments.SectionList, "Participants", ",")>
				<!--- GET DEGREE COUNT --->
                <cfquery name="qGetDegreeCount" datasource="#Application.Settings.DSN#">
                    DECLARE @StartDate datetime;
                    DECLARE @EndDate datetime;
                    DECLARE @Container int;
                    
                    SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @Container = (SELECT CategoryID
                                      FROM ce_Category
                                      WHERE Name = 'STD/HIV');
                    
                    WITH attendees(PersonID,EduName)
                        AS (
                            SELECT	ATT.PersonID, 
                            		EDU.Name
                        	FROM ce_Sys_Degree EDU
                            INNER JOIN ce_Person_Degree PE ON EDU.DegreeID = PE.DegreeID 
                            RIGHT OUTER JOIN ce_Attendee AS Att 
                            INNER JOIN ce_Activity AS A ON Att.ActivityID = A.ActivityID ON PE.PersonID = Att.PersonID
                        	WHERE 	(A.StartDate BETWEEN @StartDate AND @EndDate) AND 
                            		(A.StatusID IN (1, 2, 3)) AND 
                                    (A.DeletedFlag = 'N') AND 
                                    (Att.DeletedFlag = 'N') AND
                                    ((SELECT COUNT(Activity_CategoryID) AS Expr1
                                      FROM ce_Activity_Category AS AC
                                      WHERE (ActivityID = A.ActivityID) AND 
                                      (CategoryID = 31)) > 0)
							),
                            
						distinctEdu (EduName)
                        AS (
                            SELECT 	DISTINCT EduName
                            FROM attendees 
                            ), 
                            
                        degreeWithCount (Sort,EduName,PersonCount)
                        AS (
                            SELECT 2 As Sort,d.EduName,(SELECT Count(PersonID) FROM attendees a WHERE d.EduName=a.EduName) As PersonCount FROM distinctEdu d
                            WHERE d.EduName IS NOT NULL
                            UNION
                            SELECT 1 As Sort,'No Degree' As EduName,Count(PersonID) FROM attendees WHERE EduName IS NULL
                        )
                        
                        SELECT * FROM degreeWithCount
                        ORDER BY Sort
                </cfquery>
                
                <!--- GET TOTAL ATTENDEE COUNT --->
                <cfquery name="qTotalAttendees" dbtype="query">
                   SELECT SUM(PersonCount) AS AttendeeCount
                   FROM qGetDegreeCount
                </cfquery>
            </cfif>
            
            <cfif ListFind(Arguments.SectionList, "ParticipantsCourse", ",")>
				<!--- GET ACTIVITY ATTENDEE COUNT --->
                <cfquery name="qGetActivityAttendeeInfo" datasource="#Application.Settings.DSN#">
                    DECLARE @StartDate datetime;
                    DECLARE @EndDate datetime;
                    DECLARE @Container int;
                    
                    SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @Container = (SELECT CategoryID
                                      FROM ce_Category
                                      WHERE Name = 'STD/HIV');
                                          
                    SELECT 	act.ActivityID,
                            act.ParentActivityID,
                            act.Title AS ActivityTitle,
                            act.StartDate AS ActivityDate,
                            act.EndDate,
                            act.StatusID,
                            act.DeletedFlag,
                            (SELECT COUNT(att.AttendeeID)
                             FROM ce_Attendee att
                             WHERE 	att.ActivityID = act.ActivityID AND att.DeletedFlag = 'N') AS AttendeeCount
                    FROM ce_Activity act
                    INNER JOIN ce_Activity_Category ac ON ac.ActivityID = act.ActivityID
                    WHERE	
                        (act.StartDate BETWEEN @StartDate AND @EndDate) AND 
                        (ac.CategoryID = @Container) AND 
                        (act.StatusID IN (1,2,3)) AND 
                        (act.Sponsorship = 'J') AND
                        (act.Sponsor = 'Cincinnati STD/HIV Prevention Training Center') AND
                        (act.SessionType = 'M') AND
                        (act.ParentActivityID IS NOT NULL) AND
                        (act.DeletedFlag = 'N') AND
                        (SELECT COUNT(att.AttendeeID)
                             FROM ce_Attendee att
                             WHERE 	att.ActivityID = act.ActivityID AND att.DeletedFlag = 'N') > 0
                     OR
                     	(act.StartDate BETWEEN @StartDate AND @EndDate) AND 
                        (ac.CategoryID = @Container) AND 
                        (act.StatusID IN (1,2,3)) AND 
                        (act.Sponsorship = 'D') AND
                        (act.SessionType = 'M') AND
                        (act.ParentActivityID IS NOT NULL) AND
                        (act.DeletedFlag = 'N') AND
                        (SELECT COUNT(att.AttendeeID)
                             FROM ce_Attendee att
                             WHERE 	att.ActivityID = act.ActivityID AND att.DeletedFlag = 'N') > 0
                    ORDER BY act.Title, act.StartDate
                </cfquery>
                
                <cfset aActivityAttendees = ArrayNew(2)>
                <cfset CurrActivityTitle = "">
                <cfset RowCounter = 1>
                
                <!--- LOOP THROUGH ACTIVITY ATTENDEE LIST --->
                <cfloop query="qGetActivityAttendeeInfo">
                    <cfif qGetActivityAttendeeInfo.ActivityTitle NEQ CurrActivityTitle>
                        <!--- UPDATE CURRACTIVITYTITLE --->
                        <cfset CurrActivityTitle = qGetActivityAttendeeInfo.ActivityTitle>
                        
                        <!--- GET TOTAL ATTENDEE COUNT FOR COURSE --->
                        <cfquery name="qTotalAttendeeCount" dbtype="query">
                            SELECT SUM(AttendeeCount) AS AttendeeCount
                            FROM qGetActivityAttendeeInfo
                            WHERE ActivityTitle = '#CurrActivityTitle#'
                        </cfquery>
                        
                        <!--- FILL ARRAY --->
                        <cfset aActivityAttendees[RowCounter][1] = CurrActivityTitle>
                        <cfset aActivityAttendees[RowCounter][2] = qTotalAttendeeCount.AttendeeCount>
                        
                        <!--- DETERMINE DATE --->
                        <cfif DateFormat(qGetActivityAttendeeInfo.ActivityDate,"MM/DD/YYYY") EQ DateFormat(qGetActivityAttendeeInfo.EndDate,"MM/DD/YYYY")>
                            <cfset aActivityAttendees[RowCounter+1][1] = " - " & DateFormat(qGetActivityAttendeeInfo.ActivityDate,"MMM D, YYYY")>
                        <cfelse>
                            <cfset aActivityAttendees[RowCounter+1][1] = " - " & DateFormat(qGetActivityAttendeeInfo.ActivityDate,"MMM D, YYYY") & "-" & DateFormat(qGetActivityAttendeeInfo.EndDate,"MMM D, YYYY")>
                        </cfif>
                        <cfset aActivityAttendees[RowCounter+1][2] = qGetActivityAttendeeInfo.AttendeeCount>
                        
                        <cfset RowCounter = RowCounter + 2>
                    <cfelse>
                        <!--- FILL ARRAY --->
                        <!--- DETERMINE DATE --->
                        <cfif DateFormat(qGetActivityAttendeeInfo.ActivityDate,"MM/DD/YYYY") EQ DateFormat(qGetActivityAttendeeInfo.EndDate,"MM/DD/YYYY")>
                            <cfset aActivityAttendees[RowCounter][1] = " - " & DateFormat(qGetActivityAttendeeInfo.ActivityDate,"MMM D, YYYY")>
                        <cfelse>
                            <cfset aActivityAttendees[RowCounter][1] = " - " & DateFormat(qGetActivityAttendeeInfo.ActivityDate,"MMM D, YYYY") & "-" & DateFormat(qGetActivityAttendeeInfo.EndDate,"MMM D, YYYY")>
                        </cfif>
                        <cfset aActivityAttendees[RowCounter][2] = qGetActivityAttendeeInfo.AttendeeCount>
                        
                        <cfset RowCounter = RowCounter + 1>
                    </cfif>
                </cfloop>
            </cfif>
            
            <cfif ListFind(Arguments.SectionList, "ParticipantsState", ",")>
				<!--- GET ATTENDEE COUNT BY STATE --->
                <cfquery name="qGetStateAttendeeInfo" datasource="#Application.Settings.DSN#">
                    DECLARE @StartDate datetime;
                    DECLARE @EndDate datetime;
                    DECLARE @Container int;
                    
                    SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @Container = (SELECT CategoryID
                                      FROM ce_Category
                                      WHERE Name = 'STD/HIV');
                        
                    WITH DistinctAttendees (PersonID) 
                    AS (
                        SELECT DISTINCT A.PersonID
                        FROM ce_Attendee AS A 
                        INNER JOIN ce_Activity_Category AS AC ON AC.ActivityID = A.ActivityID
                        INNER JOIN ce_Activity AS Act ON Act.ActivityID = A.ActivityID
                        WHERE   AC.CategoryID = @Container AND 
                                (Act.StartDate BETWEEN @StartDate AND @EndDate) AND 
                                a.DeletedFlag = 'N' AND 
                                act.StatusID IN (1,2,3) AND 
                                act.Sponsor = 'Cincinnati STD/HIV Prevention Training Center' AND
                                act.SessionType = 'M' AND
                                act.ParentActivityID IS NOT NULL
                    )
    
                    SELECT	s.State,
                            s.Name,
                            (SELECT	COUNT(att.PersonID)
                             FROM DistinctAttendees att
                             INNER JOIN ce_Person_Address a ON a.PersonID = att.PersonID
                             WHERE (a.StateID = s.StateID) AND (a.PrimaryFlag = 'Y')) AS AttendeeCount
                    FROM pd_State s
                    WHERE (SELECT	COUNT(att.PersonID)
                             FROM DistinctAttendees att
                             INNER JOIN pd_Address a ON a.PersonID = att.PersonID
                             WHERE (a.StateID = s.StateID) AND (a.PrimaryFlag = 'Y')) > 0
                    ORDER BY s.Name
                </cfquery>
                
                <!--- GET COUNT OF ATTENDEES WITHOUT A STATE --->
                <cfquery name="qGetNonStateAttendeeInfo" datasource="#Application.Settings.DSN#">
                    DECLARE @StartDate datetime;
                    DECLARE @EndDate datetime;
                    DECLARE @Container int;
                    
                    SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @Container = (SELECT CategoryID
                                      FROM ce_Category
                                      WHERE Name = 'STD/HIV');
                        
                    WITH DistinctAttendees (PersonID) 
                    AS (
                        SELECT DISTINCT A.PersonID
                        FROM ce_Attendee AS A 
                        INNER JOIN ce_Activity_Category AS AC ON AC.ActivityID = A.ActivityID
                        INNER JOIN ce_Activity AS Act ON Act.ActivityID = A.ActivityID
                        WHERE   AC.CategoryID = @Container AND 
                                (Act.StartDate BETWEEN @StartDate AND @EndDate) AND 
                                a.DeletedFlag = 'N' AND 
                                act.StatusID IN (1,2,3) AND 
                                act.Sponsor = 'Cincinnati STD/HIV Prevention Training Center' AND
                                act.SessionType = 'M' AND
                                act.ParentActivityID IS NOT NULL
                    )
                        
                    SELECT	COUNT(att.PersonID) AS AttendeeCount
                    FROM DistinctAttendees AS att
                    INNER JOIN pd_Address a ON a.PersonID=att.PersonID
                    WHERE a.PrimaryFlag = 'Y' AND a.StateID IS NULL 
                </cfquery>
            </cfif>
            
            <cfif ListFind(Arguments.SectionList, "Cities", ",")>
				<!--- GET LIST OF CITIES BY STATE --->
                <cfquery name="qGetCitiesByStates" datasource="#Application.Settings.DSN#">
                    DECLARE @StartDate datetime;
                    DECLARE @EndDate datetime;
                    DECLARE @Container int;
                    
                    SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
                    SET @Container = (SELECT CategoryID
                                      FROM ce_Category
                                      WHERE Name = 'STD/HIV');
                        
                    WITH DistinctAttendees (PersonID) 
                    AS (
                        SELECT DISTINCT A.PersonID
                        FROM ce_Attendee AS A 
                        INNER JOIN ce_Activity_Category AS AC ON AC.ActivityID = A.ActivityID
                        INNER JOIN ce_Activity AS Act ON Act.ActivityID = A.ActivityID
                        WHERE   AC.CategoryID = @Container AND 
                                (Act.StartDate BETWEEN @StartDate AND @EndDate) AND 
                                a.DeletedFlag = 'N' AND 
                                act.StatusID IN (1,2,3) AND 
                                act.Sponsor = 'Cincinnati STD/HIV Prevention Training Center' AND
                                act.SessionType = 'M' AND
                                act.ParentActivityID IS NOT NULL
                    )
                        
                    SELECT DISTINCT s.Name AS StateName,
                            a.City
                    FROM DistinctAttendees att
                    INNER JOIN pd_Address a ON a.PersonID = att.PersonID
                    LEFT JOIN pd_State s ON s.StateID = a.StateID
                    WHERE (a.PrimaryFLag = 'Y') AND (a.City IS NOT NULL)
                    ORDER BY s.Name, a.City
                </cfquery>
                
                <cfset aCitiesByState = ArrayNew(2)>
                <cfset CurrStateName = "">
                <cfset RowCounter = 1>
                
                <!--- LOOP THROUGH LIST OF CITIES BY STATE --->
                <cfloop query="qGetCitiesByStates">
                    <cfif qGetCitiesByStates.StateName NEQ CurrStateName>
                        <!--- UPDATE CURRSTATENAME --->
                        <cfset CurrStateName = qGetCitiesByStates.StateName>
                        
                        <!--- FILL ARRAY --->
                        <cfset aCitiesByState[RowCounter][1] = qGetCitiesByStates.StateName>
                        <cfset aCitiesByState[RowCounter][2] = qGetCitiesByStates.City>
                    <cfelse>
                        <!--- FILL ARRAY --->
                        <cfset aCitiesByState[RowCounter][1] = "">
                        <cfset aCitiesByState[RowCounter][2] = qGetCitiesByStates.City>
                    </cfif>
                    
                    <cfset RowCounter = RowCounter + 1>
                </cfloop>
            </cfif>
            
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
                <cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\CDC_Overview_#DateFormat(Arguments.StartDate,'MDDYY')#-#DateFormat(Arguments.EndDate,'MDDYY')#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">
                
                <!--- Start Building Excel file --->
                <poi:document name="Request.ExcelData" file="#ReportExtendedPath#">
                    <poi:classes>
                        <poi:class name="title" style="font-family: arial ; color: WHITE ;  font-size: 16pt ; font-weight: bold; text-align: center ; background-color: GREY_50_PERCENT;" />
                        <poi:class name="subtitle" style="font-family: arial ; color: WHITE ;  font-size: 12pt ; font-weight: bold; text-align: center ; background-color: GREY_50_PERCENT;" />
                        <poi:class name="sectionheader" style="font-family: arial ; color: WHITE ;  font-size: 10pt ; font-weight: bold; text-align: center ; background-color: GREY_25_PERCENT;" />
                    </poi:classes>
                    
                    <poi:sheets>
                        <poi:sheet name="Overview Report" orientation="landscape">
                            <poi:columns>
                                <poi:column style="width:272px;" />
                                <poi:column style="width:125px;" />
                            </poi:columns>
                            
                            <poi:row class="title">
                                <poi:cell value="#DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                		  colspan="2" />
                            </poi:row>
                            
                            <poi:row class="title">
                                <poi:cell value="STD/HIV Training Courses"
                                		  colspan="2" />
                            </poi:row>
                            
                            <cfif ListFind(Arguments.SectionList, "Course", ",")>
								<!--- SUMMARY OF ACTIVITIES --->
                                <poi:row class="subtitle">
                                    <poi:cell value="Summary of Courses - #DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                              colspan="2" />
                                </poi:row>
                                
                                <poi:row class="sectionheader">
                                    <poi:cell value="Activity Title" />
                                    <poi:cell value="Activity Count" />
                                </poi:row>
                                
                                <poi:row>
                                    <poi:cell value="#TotalActivityCount# scheduled courses presented"
                                              colspan="2"
                                              style="background-color:GREY_25_PERCENT; font-weight: bold;" />
                                </poi:row>
        
                                <cfloop from="1" to="#ArrayLen(aActivityCount)#" index="RowCounter">
                                <poi:row>
                                    <poi:cell value="#aActivityCount[RowCounter][1]#" />
                                    <poi:cell value="#aActivityCount[RowCounter][2]#" type="numeric" numberformat="0"  />
                                </poi:row>
                                </cfloop>
                                
                                <poi:row>
                                    <poi:cell value=" "
                                              colspan="2" />
                                </poi:row>
                            </cfif>
                            
                            <cfif ListFind(Arguments.SectionList, "Participants", ",")>
								<!--- SUMMARY OF PARTICIPANTS --->
                                <poi:row class="subtitle">
                                    <poi:cell value="Summary of Participants - #DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                              colspan="2" />
                                </poi:row>
                                
                                <poi:row class="sectionheader">
                                    <poi:cell value="Degree" />
                                    <poi:cell value="Degree Count" />
                                </poi:row>
                                
                                <poi:row>
                                    <poi:cell value="Total number participants in all courses - #qTotalAttendees.AttendeeCount#"
                                              colspan="2"
                                              style="background-color:GREY_25_PERCENT; font-weight: bold;" />
                                </poi:row>
        
                                <cfloop query="qGetDegreeCount">
                                <poi:row>
                                    <poi:cell value="#qGetDegreeCount.EduName#" />
                                    <poi:cell value="#qGetDegreeCount.PersonCount#" type="numeric" numberformat="0"  />
                                </poi:row>
                                </cfloop>
                                
                                <poi:row>
                                    <poi:cell value=" "
                                              colspan="2" />
                                </poi:row>
                            </cfif>
                            
                            <cfif ListFind(Arguments.SectionList, "ParticipantsCourse", ",")>
								<!--- SUMMARY OF PARTICIPANTS BY COURSE --->
                                <poi:row class="subtitle">
                                    <poi:cell value="Summary of Participants by Course - #DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                              colspan="2" />
                                </poi:row>
                                
                                <poi:row class="sectionheader">
                                    <poi:cell value="Activity Title/Date" />
                                    <poi:cell value="Attendee Count" />
                                </poi:row>
        
                                <cfloop from="1" to="#ArrayLen(aActivityAttendees)#" index="RowCounter">
                                <poi:row>
                                    <poi:cell value="#aActivityAttendees[RowCounter][1]#" />
                                    <poi:cell value="#aActivityAttendees[RowCounter][2]#" type="numeric" numberformat="0"  />
                                </poi:row>
                                </cfloop>
                                
                                <poi:row>
                                    <poi:cell value=" "
                                              colspan="2" />
                                </poi:row>
                            </cfif>
                            
                            <cfif ListFind(Arguments.SectionList, "ParticipantsState", ",")>
								<!--- SUMMARY OF PARTICIPANTS BY STATE --->
                                <poi:row class="subtitle">
                                    <poi:cell value="Summary of Participants by State - #DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                              colspan="2" />
                                </poi:row>
                                
                                <poi:row class="sectionheader">
                                    <poi:cell value="State" />
                                    <poi:cell value="Attendee Count" />
                                </poi:row>
                                
                                <poi:row>
                                    <poi:cell value="None" />
                                    <poi:cell value="#qGetNonStateAttendeeInfo.AttendeeCount#" type="numeric" numberformat="0" />
                                </poi:row>
        
                                <cfloop query="qGetStateAttendeeInfo">
                                <poi:row>
                                    <poi:cell value="#qGetStateAttendeeInfo.Name#" />
                                    <poi:cell value="#qGetStateAttendeeInfo.AttendeeCount#" type="numeric" numberformat="0"  />
                                </poi:row>
                                </cfloop>
                                
                                <poi:row>
                                    <poi:cell value=" "
                                              colspan="2" />
                                </poi:row>
                            </cfif>
                            
                            <cfif ListFind(Arguments.SectionList, "Cities", ",")>
								<!--- SUMMARY OF CITIES (REPRESENTED BY STATE) --->
                                <poi:row class="subtitle">
                                    <poi:cell value="Summary of Cities (Represented by State) - #DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                              colspan="2" />
                                </poi:row>
                                
                                <poi:row class="sectionheader">
                                    <poi:cell value="State" />
                                    <poi:cell value="City" />
                                </poi:row>
        
                                <cfloop from="1" to="#ArrayLen(aCitiesByState)#" index="RowCounter">
                                <poi:row>
                                    <poi:cell value="#aCitiesByState[RowCounter][1]#" />
                                    <poi:cell value="#aCitiesByState[RowCounter][2]#"  />
                                </poi:row>
                                </cfloop>
                                
                                <poi:row>
                                    <poi:cell value=" "
                                              colspan="2" />
                                </poi:row>
                            </cfif>
                        </poi:sheet>
                    </poi:sheets>
                </poi:document>
                                    
                <cfset Status = "Success|Your report has been generated!">
            <cftry>
                <cfcatch type="any">
                    <cfset Status = "Fail|Error: " & cfcatch.Message>
                </cfcatch>
            </cftry>
            
            <cfreturn Status />
        <cfelse>
        	<cfreturn Status />
        </cfif>
    </cffunction>
</cfcomponent>