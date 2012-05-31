<cfcomponent displayname="Attendance Report">
	<cffunction name="Run" access="remote" output="true" returntype="string">
    	<cfargument name="ActivityID" type="string" required="true" />
    	<cfargument name="ReportID" type="string" required="true" default="13" />
        
		<cfquery name="qActivity" datasource="#Application.Settings.DSN#">
			SELECT Title FROM ce_Activity
			WHERE ActivityID=#Arguments.ActivityID#
		</cfquery>
		
		<cfset qAttendees = Application.Com.AttendeeGateway.getByViewAttributes(ActivityID=Arguments.ActivityID,DeletedFlag="N",OrderBy="LastName,FirstName DESC")>
        
		<!--- Import POI Library --->
		<cfimport taglib="/_poi/" prefix="poi" />
		
		<!--- Create Report Folder variable --->
		<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports")>
		
		<!--- Check if the report folder exists yet --->
		<cfif NOT DirectoryExists("#ReportPath#\#Arguments.ReportID#")>
			<cfdirectory action="Create" directory="#ReportPath#\#Arguments.ReportID#">
		</cfif>
		
		<!--- Define variables used in the CreateExcel object --->
		<cfset CurrFileName = "Attendance_Report_#Arguments.ActivityID#_#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#.xls">
		<cfset ReportExtendedPath = ReportPath & "\" & Arguments.ReportID & "\" & CurrFileName>
        
		<cfset ColumnCount = 8>
        
		<!--- Start Building Excel file --->
		<poi:document name="Request.ExcelData" file="#ReportExtendedPath#">
			<poi:classes>
				<poi:class name="title" style="font-family: arial; color: ##000; font-size:12pt; font-weight:bold;  background-color: PALE_BLUE; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="headers" style="font-family: arial ; color: ##000; background-color:GREY_25_PERCENT;  font-size: 10pt; font-weight: bold; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="data" style="font-family: arial ; color: ##000 ;  font-size: 10pt; border-bottom:2px GREY_50_PERCENT;" />
			</poi:classes>
			
			<poi:sheets>
				<poi:sheet name="Attendance Records" orientation="landscape">
					<poi:columns>
						<cfloop from="1" to="#ColumnCount#" index="i">
						<poi:column style="width: 150px;" />
						</cfloop>
					</poi:columns>
					
					<poi:row class="title">
						<poi:cell value="#Left(qActivity.Title,100)# Attendance - #DateFormat(now(),'mm/dd/yyyy')# #TimeFormat(now(),'hh:mm TT')#" colspan="#ColumnCount#" />
					</poi:row>
					
					<poi:row class="headers">
						<poi:cell value="First Name" />
						<poi:cell value="Middle Name" />
						<poi:cell value="Last Name" />
                        <poi:cell value="Status" />
						<poi:cell value="Registration Date" />
						<poi:cell value="Completion Date" />
                        <poi:cell value="Degree" />
						<poi:cell value="Email" />
					</poi:row>
					
					<cfloop query="qAttendees">
						<cfset RegistrationDate = DateFormat(qAttendees.RegisterDate, "MM/DD/YYYY") & " " & TimeFormat(qAttendees.RegisterDate, "hh:mmTT")>
                        <cfif qAttendees.CompleteDate NEQ "">
							<cfset CompletionDate = DateFormat(qAttendees.CompleteDate, "MM/DD/YYYY") & " " & TimeFormat(qAttendees.CompleteDate, "hh:mmTT")>
                        <cfelse>
                        	<cfset CompletionDate = "">
                        </cfif>
						<poi:row>
							<poi:cell value="#qAttendees.FirstName#" />
							<poi:cell value="#qAttendees.MiddleName#" />
							<poi:cell value="#qAttendees.LastName#" />
							<poi:cell value="#qAttendees.StatusName#" />
							<poi:cell value="#RegistrationDate#" />
							<poi:cell value="#CompletionDate#" />
                            <poi:cell value="#DegreeName#" />
							<poi:cell value="#Email#" />
						</poi:row>
					</cfloop>
					
				</poi:sheet>
			</poi:sheets>
		</poi:document>
	
		<cfheader name="Content-Type" value="application/msexcel">
		<cfheader name="Content-Disposition" value="attachment; filename=#CurrFileName#">
		<cfcontent type="application/msexcel" file="#ReportExtendedPath#" deletefile="No">
    </cffunction>
</cfcomponent>