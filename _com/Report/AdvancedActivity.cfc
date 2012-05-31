<cfcomponent>
	<cffunction name="getActivityTypes" hint="Returns a JSON list of Activity types." access="remote" output="false" returntype="string">        
        <cfquery name="getActivityTypes" datasource="#Application.Settings.DSN#">
        	SELECT ActivityTypeID, Name
            FROM ce_Sys_ActivityType
            WHERE DeletedFlag = 'N'
            ORDER BY Name
        </cfquery>
       
        <cfoutput><cfsavecontent variable="jsonData">{<cfloop query="getActivityTypes">"#ActivityTypeID#": "#Name#"<cfif CurrentRow NEQ RecordCount>,</cfif></cfloop>}</cfsavecontent></cfoutput>
        
        <cfreturn jsonData />
	</cffunction>
    
	<cffunction name="getGroupings" hint="Returns a JSON list of Activity Groupings." access="remote" output="false" returntype="string">        
        <cfquery name="getGroupings" datasource="#Application.Settings.DSN#">
        	SELECT G.GroupingID, G.Name, AT.Name AS ActivityTypeName
            FROM ce_Sys_Grouping G
            INNER JOIN ce_Sys_ActivityType AT ON AT.ActivityTypeID = G.ActivityTypeID
            ORDER BY AT.Name
        </cfquery>
       
        <cfoutput><cfsavecontent variable="jsonData">{<cfloop query="getGroupings">"#GroupingID#": "#ActivityTypeName# - #Name#"<cfif CurrentRow NEQ RecordCount>,</cfif></cfloop>}</cfsavecontent></cfoutput>
        
        <cfreturn jsonData />
	</cffunction>
    
	<!--- RUN METHOD --->
	<cffunction name="Run" access="remote" output="yes">
    	<cfargument name="ReportType" type="string" required="yes">
        <cfargument name="ReportTypeDetail" type="string" required="yes">
        <cfargument name="StartDate" type="date" required="yes">
        <cfargument name="EndDate" type="date" required="yes">
        
		<cfquery name="ReportData" datasource="#Application.Settings.DSN#">
			SELECT     
                A.ActivityID, 	
                <cfswitch expression="#Arguments.ReportType#">
                	<cfcase value="Activity Type">
                    	ReportDetail = AT.Name,
                    </cfcase>
                	<cfcase value="Grouping">
                    	ReportDetail = G.Name,
                    </cfcase>
                	<cfcase value="Session Type">
                    	ReportDetail = (CASE A.SessionType
                        WHEN 'M' THEN
                        	'Multi-session'
                        WHEN 'S' THEN
                        	'Stand-alone'
                        END),
                    </cfcase>
                	<cfcase value="Sponsorship">
                    	ReportDetail = (CASE A.Sponsorship
                        WHEN 'D' THEN
                        	'Direct'
                        WHEN 'J' THEN
                        	'Joint'
                        END),
                    </cfcase>
                    <cfdefaultcase>
                    	""
                    </cfdefaultcase>
                </cfswitch>
                A.Title, 
                A.StartDate, 
                A.EndDate,
                A.statAttendees
			FROM 
            	ce_Activity AS A 
                <cfswitch expression="#Arguments.ReportType#">
                	<cfcase value="Activity Type">	
                        INNER JOIN
                            ce_Sys_ActivityType AS AT ON AT.ActivityTypeID = A.ActivityTypeID
                    </cfcase>
                	<cfcase value="Grouping">
                        INNER JOIN
                            ce_Sys_Grouping AS G ON G.GroupingID = A.GroupingID
                    </cfcase>
                </cfswitch>
			WHERE 
            	(A.DeletedFlag = 'N') AND 
                <cfswitch expression="#Arguments.ReportType#">
                	<cfcase value="Activity Type">	
                    	(A.ActivityTypeID = <cfqueryparam value="#Arguments.ReportTypeDetail#" cfsqltype="cf_sql_integer" />) AND
                    </cfcase>
                	<cfcase value="Grouping">
                    	(A.GroupingID = <cfqueryparam value="#Arguments.ReportTypeDetail#" cfsqltype="cf_sql_integer" />) AND
                    </cfcase>
                	<cfcase value="Session Type">
                    	(A.SessionType = <cfqueryparam value="#Arguments.ReportTypeDetail#" cfsqltype="cf_sql_char" />) AND
                    </cfcase>
                	<cfcase value="Sponsorship">
                    	(A.Sponsorship = <cfqueryparam value="#Arguments.ReportTypeDetail#" cfsqltype="cf_sql_char" />) AND
                    </cfcase>
                </cfswitch>
                (A.StartDate BETWEEN <cfqueryparam value="#Arguments.StartDate# 00:00:00" cfsqltype="cf_sql_date" /> AND <cfqueryparam value="#Arguments.EndDate# 23:59:59" cfsqltype="cf_sql_date" />)
			ORDER BY A.StartDate
		</cfquery>
        
        <cfimport taglib="/_poi/" prefix="poi" />
		<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports/22/")>
        <cfset ReportFileName = Replace(ReportType, " ", "") & "-" & Replace(ReportData.ReportDetail, " ", "") & "_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">
		
		<poi:document name="Request.ExcelData" file="#ReportPath##ReportFileName#">
			<poi:classes>
				<poi:class name="title" style="font-family: arial; vertical-align:middle; color: ##000; height:45px; font-size:12pt; font-weight:bold;  background-color: PALE_BLUE; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="headers" style="font-family: arial ; color: ##000; background-color:GREY_25_PERCENT;  font-size: 10pt; font-weight: bold; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="data" style="font-family: arial ; color: ##000 ;  font-size: 10pt; border-bottom:2px GREY_50_PERCENT;" />
			</poi:classes>
			
			<poi:sheets>                    
				<poi:sheet name="#Arguments.ReportType#" orientation="landscape">
					<poi:columns>
						<poi:column style="width:100px;" />
						<poi:column style="width:500px;" />
						<poi:column style="width:80px;" />
						<poi:column style="width:80px;" />
						<poi:column style="width:70px;" />
					</poi:columns>
					
					<poi:row class="title">
						<poi:cell value="#Arguments.ReportType# (#ReportData.ReportDetail#) // #DateFormat(Arguments.StartDate,'mm/dd/yyyy')# -to- #DateFormat(Arguments.EndDate,'mm/dd/yyyy')#" colspan="5" />
					</poi:row>
					
					<poi:row class="headers">
                    	<poi:cell value="ActivityID" />
						<poi:cell value="Activity Title" />
						<poi:cell value="Start Date" />
						<poi:cell value="End Date" />
                        <poi:cell value="Attendees" />
					</poi:row>
					
					<cfloop query="ReportData">
					<poi:row class="data">
						<poi:cell value="#ReportData.ActivityID#" type="numeric" numberformat="0" />
						<poi:cell value="#ReportData.Title#" />
						<poi:cell value="#DateFormat(ReportData.StartDate,'MM/DD/YYYY')#"  />
						<poi:cell value="#DateFormat(ReportData.EndDate,'MM/DD/YYYY')#" />
                        <poi:cell value="#ReportData.statAttendees#" type="numeric" numberformat="0" />
					</poi:row>
					</cfloop>
				</poi:sheet>
			</poi:sheets>
		</poi:document>
        
        <cfset Status = "Success|Report has been generated.">
        <cfreturn Status />
	</cffunction>
</cfcomponent>