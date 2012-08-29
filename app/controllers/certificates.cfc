<cfcomponent extends="Controller" output="false">
	
	<!--- certificates/index --->
	<cffunction name="index">
		<cfset certificates = model("Certificate").findAll()>
	</cffunction>
	
	<!--- certificates/show/key --->
	<cffunction name="show">
		
		<!--- Find the record 
    	<cfset certificate = model("Certificate").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(certificate)>
	        <cfset flashInsert(error="Certificate #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>--->
		<cfset renderPage(layout="templates\uc-md") />
	</cffunction>
	
	<!--- certificates/new --->
	<cffunction name="new">
		<cfset certificate = model("Certificate").new()>
	</cffunction>
	
	<!--- certificates/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset certificate = model("Certificate").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(certificate)>
	        <cfset flashInsert(error="Certificate #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- certificates/create --->
	<cffunction name="create">
		<cfset certificate = model("Certificate").new(params.certificate)>
		
		<!--- Verify that the certificate creates successfully --->
		<cfif certificate.save()>
			<cfset flashInsert(success="The certificate was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the certificate.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- certificates/update --->
	<cffunction name="update">
		<cfset certificate = model("Certificate").findByKey(params.key)>
		
		<!--- Verify that the certificate updates successfully --->
		<cfif certificate.update(params.certificate)>
			<cfset flashInsert(success="The certificate was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the certificate.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- certificates/delete/key --->
	<cffunction name="delete">
		<cfset certificate = model("Certificate").findByKey(params.key)>
		
		<!--- Verify that the certificate deletes successfully --->
		<cfif certificate.delete()>
			<cfset flashInsert(success="The certificate was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the certificate.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
	<cffunction name="generate">
		<cfparam name="htmlcontent" type="string" default="" />
		
		<cfquery name="qcerts" datasource="#application.settings.dsn#">
			SELECT 	
				TOP 10
				a.MDFlag,
				a.CheckIn,
				a.CompleteDate,
				act.StartDate AS activityStart,
				act.EndDate AS activityEnd,
				act.ActivityID,
				act.Title AS ActivityTitle,
				act.ActivityTypeID, 
				act.Location AS ActivityLocation, 
				act.Sponsorship,
				act.Sponsor,
				act.City,
				s.Name AS State,
				a.AttendeeID,
				p.CertName AS AttendeeName
				,ac.Amount AS ActivityCredit,
				(SELECT TOP 1 attc.Amount
				FROM ceschema.ce_AttendeeCredit attc
				WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 1)) AS AttendeeCredit,
				(SELECT TOP 1 attc.ReferenceNo
				FROM ceschema.ce_AttendeeCredit attc
				WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = 1)) AS ReferenceNumber,
				sc.Name AS CreditType
			FROM ceschema.ce_Attendee a
			INNER JOIN ceschema.ce_Person p ON p.PersonID = a.PersonID
			INNER JOIN ceschema.ce_Activity_Credit ac ON ac.ActivityID = a.ActivityID
			INNER JOIN ceschema.ce_Sys_Credit sc ON sc.CreditID = ac.CreditID
			INNER JOIN ceschema.ce_Activity act ON act.ActivityID = a.ActivityID
			LEFT JOIN ceschema.ce_Sys_state s ON s.StateId = act.State
			WHERE 
			a.ActivityID = <cfqueryparam value="#params.key#" cfsqltype="cf_sql_integer" /> AND a.statusId = 1
		</cfquery>
		
		<cfdocument
			format="PDF"
			pagetype="letter"
			margintop="0"
			orientation="landscape"
			marginbottom="0"
			marginright="0"
			marginleft="0"
			unit="in"
			fontembed="true"
			backgroundvisible="true"
			localurl="true">
			
			<cfloop query="qcerts">
			
			<cfdocumentsection>
			<cfoutput>#RenderHTML(querytostruct(qcerts,qcerts.currentrow),params.htmlcontent)#</cfoutput>
			</cfdocumentsection>
			</cfloop>
		</cfdocument>
	</cffunction>
	
	<cffunction name="preview">
		<cfargument name="htmlcontent" type="string" required="yes">
		
		<cfset var previewStruct = structNew()>
		<cfset previewStruct = { completeDate = '3/20/2010',
				activityStart = '1/1/2010',
				activityEnd = '12/31/2010',
				activityTitle = 'This is an example activity title',
				activityLocation = 'Cincinnati, OH', 
				activitySponsorship = 'jointly',
				activitySponsor = 'The Sponsor Group',
				activityCity = 'Cincinnati',
				activityState = 'Ohio',
				attendeeId = '169841',
				attendeeName = 'John C. Tester, MD',
				activityCredit = '1.0',
				attendeeCredit = '1.0',
				accreditedRefNumber = 'FJDK923923',
				creditType = 'CME'
		}>
		
		<cfdocument
			format="PDF"
			pagetype="letter"
			margintop="0"
			orientation="landscape"
			marginbottom="0"
			marginright="0"
			marginleft="0"
			unit="in"
			fontembed="true"
			backgroundvisible="true"
			localurl="true">
			
			
			<cfdocumentsection>
			<cfoutput>#RenderHTML(previewStruct,arguments.htmlcontent)#</cfoutput>
			</cfdocumentsection>
		</cfdocument>
	</cffunction>
	
	<cffunction name="design">
		<cfargument name="htmlcontent" type="string" required="yes" />
		
		<cfset var previewStruct = structNew()>
		<cfset previewStruct = { completeDate = '3/20/2010',
				activityStart = '1/1/2010',
				activityEnd = '12/31/2010',
				activityTitle = 'This is an example activity title',
				activityLocation = 'Cincinnati, OH', 
				activitySponsorship = 'jointly',
				activitySponsor = 'The Sponsor Group',
				activityCity = 'Cincinnati',
				activityState = 'Ohio',
				attendeeId = '169841',
				attendeeName = 'John C. Tester, MD',
				activityCredit = '1.0',
				attendeeCredit = '1.0',
				accreditedRefNumber = 'FJDK923923',
				creditType = 'CME'
		}>
		
		<cfoutput>#RenderHTML(previewStruct,arguments.htmlcontent)#</cfoutput>
	</cffunction>
	
	<cffunction name="RenderHTML" output="no" access="public">
		<cfargument name="QueryRow" type="struct" required="yes" />
		<cfargument name="htmltmpl" type="string" required="yes" />
		
		<cfset var htmlTemplate = arguments.htmltmpl>
		<cfset var returnHtml = "" />
		<cfset var aFoundFields = REMatchNoCase("{[A-Za-z]+}",htmlTemplate)>
		<cfset var Output = "">
		
		<cfloop from="1" to="#ArrayLen(aFoundFields)#" index="i">
			<cfset VarName = Trim(ReplaceNoCase(aFoundFields[i],"}","","ALL"))>
			<cfset VarName = Trim(ReplaceNoCase(VarName,"{","","ALL"))>
			
			<cfif isDate(Evaluate("QueryRow.#VarName#"))>
				<cfset "QueryRow.#VarName#" = DateFormat(Evaluate("QueryRow.#VarName#"),'mm/dd/yyyy') />
			</cfif>
			
			<!--- SPECIAL CASES --->
			<cfif isDefined("QueryRow.#VarName#")>
				<cfset htmlTemplate = ReplaceNoCase(htmlTemplate,VarName,Evaluate("QueryRow.#VarName#"),"ALL")>
			</cfif>
			
			<!---<cfset VarName = Trim(Replace(aFoundFields[i],"%","","ALL"))>--->
		</cfloop>
		<cfoutput>
		<cfsavecontent variable="returnHtml">
			<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html>
				<head>
					<style type="text/css">
					@import('/admin/_styles/cert_pdf.css');
					</style>
				</head>
				<body style="background-image: url(certificate.jpg)">
					#htmlTemplate#
				</body>
			</html>
		</cfsavecontent>
		</cfoutput>
		
		<cfset returnHtml = replace(returnHtml,'{','','ALL')>
		<cfset returnHtml = replace(returnHtml,'}','','ALL')>
		
		<cfreturn returnHtml />
	</cffunction>
	
</cfcomponent>
