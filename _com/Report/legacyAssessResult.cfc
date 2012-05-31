<cfcomponent displayname="Legacy Survey Builder Results" output="no">
	<cfimport taglib="/_poi/" prefix="poi" />
	
	<!--- CONFIGURATION --->
	<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports/22/")>
	<cfset ReportFileName = "#lcase(left(form.formname,30))#-#DateFormat(Now(),'MMDDYY')##TimeFormat(Now(),'hhmmss')#-#Session.AccountID#.xls">
	<cfset ColumnCount = 0>
	<cfset Title = "Legacy Survey Builder Results">
	<cfset BookName = "Form Results">
	
	<cfif NOT DirectoryExists("#ReportPath#")><cfdirectory action="Create" directory="#ReportPath#"></cfif>
	
	<!--- RUN METHOD --->
	<cffunction name="Run" access="remote" output="yes">
		<cfargument name="formname" type="string" required="yes" />
		
		<cfset var sDataFields = "">
		<cfset var sColumnHeaders = "">
		
		<cfquery name="Columns" datasource="CCPD-SQL">
			SELECT    fieldid, fieldname, fieldcaption
			FROM         afhformfields
			WHERE     (fieldformname = <cfqueryparam value="#Arguments.formname#" cfsqltype="cf_sql_varchar" />) AND (fieldtype <> 'caption')
			ORDER BY fieldorder
		</cfquery>
		
		<cfset ColumnCount = Columns.RecordCount>
		<cfset structColumns = Application.UDF.QueryToStruct(Columns)>
		<cfquery name="ReportData" datasource="CCPD-SQL">
			SELECT     
				resultid, resultdate, resulttime, resultform, resultipaddress, resulttable, resultstatus, 
				<cfloop from="1" to="#ArrayLen(structColumns)#" index="i">
					#structColumns[i].FieldName#<cfif i NEQ arrayLen(structColumns)>,</cfif>
				</cfloop>
			FROM  
				afhformresults
			WHERE resultform=<cfqueryparam value="#arguments.formname#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<poi:document name="Request.ExcelData" file="#ReportPath##ReportFileName#">
			<poi:classes>
				<poi:class name="title" style="font-family: arial; vertical-align:middle; color: ##000; height:45px; font-size:12pt; font-weight:bold;  background-color: PALE_BLUE; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="headers" style="font-family: arial ; color: ##000; background-color:GREY_25_PERCENT;  font-size: 10pt; font-weight: bold; border-top: 3px BLACK; border-bottom:3px BLACK; border-left: 2px BLACK; border-right:2px BLACK;" />
				<poi:class name="data" style="font-family: arial ; color: ##000 ;  font-size: 10pt; border-bottom:2px GREY_50_PERCENT;" />
			</poi:classes>
			
			<poi:sheets>
				<poi:sheet name="#BookName#" orientation="landscape">
					<poi:columns>
						<cfloop from="1" to="#ArrayLen(structColumns)#" index="i">
						<poi:column style="width:150px;" />
						</cfloop>
					</poi:columns>
					
					<poi:row class="title">
						<poi:cell value="#Title#" colspan="#ColumnCount#" />
					</poi:row>
					
					<poi:row class="headers">
						<cfloop from="1" to="#ArrayLen(structColumns)#" index="i">
							<poi:cell value="#structColumns[i].FieldCaption#" />
						</cfloop>
					</poi:row>
					
					<cfloop query="ReportData">
					<poi:row class="data">
						<cfloop from="1" to="#ArrayLen(structColumns)#" index="i">
							<poi:cell value="#Evaluate('ReportData.#structColumns[i].FieldName#')#" />
						</cfloop>
					</poi:row>
					</cfloop>
				</poi:sheet>
			</poi:sheets>
		</poi:document>
		
		<cfheader name="Content-Type" value="application/msexcel">
		<cfheader name="Content-Disposition" value="attachment; filename=#ReportFileName#">
		<cfcontent type="application/msexcel" file="#ReportPath##ReportFileName#" deletefile="No">
	</cffunction>
</cfcomponent>