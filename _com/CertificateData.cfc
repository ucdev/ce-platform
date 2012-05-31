<cfcomponent>
	<cffunction name="getCMEData" access="remote" output="false" returntype="query">
		<cfargument name="ActivityID" type="string" required="yes">
		<cfargument name="PersonID" type="string" required="yes">
        
        <cfquery name="qReportDataPre" datasource="#Application.Settings.DSN#">
            SELECT 	a.MDFlag,
            		a.CheckIn,
                    act.StartDate AS CertificateDate,
                    act.EndDate,
                    act.ActivityID,
                    act.Title AS ActivityTitle, 
                    act.ActivityTypeID,
                    act.Location AS ActivityLocation, 
                    act.Sponsorship,
                    act.Sponsor,
                    act.City,
                    (SELECT s.Code
                     FROM pd_State s
                     WHERE s.StateID = act.State) AS State,
                    a.AttendeeID,
                    p.FirstName, 
                    p.LastName,
                    p.DisplayDegree,
                    ac.Amount AS TotalAmount,
                    (SELECT TOP 1 attc.Amount
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 1)) AS CreditAmount,
                    (SELECT TOP 1 attc.ReferenceNo
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 1)) AS ReferenceNumber,
                    sc.Name AS CreditName
            FROM ce_Attendee a
            INNER JOIN pd_Person p ON p.PersonID = a.PersonID
            INNER JOIN ce_Activity_Credit ac ON ac.ActivityID = a.ActivityID
            INNER JOIN ce_Sys_Credit sc ON sc.CreditID = ac.CreditID
            INNER JOIN ce_Activity act ON act.ActivityID = a.ActivityID
            WHERE 
                a.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND
                a.DeletedFlag <> <cfqueryparam value="Y" cfsqltype="cf_sql_char" /> AND 
                a.ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
                sc.Name = <cfqueryparam value="CME" cfsqltype="cf_sql_varchar" /> AND
                act.DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />
        </cfquery>
        
        <!--- DEFINE NEW QUERY --->
        <cfset qReportData = QueryNew("CertificateDate,EndDate,ActivityID,ActivityTitle,ActivityLocation,ActivityTypeID,City,State,AttendeeID,FirstName,LastName,DisplayDegree,TotalAmount,CreditAmount,ReferenceNumber,CreditName,AwardStatement,SponsorshipStatement")>
        
		<cfset ActStartDate = DateFormat(qReportDataPre.CertificateDate,"MMMM D, YYYY")>
        <cfset ActEndDate = DateFormat(qReportDataPre.EndDate,"MMMM D, YYYY")>
        
        <!--- ADD NEW ROW --->
        <cfset QueryAddRow(qReportData,1)>
        
        <!--- BUILD NEW QUERY --->
        <cfif qReportDataPre.ActivityTypeID EQ 2>
        	<cfset QuerySetCell(qReportData, "CertificateDate", DateFormat(qReportDataPre.CheckIn, "MMMM D, YYYY"))>
        <cfelse>
			<cfif qReportDataPre.CertificateDate EQ qReportDataPre.EndDate>
                <cfset QuerySetCell(qReportData, "CertificateDate", ActStartDate)>
            <cfelse>
                <cfset QuerySetCell(qReportData, "CertificateDate", ActStartDate & " - " & ActEndDate)>
            </cfif>
        </cfif>
        <cfset QuerySetCell(qReportData, "EndDate", qReportDataPre.EndDate)>
        <cfset QuerySetCell(qReportData, "ActivityID", qReportDataPre.ActivityID)>
        <cfset QuerySetCell(qReportData, "ActivityTitle", qReportDataPre.ActivityTitle)>
        <cfset QuerySetCell(qReportData, "ActivityLocation", qReportDataPre.ActivityLocation)>
        <cfset QuerySetCell(qReportData, "ActivityTypeID", qReportDataPre.ActivityTypeID)>
        <cfset QuerySetCell(qReportData, "City", qReportDataPre.City)>
        <cfset QuerySetCell(qReportData, "State", qReportDataPre.State)>
        <cfset QuerySetCell(qReportData, "AttendeeID", qReportDataPre.AttendeeID)>
        <cfset QuerySetCell(qReportData, "FirstName", qReportDataPre.FirstName)>
        <cfset QuerySetCell(qReportData, "LastName", qReportDataPre.LastName)>
        <cfif Len(qReportDataPre.DisplayDegree) LTE 0>
            <cfset QuerySetCell(qReportData, "displayDegree", "")>
        <cfelseif Left(qReportDataPre.DisplayDegree,1) EQ ",">
            <cfset QuerySetCell(qReportData, "displayDegree", qReportDataPre.DisplayDegree)>
        <cfelse>
            <cfset QuerySetCell(qReportData, "displayDegree", ", " & qReportDataPre.DisplayDegree)>
        </cfif>
        <cfset QuerySetCell(qReportData, "TotalAmount", qReportDataPre.TotalAmount)>
        <cfset QuerySetCell(qReportData, "CreditAmount", qReportDataPre.CreditAmount)>
        <cfset QuerySetCell(qReportData, "ReferenceNumber", qReportDataPre.ReferenceNumber)>
        <cfset QuerySetCell(qReportData, "CreditName", qReportDataPre.CreditName)>
        <!--- SET AWARDSTATEMENT --->
        <cfif qReportDataPre.MDFlag EQ "Y">
            <cfif qReportDataPre.CreditAmount NEQ "">
                <cfset QuerySetCell(qReportData, "AwardStatement", "and is awarded " & qReportDataPre.CreditAmount & " Category 1 Credit(s) toward the Physician's Recognition Award")>
            <cfelse>
                <cfset QuerySetCell(qReportData, "AwardStatement", "and is awarded " & qReportDataPre.TotalAmount & " Category 1 Credit(s) toward the Physician's Recognition Award")>
            </cfif>
        <cfelse>
            <cfif qReportDataPre.CreditAmount NEQ "">
                <cfset QuerySetCell(qReportData, "AwardStatement", "The activity was designated for " & qReportDataPre.CreditAmount & " AMA PRA Category 1 Credit(s)™")>
            <cfelse>
                <cfset QuerySetCell(qReportData, "AwardStatement", "The activity was designated for " & qReportDataPre.TotalAmount & " AMA PRA Category 1 Credit(s)™")>
            </cfif>
        </cfif>
        
        <!--- SET SPONSORSHIPSTATEMENT --->
        <cfif qReportDataPre.Sponsorship EQ "J">
            <!--- JOINTLY --->
            <cfset QuerySetCell(qReportData, "SponsorshipStatement", "This activity has been jointly sponsored by the University of Cincinnati Office of Continuing Medical Education and " & qReportDataPre.Sponsor & ".")>
        <cfelse>
            <!--- DIRECT --->
            <cfset QuerySetCell(qReportData, "SponsorshipStatement", "Sponsored by the University of Cincinnati Office of Continuing Medical Education.")>
        </cfif>

		<cfreturn qReportData />
	</cffunction>
    
    <cffunction name="getCNEData" access="remote" output="false" returntype="query">
    	<cfargument name="ActivityID" required="true" type="string" />
    	<cfargument name="PersonID" required="true" type="string" />
        
        <cfquery name="qReportData" datasource="#Application.Settings.DSN#">
            SELECT 	act.ReleaseDate AS CertificateDate,
                    act.Title AS ActivityTitle, 
                    act.Location AS ActivityLocation, 
                    p.FirstName, 
                    p.LastName,
                    p.DisplayDegree,
                    ac.Amount AS TotalAmount,
                    sc.Name AS CreditName,
                    (SELECT TOP 1 attc.Amount
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 2)) AS CreditAmount,
                    (SELECT TOP 1 attc.ReferenceNo
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 2)) AS ReferenceNumber,
                    (SELECT TOP 1 p1.FirstName
                     FROM ce_Activity_Faculty af
                     INNER JOIN pd_Person p1 ON p1.PersonID = af.PersonID
                     WHERE af.DeletedFlag = 'N') AS FacultyFName,
                    (SELECT TOP 1 p1.LastName
                     FROM ce_Activity_Faculty af
                     INNER JOIN pd_Person p1 ON p1.PersonID = af.PersonID
                     WHERE af.DeletedFlag = 'N') AS FacultyLName
            FROM ce_Attendee a
            INNER JOIN pd_Person p ON p.PersonID = a.PersonID
            INNER JOIN ce_Activity_Credit ac ON ac.ActivityID = a.ActivityID
            INNER JOIN ce_Sys_Credit sc ON sc.CreditID = ac.CreditID
            LEFT OUTER JOIN ce_Activity act ON act.ActivityID = a.ActivityID
            WHERE 
                a.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND
                a.ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
                sc.Name = <cfqueryparam value="CNE" cfsqltype="cf_sql_varchar" /> AND
                act.DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" /> 
        </cfquery>
        
        <cfreturn qReportData />
    </cffunction>
    
    <cffunction name="getCertificateType" access="remote" output="false" returntype="string">
    	<cfargument name="ActivityID" type="string" default="" />
    	<cfargument name="PersonID" type="string" default="" />
        
        <cfset var AttendeeCreditType = "">
        <cfset var AttendeeCertificateType = "">
        <cfset var CMEActivityCreditFlag = "N">
        
        <!--- FIND OUT WHAT TYPE OF CREDIT THE ACTIVITY OFFERS --->
        <cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=Arguments.ActivityID,DeletedFlag="N")>
        
        <!--- FIND OUT WHAT DEGREE PREFERENCE THE ATTENDEE HAS --->
        <cfset qAttendeeDegree = Application.Com.PersonDegreeGateway.getByViewAttributes(PersonID=Arguments.PersonID,DeletedFlag="N")>
        
        <!--- CHECK IF ATTENDEE HAS SELECTED A DEGREE --->
        <cfif qAttendeeDegree.RecordCount NEQ 0>
            <!--- CHECK WHICH TYPE OF CREDIT GOES WITH THEIR DEGREE --->
            <cfif qAttendeeDegree.DegreeName EQ "MD" OR qAttendeeDegree.Degreename EQ "DO">
                <cfset AttendeeCreditType = "CME">
            <cfelseif qAttendeeDegree.DegreeName EQ "RN">
                <cfset AttendeeCreditType = "CNE">
            <cfelseif qAttendeeDegree.DegreeName EQ "PharmD">
                <cfset AttendeeCreditType = "CPE">
            </cfif>
        </cfif>
        
        <!--- DETERMINE IF ACTIVITY HAS CREDIT OFFERED FOR THEIR DEGREE --->
        <cfloop query="qActivityCredits">
            <!--- SET CMEActivityCreditFlag VAR TO DETERMINE IF Non-Physician CME CREDIT IS AVAILABLE FOR THOSE WHO NEED IT --->
            <cfif qActivityCredits.CreditName EQ "CME">
                <cfset CMEActivityCreditFlag = "Y">
            </cfif>
            
            <!--- SET AttendeeCertificateType TO THE APPROPRIATE TYPE OF CREDIT OFFERED FOR THE ACTIVITY --->
            <cfif AttendeeCreditType EQ qActivityCredits.CreditName AND AttendeeCertificateType EQ "">
                <cfset AttendeeCertificateType = qActivityCredits.CreditName>
            </cfif>
        </cfloop>
        
        <!--- IF THE ACTIVITY DOESNT OFFER THEIR CREDIT AND CMEActivityCreditFlag EQ Y THE OFFER THEM Non-Physician CME CREDIT --->
        <cfif AttendeeCertificateType EQ "" AND CMEActivityCreditFlag EQ "Y">
            <cfset AttendeeCertificateType = "CME">
        <cfelseif AttendeeCertificateType EQ "" AND CMEActivityCreditFlag EQ "N">
            <cfset AttendeeCertificateType = "NONE">
        </cfif>
        
        <cfreturn AttendeeCertificateType />
    </cffunction>
 </cfcomponent>