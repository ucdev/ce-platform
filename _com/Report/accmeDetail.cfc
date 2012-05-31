<cfcomponent displayname="ACCME Summary Report" output="no">
	<cfimport taglib="/_poi/" prefix="poi" />
	
	<!--- CONFIGURATION --->
	<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports/4/")>
	<cfset ReportFileName = "accmedetail-#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#-#Session.AccountID#.xls">
	<cfset ColumnCount = 3>
	<cfset Title = "ACCME Detail">
	<cfset BookName = "ACCME Detail">
	
	<cfif NOT DirectoryExists("#ReportPath#")><cfdirectory action="Create" directory="#ReportPath#"></cfif>
	
	<!--- RUN METHOD --->
	<cffunction name="Run" access="remote" output="yes">
		<cfargument name="StartDate" required="true" type="string">
		<cfargument name="EndDate" required="true" type="string">
	
		<cfset Status = "">
		
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
			<cfquery name="qACCMEData" datasource="#Application.Settings.DSN#">
				DECLARE @StartDate datetime;
				DECLARE @EndDate datetime;
				
				SET @StartDate = #CreateODBCDateTime("#DateFormat(Arguments.StartDate,'mm/dd/yyyy')# 00:00:00")#;
				SET @EndDate = #CreateODBCDateTime("#DateFormat(Arguments.EndDate,'mm/dd/yyyy')# 23:59:59")#;
				
				WITH CTE_Activities ( ActivityID,ParentActivityID,ActivityTitle,ActivityTypeID,ActivityTypeName,ActivityLocation,Sponsorship,CMEHrs,StatMD,StatNonMD,ReleaseDate,ActivityDate,EndDate,StatSupporters,SupportReceived,StatSuppAmount)
				AS (
					SELECT 
						A.ActivityID,
						A.ParentActivityID,
						ActivityTitle = upper(A.Title),
						A.ActivityTypeID,
						ActivityTypeName = AT.Name,
						ActivityLocation = isNull(A.City,'') + ', ' + isNull(A.State,''),
						Sponsorship = (CASE A.Sponsorship
											WHEN 'J' THEN 'Jointly'
											WHEN 'D' THEN 'Directly'
										END),
						CMEHrs = (CASE A.SessionType
									WHEN 'M' THEN 
										isNull((SELECT SUM(AC.Amount) AS TotalHours
												FROM ce_Activity_Credit AS AC 
												INNER JOIN ce_Activity AS A4 ON AC.ActivityID = A4.ActivityID
												WHERE (AC.CreditID = 1) AND (A4.ParentActivityID = a.ActivityID) AND (A4.StatusID IN (1,2,3)) AND (AC.DeletedFlag='N') AND (A4.StartDate BETWEEN @StartDate AND @EndDate)
												OR
												(AC.CreditID = 1) AND (A4.ParentActivityID = a.ActivityID) AND (A4.StatusID IN (1,2,3)) AND (AC.DeletedFlag='N') AND (A4.EndDate BETWEEN @StartDate AND @EndDate)),0)
									WHEN 'S' THEN 
										isNull((SELECT SUM(AC.Amount) AS TotalHours
												FROM ce_Activity_Credit AS AC 
												WHERE (AC.CreditID = 1) AND (AC.ActivityID = A.ActivityID) AND (AC.DeletedFlag='N')),0)
								END),
						StatMD = 
							isNull((CASE
								/* ENDURING MATERIALS */
								WHEN A.ActivityTypeID = 2 THEN 
									
									(SELECT Count(Att.AttendeeID)
									 FROM ce_Attendee AS Att 
									 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
									 WHERE 
										(Att.ActivityID = a.ActivityID) AND
										(Att.MDflag = 'Y') AND 
										(A2.StatusID IN (1,2,3)) AND 
										(Att.CompleteDate BETWEEN @StartDate AND @EndDate) AND
										(A2.StartDate BETWEEN @StartDate AND @EndDate)
											OR
										(Att.ActivityID = a.ActivityID) AND
										(Att.MDflag = 'Y') AND 
										(A2.StatusID IN (1,2,3)) AND 
										(Att.CompleteDate BETWEEN @StartDate AND @EndDate) AND
										(A2.EndDate BETWEEN @StartDate AND @EndDate)
									)
								
								WHEN A.ActivityTypeID <> 2 THEN 
									(CASE A.SessionType
										WHEN 'M' THEN 
											(SELECT Sum(A2.StatMD)
											FROM
											 ce_Activity AS A2
											 WHERE 
												(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.StartDate BETWEEN @StartDate AND @EndDate)
												OR
												(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.EndDate BETWEEN @StartDate AND @EndDate)
											)
										WHEN 'S' THEN
											(SELECT Sum(A2.StatMD)
											FROM
											 ce_Activity AS A2
											 WHERE 
												(A2.ActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.StartDate BETWEEN @StartDate AND @EndDate)
												OR
												(A2.ActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.EndDate BETWEEN @StartDate AND @EndDate)
											)
									END)
											
							END),0),
							StatNonMD = 
							isNull((CASE
								/* ENDURING MATERIALS */
								WHEN A.ActivityTypeID = 2 THEN 
									(SELECT Count(Att2.AttendeeID)
									 FROM ce_Attendee AS Att2 
									 INNER JOIN ce_Activity AS A3 ON Att2.ActivityID = A3.ActivityID
									WHERE 
										(Att2.ActivityID = a.ActivityID) AND
										(Att2.MDflag = 'N') AND 
										(A3.StatusID IN (1,2,3)) AND 
										(Att2.CompleteDate BETWEEN @StartDate AND @EndDate) AND
										(A3.StartDate BETWEEN @StartDate AND @EndDate) AND
										(Att2.DeletedFlag='N')
											OR
										(Att2.ActivityID = a.ActivityID) AND
										(Att2.MDflag = 'N') AND 
										(A3.StatusID IN (1,2,3)) AND 
										(Att2.CompleteDate BETWEEN @StartDate AND @EndDate) AND
										(A3.EndDate BETWEEN @StartDate AND @EndDate) AND
										(Att2.DeletedFlag='N'))
								WHEN A.ActivityTypeID <> 2 THEN 
									(CASE A.SessionType
											WHEN 'M' THEN 
												(SELECT isNull(Sum(A3.StatNonMD),0)+isNull(Sum(A3.StatAddlAttendees),0)
												FROM
												 ce_Activity AS A3
												 WHERE 
													(A3.ParentActivityID = A.ActivityID) AND (A3.StatusID IN (1,2,3)) AND (A3.StartDate BETWEEN @StartDate AND @EndDate)
													OR
													(A3.ParentActivityID = A.ActivityID) AND (A3.StatusID IN (1,2,3)) AND (A3.EndDate BETWEEN @StartDate AND @EndDate)
												)
											WHEN 'S' THEN 
												(SELECT isNull(Sum(A3.StatNonMD),0)+isNull(Sum(A3.StatAddlAttendees),0)
												FROM
												 ce_Activity AS A3
												 WHERE 
													(A3.ActivityID = A.ActivityID) AND (A3.StatusID IN (1,2,3)) AND (A3.StartDate BETWEEN @StartDate AND @EndDate)
													OR
													(A3.ActivityID = A.ActivityID) AND (A3.StatusID IN (1,2,3)) AND (A3.EndDate BETWEEN @StartDate AND @EndDate)
												)
										END)
											
							END),0),
						A.ReleaseDate,
						ActivityDate = A.StartDate,
						A.EndDate,
						StatSupporters = 
						isNull((CASE A.SessionType
							WHEN 'M' THEN 
								(SELECT     COUNT(FS.Amount)
								FROM         ce_Activity_FinSupport AS FS INNER JOIN
													  ce_Activity AS A5 ON FS.ActivityID = A5.ActivityID
								WHERE     (FS.SupportTypeID = 1) AND (FS.DeletedFlag = 'N') AND
									(A5.ParentActivityID = A.ActivityID) AND (A5.StatusID IN (1,2,3)) AND (A5.StartDate BETWEEN @StartDate AND @EndDate)
									OR
									(A5.ParentActivityID = A.ActivityID) AND (A5.StatusID IN (1,2,3)) AND (A5.EndDate BETWEEN @StartDate AND @EndDate)
								)
							WHEN 'S' THEN
								(SELECT     COUNT(Amount) AS Expr1
								FROM         ce_Activity_FinSupport
								WHERE     (SupportTypeID = 1) AND (DeletedFlag = 'N') AND (ActivityID=a.ActivityID))
						END),0)
						,
						(CASE isNull((CASE A.SessionType
							WHEN 'M' THEN 
								(SELECT     COUNT(FS.Amount)
								FROM         ce_Activity_FinSupport AS FS INNER JOIN
													  ce_Activity AS A5 ON FS.ActivityID = A5.ActivityID
								WHERE     (FS.SupportTypeID = 1) AND (FS.DeletedFlag = 'N') AND
									(A5.ParentActivityID = A.ActivityID) AND (A5.StatusID IN (1,2,3)) AND (A5.StartDate BETWEEN @StartDate AND @EndDate)
									OR
									(A5.ParentActivityID = A.ActivityID) AND (A5.StatusID IN (1,2,3)) AND (A5.EndDate BETWEEN @StartDate AND @EndDate)
								)
							WHEN 'S' THEN
								(SELECT     COUNT(Amount) AS Expr1
								FROM         ce_Activity_FinSupport
								WHERE     (SupportTypeID = 1) AND (DeletedFlag = 'N') AND (ActivityID=a.ActivityID))
						END),0)
							WHEN '0' THEN 'No'
							ELSE 'Yes'
						END) AS SupportReceived,
						StatSuppAmount = 
						isNull((CASE A.SessionType
							WHEN 'M' THEN 
								(SELECT     SUM(FS.Amount)
								FROM         ce_Activity_FinSupport AS FS INNER JOIN
													  ce_Activity AS A5 ON FS.ActivityID = A5.ActivityID
								WHERE     (FS.SupportTypeID = 1) AND (FS.DeletedFlag = 'N') AND
									(A5.ParentActivityID = A.ActivityID) AND (A5.StatusID IN (1,2,3)) AND (A5.StartDate BETWEEN @StartDate AND @EndDate)
									OR
									(FS.SupportTypeID = 1) AND (FS.DeletedFlag = 'N') AND
									(A5.ParentActivityID = A.ActivityID) AND (A5.StatusID IN (1,2,3)) AND (A5.EndDate BETWEEN @StartDate AND @EndDate)
								)
							WHEN 'S' THEN
								(SELECT     SUM(Amount) AS Expr1
								FROM         ce_Activity_FinSupport
								WHERE     (SupportTypeID = 1) AND (DeletedFlag = 'N') AND (ActivityID=a.ActivityID))
						END),0)
					FROM ce_Activity AS A
					INNER JOIN ce_Sys_Grouping AS AT ON A.GroupingID=AT.GroupingID
					WHERE 
						A.ActivityTypeID <> 2 AND
						A.StartDate BETWEEN @StartDate AND @EndDate AND
						A.DeletedFlag='N' AND
						A.StatusID IN (1,2,3)
						OR
						A.ActivityTypeID <> 2 AND
						A.EndDate BETWEEN @StartDate AND @EndDate AND
						A.DeletedFlag='N' AND
						A.StatusID IN (1,2,3)
					OR
						A.ActivityTypeID = 2 AND
						(SELECT Count(attendeeid) FROM ce_Attendee AS Att WHERE Att.ActivityID = A.ActivityID AND Att.CompleteDate BETWEEN @StartDate AND @EndDate) > 0 AND
						A.DeletedFlag='N' AND
						A.StartDate BETWEEN @StartDate AND @EndDate AND
						A.StatusID IN (1,2,3) AND
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1 AND ACr.DeletedFlag='N') > 0
						OR
						A.ActivityTypeID = 2 AND
						(SELECT Count(attendeeid) FROM ce_Attendee AS Att WHERE Att.ActivityID = A.ActivityID AND Att.CompleteDate BETWEEN @StartDate AND @EndDate) > 0 AND
						A.DeletedFlag='N' AND
						A.EndDate BETWEEN @StartDate AND @EndDate AND
						A.StatusID IN (1,2,3) AND
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1 AND ACr.DeletedFlag='N') > 0
						
				)
				SELECT * FROM CTE_Activities WHERE isNull(ParentActivityID,0) = 0 ORDER BY ActivityDate;
			</cfquery>
			
			<!--- Define NewQuery Variable and RowCount Variable --->
			<cfset qReport = QueryNew("
										ActivityID,
										ActivityTitle,
										ActivityDate,
										ActivityLocation,
										Sponsorship,
										ActivityTypeName,
										CMEHrs,
										StatMD,
										StatNonMD,
										StatSupporters,
										SupportReceived,
										StatSuppAmount,
										GroupingName",
										"
										cf_sql_integer,
										cf_sql_varchar,
										cf_sql_date,
										cf_sql_varchar,
										cf_sql_varchar,
										cf_sql_varchar,
										cf_sql_decimal,
										cf_sql_integer,
										cf_sql_integer,
										cf_sql_integer,
										cf_sql_varchar,
										cf_sql_decimal,
										cf_sql_varchar
										")>
			<cfset RowCount = 0>
			
			<!--- Fill NewQuery Variable --->
			<cfloop query="qACCMEData">  
				<!--- ACTIVITY TYPE ALIAS --->
				<cfset ActivityType = getTypeAlias(qACCMEData.ActivityTypeName)>
				                  
				<cfscript>
					queryAddRow(qReport);
					
					querySetCell(qReport,"ActivityID",qACCMEData.ActivityID);
					querySetCell(qReport,"ActivityTitle",qACCMEData.ActivityTitle);
					querySetCell(qReport,"ActivityDate",qACCMEData.ActivityDate);
					querySetCell(qReport,"ActivityLocation",qACCMEData.ActivityLocation);
					querySetCell(qReport,"Sponsorship",qACCMEData.Sponsorship);
					querySetCell(qReport,"ActivityTypeName",ActivityType);
					querySetCell(qReport,"CMEHrs",qACCMEData.CMEHrs);
					querySetCell(qReport,"StatMD",qACCMEData.StatMD);
					querySetCell(qReport,"StatNonMD",qACCMEData.StatNonMD);
					querySetCell(qReport,"SupportReceived",qACCMEData.SupportReceived);
					querySetCell(qReport,"StatSuppAmount",qACCMEData.StatSuppAmount);
					querySetCell(qReport,"StatSupporters",qACCMEData.StatSupporters);
				</cfscript>
			</cfloop>
			
			<!--- Excel Section --->
			<cftry>
				
				<!--- Start Building Excel file --->
				<poi:document name="Request.ExcelData" file="#ReportPath##ReportFileName#">
					<poi:classes>
						<poi:class name="title" style="font-family: arial ; color: WHITE ;  font-size: 10pt ; font-weight: bold; text-align: center ; background-color: GREY_50_PERCENT;" />
					</poi:classes>
					
					<poi:sheets>
						<poi:sheet name="#BookName#" orientation="landscape">
							<poi:columns>
								<poi:column style="width:272px;" />
								<poi:column style="width:79px;" />
								<poi:column style="width:111px;" />
								<poi:column style="width:100px;" />
								<poi:column style="width:186px;" />
								<poi:column style="width:71px;" />
								<poi:column style="width:64px;" />
								<poi:column style="width:92px;" />
								<poi:column style="width:120px;" />
								<poi:column style="width:104px;" />
								<poi:column style="width:129px;" />
								<poi:column style="width:129px;" />
								<poi:column style="width:129px;" />
								<poi:column style="width:129px;" />
								<poi:column style="width:129px;" />
								<poi:column style="width:129px;" />
								<poi:column style="width:129px;" />
							</poi:columns>
							
							
							<poi:row class="title">
								<poi:cell value="Activity Title" />
								<poi:cell value="Date" />
								<poi:cell value="Location" />
								<poi:cell value="Sponsorship" />
								<poi:cell value="Type of Activity" />
								<poi:cell value="## of Hours" />
								<poi:cell value="## of MD's" />
								<poi:cell value="## of non-MD's" />
								<poi:cell value="Commercial Support Receieved?" />
								<poi:cell value="Amount of Commercial Support Received" />
								<poi:cell value="Number of Commercial Supporters" />
								<poi:cell value="Designed to change competence?" />
								<poi:cell value="Changes in competence measured?" />
								<poi:cell value="Designed to change performance?" />
								<poi:cell value="Changes in performance measured?" />
								<poi:cell value="Designed to change patient outcomes?" />
								<poi:cell value="Changes in patient outcomes measured?" />
							</poi:row>

							<cfloop query="qReport">
							<poi:row>
								<poi:cell value="#qReport.ActivityTitle#" />
								<poi:cell value="#DateFormat(qReport.ActivityDate,'M/D/YYYY')#" type="date" dateformat="m/d/yy" />
								<poi:cell value="#qReport.ActivityLocation#" style="text-align:center;" />
								<poi:cell value="#qReport.Sponsorship#" style="text-align:center;" />
								<poi:cell value="#qReport.ActivityTypeName#" style="text-align:center;" />
								<poi:cell value="#qReport.CMEHrs#" type="numeric" numberformat="0" />
								<poi:cell value="#qReport.StatMD#" type="numeric" numberformat="0" />
								<poi:cell value="#qReport.StatNonMD#" type="numeric" numberformat="0" />
								<poi:cell value="#qReport.SupportReceived#" style="text-align:center;" />
								<poi:cell value="#qReport.StatSuppAmount#" style="text-align:right;" type="numeric" numberformat="($##,####0_);($##,####0)" />
								<poi:cell value="#qReport.StatSupporters#" style="text-align:center;" type="numeric" numberformat="0"  />
								<poi:cell value="No" style="text-align:center;" />
								<poi:cell value="No" style="text-align:center;" />
								<poi:cell value="No" style="text-align:center;" />
								<poi:cell value="No" style="text-align:center;" />
								<poi:cell value="No" style="text-align:center;" />
								<poi:cell value="No" style="text-align:center;" />
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
		</cfif>
		
		<cfheader name="Content-Type" value="application/msexcel">
		<cfheader name="Content-Disposition" value="attachment; filename=#ReportFileName#">
		<cfcontent type="application/msexcel" file="#ReportPath##ReportFileName#" deletefile="No">
	</cffunction>
	
	<cffunction name="getTypeAlias" access="private">
		<cfargument name="TypeName" type="string" required="yes">
		
		<cfset var ActivityTypeAlias = Arguments.TypeName>
		
		<cfswitch expression="#Arguments.TypeName#">
			<cfcase value="Internet Enduring">
				<cfset ActivityTypeAlias = "Enduring Material">
			</cfcase>
			<cfcase value="Course">
				<cfset ActivityTypeAlias = "Live Course">
			</cfcase>
			<cfcase value="Regularly Scheduled Series">
				<cfset ActivityTypeAlias = "RSS">
			</cfcase>
			<cfcase value="Print">
				<cfset ActivityTypeAlias = "Enduring Material">
			</cfcase>
			<cfcase value="Live Internet">
				<cfset ActivityTypeAlias = "Live Internet">
			</cfcase>
		</cfswitch>
		
		<cfreturn ActivityTypeAlias />
	</cffunction>
</cfcomponent>