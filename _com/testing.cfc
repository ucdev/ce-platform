<cfcomponent>
	<cffunction name="CDCTesting" access="remote" returntype="string">
		<cfquery name="qGetAttendees" datasource="#Application.Settings.DSN#">
            	DECLARE @StartDate datetime
				DECLARE @EndDate datetime
				SET @StartDate = '10/01/2009'
				SET @EndDate = '12/31/2009'
                
                SELECT
                    act.activityid,
                    act.ExternalID,
                    act.ReleaseDate,
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
                    p.State AS WorkState,
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
                ORDER BY act.ReleaseDate
            </cfquery>
			<!--- Create a new part query. --->
			<cfset qReport = QueryNew("CourseID,Part,Crsdate,StuID,ID,LName,FName,MName,Degree,Title,OrgName,Phone,Phone2,Fax,Email,OrgAdd1,OrgAdd2,OrgCity,OrgState,OrgZip,OrgCountry,Sex,Amind,Asian,Black,White,Pacific,Hispanic,OccClas,ProfC,ProfCSp,FunRC,FunRCSp,ProfN,ProfNSp,FunRN,FunRNSp,WorkSt,WorkZip,OrgType,Tspecify,CBOFund,CBOCDC,CBOOth,CBAFund,CBACDC,CBAOth,FocSTD,FocHIV,FocWRH,FocGen,FocAdol,FocMH,FocSub,FocEm,FocCor,FocOth,FocSpec,PopGen,PopAdol,PopGLB,PopTran,PopHome,PopCorr,PopPreg,PopSW,PopAA,PopAs,PopNH,PopAIAN,PopHisp,PopImm,PopIDU,PopSub,PopHIV,PopOth,PopSpec,Market,Mspecify","cf_sql_varchar, cf_sql_varchar, cf_sql_date, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, 
									  																																																																																																																																																   cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar") />
			<!--- Create some record. --->
			<cfloop query="qGetAttendees">
            	<cfset ActivityReleaseDate = "">
                <cfset CDCCourseDate = "">
                
            	<!--- FORMAT RELEASEDATE ---->
                <cfset ActivityReleaseDate = DateFormat(qGetAttendees.ReleaseDate, "MM/DD/YYYY")>
                <!--- SET CDCCOURSEDATE --->
                <cfif DateCompare(qGetAttendees.StartDate,'10/01/2009 00:00:00') EQ -1>
                	<cfset CDCCourseDate = '12/31/2009 23:59:59'>
                <cfelse>
                	<cfset CDCCourseDate = DateFormat(qGetAttendees.ReleaseDate, "MM/DD/YYYY")>
                </cfif>
                
                <cfset CDCCourseID = "CI" & qGetAttendees.ExternalID & "001A">
                
                <cfif Len(DateFormat(qGetAttendees.Birthdate, "MMDD")) NEQ 4>
                	<cfset CDCStuID = qGetAttendees.CBAOth>
                <cfelse>
                	<cfset CDCStuID = UCase(Left(qGetAttendees.FirstName,2)) & UCase(Left(qGetAttendees.LastName,2)) & DateFormat(qGetAttendees.Birthdate,"MMDD")>
                </cfif>
                
                <cfset CompleteCDCID = CDCCourseID & ActivityReleaseDate & CDCStuID
                
				<!--- Add a row to the query. --->
                <cfset QueryAddRow( qReport ) />
                 
                <!--- Populate row with random data. --->
                <cfset qReport["CourseID"][ qReport.RecordCount ] = JavaCast("string", CDCCourseID) />
                <cfset qReport["Part"][ qReport.RecordCount ] = JavaCast("string", "1") />
                <cfset qReport["Crsdate"][qReport.RecordCount] = JavaCast("string", CDCCourseDate) />
                <cfset qReport["StuID"][qReport.RecordCount] = JavaCast("string", CDCStuID) />
                <cfset qReport["ID"][qReport.RecordCount] = CompleteCDCID>
                <cfset qReport["Sex"][qReport.RecordCount] = qGetAttendees.Gender>
                <cfswitch expression="#qGetAttendees.EthnicityID#">
                	<cfcase value="1">
						<cfset qReport["Amind"][qReport.RecordCount] = "Y">
                        <cfset qReport["Asian"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Black"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["White"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Pacific"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Hispanic"][qReport.RecordCount] = JavaCast("string", "N") />
                    </cfcase>
                	<cfcase value="2">
						<cfset qReport["Amind"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Asian"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Black"][qReport.RecordCount] = JavaCast("string", "Y") />
                        <cfset qReport["White"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Pacific"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Hispanic"][qReport.RecordCount] = JavaCast("string", "N") />
                    </cfcase>
                	<cfcase value="3">
						<cfset qReport["Amind"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Asian"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Black"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["White"][qReport.RecordCount] = JavaCast("string", "Y") />
                        <cfset qReport["Pacific"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Hispanic"][qReport.RecordCount] = JavaCast("string", "N") />
                    </cfcase>
                	<cfcase value="4">
						<cfset qReport["Amind"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Asian"][qReport.RecordCount] = JavaCast("string", "Y") />
                        <cfset qReport["Black"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["White"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Pacific"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Hispanic"][qReport.RecordCount] = JavaCast("string", "N") />
                    </cfcase>
                	<cfcase value="5">
						<cfset qReport["Amind"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Asian"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Black"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["White"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Pacific"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Hispanic"][qReport.RecordCount] = JavaCast("string", "Y") />
                    </cfcase>
                	<cfcase value="10">
						<cfset qReport["Amind"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Asian"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Black"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["White"][qReport.RecordCount] = JavaCast("string", "N") />
                        <cfset qReport["Pacific"][qReport.RecordCount] = JavaCast("string", "Y") />
                        <cfset qReport["Hispanic"][qReport.RecordCount] = JavaCast("string", "N") />
                    </cfcase>
                </cfswitch>
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
             <cfdump var="#qReport#"><cfabort>
	</cffunction>
</cfcomponent>