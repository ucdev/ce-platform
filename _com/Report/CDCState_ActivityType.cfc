<cfcomponent>
	<cfimport taglib="/_poi/" prefix="poi" />
	
	<!--- CONFIGURATION --->
	<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports/26/")>
	<cfset ReportFileName = "CDCAttendee-State-ActivityType_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#-#Session.AccountID#.xls">
	
	<cfif NOT DirectoryExists("#ReportPath#")><cfdirectory action="Create" directory="#ReportPath#"></cfif>
    
	<cffunction name="Run" access="remote" returntype="string">
		<cfargument name="StartDate" type="string" required="yes">
		<cfargument name="EndDate" type="string" required="yes">
        
        <cfquery name="qGetOnSite" datasource="#Application.Settings.DSN#">
            DECLARE @StartDate datetime;
            DECLARE @EndDate datetime;
            DECLARE @Container int;
            
            SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
            SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
            SET @Container = (SELECT CategoryID
                              FROM ce_Category
                              WHERE Name = 'STD/HIV');
                
           WITH DistinctAttendees (AttendeeID) 
			AS (
				SELECT AttendeeID
				FROM ce_Attendee AS A 
				INNER JOIN ce_Activity_Category AS AC ON AC.ActivityID = A.ActivityID
				INNER JOIN ce_Activity AS Act ON Act.ActivityID = A.ActivityID
				WHERE   AC.CategoryID = @Container AND 
						(Act.StartDate BETWEEN @StartDate AND @EndDate) AND 
						a.DeletedFlag = 'N' AND 
						act.StatusID IN (1,2,3) AND
                        (SELECT COUNT(AC2.Activity_CategoryID)
                         FROM ce_Activity_Category AC2
                         WHERE AC2.ActivityID = ACT.ActivityID AND AC2.CategoryID IN (162,196) AND AC2.DeletedFlag = 'N') = 0
			)
			
			SELECT	s.StateID,
					s.Name,
					(SELECT	COUNT(att.AttendeeID)
					 FROM DistinctAttendees att
					 INNER JOIN ce_AttendeeCDC a ON a.AttendeeID = att.AttendeeID
					 WHERE (a.WorkState = s.StateID)) AS AttendeeCount
			FROM pd_State s
			WHERE (SELECT	COUNT(att.AttendeeID)
					 FROM DistinctAttendees att
					 INNER JOIN ce_AttendeeCDC a ON a.AttendeeID = att.AttendeeID
					 WHERE (a.WorkState = s.StateID)) > 0
			ORDER BY s.Name
        </cfquery>
        
        <cfquery name="qGetArmyeLearning" datasource="#Application.Settings.DSN#">
            DECLARE @StartDate datetime;
            DECLARE @EndDate datetime;
            DECLARE @Container int;
            
            SET @StartDate = <cfqueryparam value="#DateFormat(Arguments.StartDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
            SET @EndDate = <cfqueryparam value="#DateFormat(Arguments.EndDate, 'MM/DD/YYYY')#" cfsqltype="cf_sql_date" />;
            SET @Container = (SELECT CategoryID
                              FROM ce_Category
                              WHERE Name = 'STD/HIV');
                
            WITH DistinctAttendees (AttendeeID) 
			AS (
				SELECT AttendeeID
				FROM ce_Attendee AS A 
				INNER JOIN ce_Activity_Category AS AC ON AC.ActivityID = A.ActivityID
				INNER JOIN ce_Activity AS Act ON Act.ActivityID = A.ActivityID
				WHERE 
				AC.CategoryID IN (162,196) AND
						(Act.StartDate BETWEEN @StartDate AND @EndDate) AND 
						a.DeletedFlag = 'N' AND 
						act.StatusID IN (1,2,3)
			)
			
			SELECT	s.StateID,
					s.Name,
					(SELECT	COUNT(att.AttendeeID)
					 FROM DistinctAttendees att
					 INNER JOIN ce_AttendeeCDC a ON a.AttendeeID = att.AttendeeID
					 WHERE (a.WorkState = s.StateID)) AS AttendeeCount
			FROM pd_State s
			WHERE (SELECT	COUNT(att.AttendeeID)
					 FROM DistinctAttendees att
					 INNER JOIN ce_AttendeeCDC a ON a.AttendeeID = att.AttendeeID
					 WHERE (a.WorkState = s.StateID)) > 0
			ORDER BY s.Name
        </cfquery>
        
        <!--- Excel Section --->
        <!--- Start Building Excel file --->
        <poi:document name="Request.ExcelData" file="#ReportPath##ReportFileName#">
            <poi:classes>
                <poi:class name="title" style="font-family: arial ; color: WHITE ;  font-size: 16pt ; font-weight: bold; text-align: center ; background-color: GREY_50_PERCENT;" />
                <poi:class name="subtitle" style="font-family: arial ; color: WHITE ;  font-size: 12pt ; font-weight: bold; text-align: center ; background-color: GREY_50_PERCENT;" />
                <poi:class name="sectionheader" style="font-family: arial ; color: WHITE ;  font-size: 10pt ; font-weight: bold; text-align: center ; background-color: GREY_25_PERCENT;" />
            </poi:classes>
            
            <poi:sheets>
                <poi:sheet name="Live State Report" orientation="landscape">
                    <poi:columns>
                        <poi:column style="width:272px;" />
                        <poi:column style="width:125px;" />
                    </poi:columns>
                    
                    <poi:row class="title">
                        <poi:cell value="#DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                  colspan="2" />
                    </poi:row>
                    
                    <poi:row class="title">
                        <poi:cell value="Live"
                                  colspan="2" />
                    </poi:row>
                    
					<!--- SUMMARY OF PARTICIPANTS BY STATE // ON SITE --->
                    <poi:row class="subtitle">
                        <poi:cell value="Summary of Participants by State"
                                  colspan="2" />
                    </poi:row>
                    
                    <poi:row class="sectionheader">
                        <poi:cell value="State" />
                        <poi:cell value="Attendee Count" />
                    </poi:row>
					
                    <cfset TotalCount = 0>
                    
                    <cfloop query="qGetOnSite">
                    <poi:row>
                        <poi:cell value="#qGetOnSite.Name#" />
                        <poi:cell value="#qGetOnSite.AttendeeCount#" type="numeric" numberformat="0"  />
                    </poi:row>
                    
                    <cfset TotalCount = TotalCount + qGetOnSite.AttendeeCount>
                    </cfloop>
                    
                    <poi:row>
                        <poi:cell style="font-weight: bold;" value="Total Attendees" />
                        <poi:cell value="#TotalCount#" type="numeric" numberformat="0" />
                    </poi:row>
                </poi:sheet>
                
                <poi:sheet name="Distance Learning State Report" orientation="landscape">
                    <poi:columns>
                        <poi:column style="width:272px;" />
                        <poi:column style="width:125px;" />
                    </poi:columns>
                    
                    <poi:row class="title">
                        <poi:cell value="#DateFormat(Arguments.StartDate,'MMM D, YYYY')# - #DateFormat(Arguments.EndDate,'MMM D, YYYY')#"
                                  colspan="2" />
                    </poi:row>
                    
                    <poi:row class="title">
                        <poi:cell value="Distance Learning"
                                  colspan="2" />
                    </poi:row>
                    
					<!--- SUMMARY OF PARTICIPANTS BY STATE // ON SITE --->
                    <poi:row class="subtitle">
                        <poi:cell value="Summary of Participants by State"
                                  colspan="2" />
                    </poi:row>
                    
                    <poi:row class="sectionheader">
                        <poi:cell value="State" />
                        <poi:cell value="Attendee Count" />
                    </poi:row>
					
                    <cfset TotalCount = 0>

                    <cfloop query="qGetArmyeLearning">
                    <poi:row>
                        <poi:cell value="#qGetArmyeLearning.Name#" />
                        <poi:cell value="#qGetArmyeLearning.AttendeeCount#" type="numeric" numberformat="0"  />
                    </poi:row>
                    
                    <cfset TotalCount = TotalCount + qGetArmyeLearning.AttendeeCount>
                    </cfloop>
                    
                    <poi:row>
                        <poi:cell style="font-weight: bold;" value="Total Attendees" />
                        <poi:cell value="#TotalCount#" type="numeric" numberformat="0" />
                    </poi:row>
                </poi:sheet>
            </poi:sheets>
        </poi:document>
		
		<cfheader name="Content-Type" value="application/msexcel">
		<cfheader name="Content-Disposition" value="attachment; filename=#ReportFileName#">
		<cfcontent type="application/msexcel" file="#ReportPath##ReportFileName#" deletefile="No">
	</cffunction>
</cfcomponent>