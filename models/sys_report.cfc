<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Report")>
        <cfset property(name="id", column="ReportID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
    
    <!------------------------------------------------------------------------------------------->
    
    <cffunction name="getCMECertDataFor">
    	<cfargument name="activityId" type="numeric" required="yes">
        <cfargument name="selectedAttendees" type="string" required="no">
        <cfargument name="selectedMembers" type="string" required="no">
        
    	<cfquery name="qReportDataPre" datasource="#get('dataSourceName')#">
            SELECT 	a.MDFlag,
                    a.CompleteDate,
                    act.StartDate AS CertificateDate,
                    act.EndDate,
                    act.ActivityID,
                    act.Title AS ActivityTitle,
                    act.ActivityTypeID, 
                    at.displayName AS activityTypeName,
                    act.Location AS ActivityLocation, 
                    act.Sponsorship,
                    act.Sponsor,
                    act.City,
                    s.Name AS State,
                    a.AttendeeID,
                    displayName = (CASE 
                        WHEN isNull(a.PersonId,0) = 0 THEN
                            a.certname
                        ELSE
                            p.certname
                    END),
                    ac.Amount AS TotalAmount,
                    (SELECT TOP 1 attc.Amount
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 1)) AS CreditAmount,
                    (SELECT TOP 1 attc.ReferenceNo
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 1)) AS ReferenceNumber,
                    sc.Name AS CreditName
            FROM ce_Attendee a
            LEFT OUTER JOIN ce_Person p ON p.PersonID = a.PersonID AND p.deletedFlag = 'N'
            INNER JOIN ce_Activity_Credit ac ON ac.ActivityID = a.ActivityID
            INNER JOIN ce_Sys_Credit sc ON sc.CreditID = ac.CreditID
            INNER JOIN ce_Activity act ON act.ActivityID = a.ActivityID
            INNER JOIN ce_sys_ActivityType at ON at.activityTypeId = act.activityTypeId
            LEFT JOIN ce_Sys_State s ON s.StateId = act.State
            WHERE 
                <cfif IsDefined("arguments.SelectedAttendees") AND len(trim(arguments.SelectedAttendees)) GT 0>
                (
                    a.AttendeeId IN (#arguments.SelectedAttendees#) AND
                    a.DeletedFlag = 'N' AND 
                    a.ActivityID = <cfqueryparam value="#arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
                    sc.Name = <cfqueryparam value="CME" cfsqltype="cf_sql_varchar" /> AND
                    act.DeletedFlag = 'N' AND
                    a.StatusId = 1
                )
                <cfelseif IsDefined("arguments.SelectedMembers") AND len(trim(arguments.SelectedMembers)) GT 0>
                (
                    a.PersonId IN (#arguments.SelectedMembers#) AND
                    a.DeletedFlag = 'N' AND 
                    a.ActivityID = <cfqueryparam value="#arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
                    sc.Name = <cfqueryparam value="CME" cfsqltype="cf_sql_varchar" /> AND
                    act.DeletedFlag = 'N' AND
                    a.StatusId = 1
                )
                <cfelse>
                a.DeletedFlag = 'N' AND 
                a.ActivityID = <cfqueryparam value="#arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
                sc.Name = <cfqueryparam value="CME" cfsqltype="cf_sql_varchar" /> AND
                act.DeletedFlag = 'N' AND
                a.StatusId = 1
                </cfif>
            ORDER BY (CASE 
                    WHEN isNull(a.PersonId,0) = 0 THEN
                        0 
                    ELSE
                        1
                END),(CASE 
                    WHEN isNull(a.PersonId,0) = 0 THEN
                        isNull(a.lastname,'') + ', ' + isNull(a.FirstName,'')
                    ELSE
                        isNull(p.lastname,'') + ', ' + isNull(p.FirstName,'')
                END)
                
        </cfquery>
        
        <!--- DEFINE NEW QUERY --->
        <cfset qReportData = QueryNew("CertificateDate,ActivityID,ActivityTitle,ActivityLocation,City,State,ActivityType,AttendeeID,DisplayName,TotalAmount,CreditAmount,ReferenceNumber,CreditName,AwardStatement,SponsorshipStatement,MaterialApproveDate,MaterialExpireDate")>
        <cfset RowCount = 1>
        <cfloop query="qReportDataPre">
            <cfset ActStartDate = DateFormat(qReportDataPre.CertificateDate,"MMMM D, YYYY")>
            <cfset ActEndDate = DateFormat(qReportDataPre.EndDate,"MMMM D, YYYY")>
            
            <!--- ADD NEW ROW --->
            <cfset QueryAddRow(qReportData,1)>
            
            <!--- BUILD NEW QUERY --->
            <cfif qReportDataPre.ActivityTypeID EQ 2>
                <cfset QuerySetCell(qReportData, "CertificateDate", DateFormat(qReportDataPre.CompleteDate, "MMMM D, YYYY"), RowCount)>
            <cfelse>
                <cfset ActStartDate = DateFormat(qReportDataPre.CertificateDate,"MMMM D, YYYY")>
                <cfset ActEndDate = DateFormat(qReportDataPre.EndDate,"MMMM D, YYYY")>
                
                <cfif qReportDataPre.CertificateDate EQ qReportDataPre.EndDate>
                    <cfset QuerySetCell(qReportData, "CertificateDate", ActStartDate, RowCount)>
                <cfelse>
                    <cfif compare(datepart("yyyy", actStartDate), datepart("yyyy", ActEndDate)) EQ 0 AND compare(datepart("m", actStartDate), datepart("m", ActEndDate)) EQ 0>
                        <cfset QuerySetCell(qReportData, "CertificateDate", dateFormat(ActStartDate, "MMMM DD") & " - " & dateFormat(ActEndDate, "DD, YYYY"), RowCount)>
                    <cfelseif compare(datepart("yyyy", actStartDate), datepart("yyyy", ActEndDate)) EQ 0>
                        <cfset QuerySetCell(qReportData, "CertificateDate", dateFormat(ActStartDate, "MMMM DD") & " - " & dateFormat(ActEndDate, "MMMM DD, YYYY"), RowCount)>
                    <cfelse>
                        <cfset QuerySetCell(qReportData, "CertificateDate", ActStartDate & " - " & ActEndDate, RowCount)>
                    </cfif>
                </cfif>
            </cfif>
            <cfset QuerySetCell(qReportData, "ActivityID", qReportDataPre.ActivityID, RowCount)>
            <cfset QuerySetCell(qReportData, "ActivityTitle", qReportDataPre.ActivityTitle, RowCount)>
            <cfset QuerySetCell(qReportData, "ActivityLocation", qReportDataPre.ActivityLocation, RowCount)>
            <cfset QuerySetCell(qReportData, "City", qReportDataPre.City, RowCount)>
            <cfset QuerySetCell(qReportData, "State", qReportDataPre.State, RowCount)>
            <cfset QuerySetCell(qReportData, "ActivityType", qReportDataPre.activityTypeName, RowCount)>
            <cfset QuerySetCell(qReportData, "AttendeeID", qReportDataPre.AttendeeID, RowCount)>
            <cfset QuerySetCell(qReportData, "DisplayName", qReportDataPre.DisplayName, RowCount)>
            <cfset QuerySetCell(qReportData, "TotalAmount", qReportDataPre.TotalAmount, RowCount)>
            <cfset QuerySetCell(qReportData, "CreditAmount", qReportDataPre.CreditAmount, RowCount)>
            <cfset QuerySetCell(qReportData, "ReferenceNumber", qReportDataPre.ReferenceNumber, RowCount)>
            <cfset QuerySetCell(qReportData, "CreditName", qReportDataPre.CreditName, RowCount)>
            <!--- SET AWARDSTATEMENT --->
            <cfif qReportDataPre.MDFlag EQ "Y">
                <cfif qReportDataPre.CreditAmount NEQ "">
                    <cfset QuerySetCell(qReportData, "AwardStatement", "and is awarded " & qReportDataPre.CreditAmount & " Category I Credit(s) toward the Physician's Recognition Award", RowCount)>
                <cfelse>
                    <cfset QuerySetCell(qReportData, "AwardStatement", "and is awarded " & qReportDataPre.TotalAmount & " Category I Credit(s) toward the Physician's Recognition Award", RowCount)>
                </cfif>
            <cfelse>
                <cfif qReportDataPre.CreditAmount NEQ "">
                    <cfset QuerySetCell(qReportData, "AwardStatement", "The activity was designated for " & qReportDataPre.CreditAmount & " AMA PRA Category I Credit(s)™", RowCount)>
                <cfelse>
                    <cfset QuerySetCell(qReportData, "AwardStatement", "The activity was designated for " & qReportDataPre.TotalAmount & " AMA PRA Category I Credit(s)™", RowCount)>
                </cfif>
            </cfif>
            
            <!--- SET SPONSORSHIPSTATEMENT --->
            <cfif qReportDataPre.Sponsorship EQ "J">
                <!--- JOINTLY --->
                <cfset QuerySetCell(qReportData, "SponsorshipStatement", "This activity has been jointly sponsored by the University of Cincinnati Office of Continuing Medical Education and " & qReportDataPre.Sponsor & ".", RowCount)>
            <cfelse>
                <!--- DIRECT --->
                <cfset QuerySetCell(qReportData, "SponsorshipStatement", "Sponsored by the University of Cincinnati Office of Continuing Medical Education.", RowCount)>
            </cfif>
            
            <cfif qReportDataPre.ActivityTypeID EQ 2>
                <cfset QuerySetCell(qReportData, "MaterialApproveDate", "Material Approval Date: " & DateFormat(qReportDataPre.CertificateDate, 'MMMM YYYY'), RowCount)>
                <cfset QuerySetCell(qReportData, "MaterialExpireDate", "Material Expiration Date: " & DateFormat(qReportDataPre.EndDate, 'MMMM YYYY'), RowCount)>
            <cfelse>
                <cfset QuerySetCell(qReportData, "MaterialApproveDate", "", RowCount)>
                <cfset QuerySetCell(qReportData, "MaterialExpireDate", "", RowCount)>
            </cfif>
            
            <cfset RowCount++>
        </cfloop>
        
        <cfreturn qReportData />
    </cffunction>
</cfcomponent>
