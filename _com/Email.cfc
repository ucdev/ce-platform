<cfcomponent displayname="Email">
	<cffunction name="init" access="public" output="no" returntype="_com.Email">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="Send" output="true" returntype="string">
		<cfargument name="FromPersonID" type="string" required="no" default="" />
		<cfargument name="FromActivityID" type="string" required="no" default="" />
		<cfargument name="ToPersonID" type="string" required="no" default="" />
		<cfargument name="ToActivityID" type="string" required="no" default="" />
		<cfargument name="ToAttendeeID" type="string" required="no" default="" />
		<cfargument name="ToCreditID" type="string" required="no" default="" />
		<cfargument name="ToContainerID" type="string" required="no" default="" />
		<cfargument name="ToEmailID" type="string" required="no" default="" />
		<cfargument name="ToHistoryID" type="string" required="no" default="" />
		<cfargument name="ToContent" type="string" required="no" default="" />
		<cfargument name="FromEmail" type="string" required="no" default="" />
		<cfargument name="EmailStyleID" type="string" required="yes" />
		<cfargument name="EmailType" type="string" required="no" default="HTML" />
		<cfargument name="MessageText" type="string" required="no" default="" />
        <cfargument name="toEmailAddress" type="string" required="no" default="" />
		<cfargument name="customBodyHTML" type="string" required="no" default="" />
		<cfargument name="customBodyTEXT" type="string" required="no" default="" />

		<cfset var FromPerson = StructNew()>
		<cfset var FromActivity = StructNew()>
		<cfset var ToPerson = "">
		<cfset var ToActivity = "">
		<cfset var ToAttendee = "">
		<cfset var ToAttendeeCredit = "">
		<cfset var ToCredit = "">
		<cfset var ToContainer = "">
		<cfset var ToEmail = "">
		<cfset var ToHistory = "">
		<cfset var EmailStyle = "">
		<cfset var aFoundFields = "">
		<cfset var EmailBody = "">
        <cfif len(trim(arguments.fromEmail)) GT 0>
        	<cfset fromEmail = arguments.fromEmail>
        <cfelse>
			<cfset FromEmail = "CCPD <notifications@ccpd.uc.edu>">
        </cfif>
		<cfset EmailStyle = Application.Com.EmailStyleGateway.getByAttributes(EmailStyleID=Arguments.EmailStyleID)>
		<cfset EmailSubject = EmailStyle.Subject>
		<cfset EmailBody = EmailStyle.TemplateHTML>
		<cfset EmailBodyText = EmailStyle.TemplatePlain>
        
		<cfset customBodyHTML = arguments.customBodyHTML />
		<cfset customBodyTEXT = arguments.customBodyTEXT />
		
		<cfset GeneralMessage = arguments.messageText />
		<cfset TodaysDate = DateFormat(now(),'mm/dd/yyyy') />
		
		<cfset aSubjectFields = REMatchNoCase("%[A-Z_\.a-z]+%",EmailSubject)>
		<cfset aFoundFields = REMatchNoCase("%[A-Z_\.a-z]+%",EmailBody)>
        
		<cfif Arguments.FromPersonID GT 0>
			<cfset FromPerson = Application.Com.PersonGateway.getByAttributes(PersonID=Arguments.FromPersonID)>
		</cfif>
		
		<cfif Arguments.FromActivityID GT 0>
			<cfset FromActivity = Application.Com.ActivityGateway.getByAttributes(ActivityID=Arguments.FromActivityID)>
		</cfif>
		
		<cfif Arguments.ToPersonID GT 0>
			<cfset ToPerson = Application.Com.PersonGateway.getByAttributes(PersonID=Arguments.ToPersonID)>
		</cfif>
		
		<cfif len(ToPerson.Email) LTE 0>
			<cfreturn false />
		</cfif>
		
		<cfif Arguments.ToActivityID GT 0>
			<cfset ToActivity = Application.Com.ActivityGateway.getByAttributes(ActivityID=Arguments.ToActivityID)>
		</cfif>
		
		<cfif Arguments.ToCreditID GT 0>
			<cfquery name="ToAttendee" datasource="#application.settings.dsn#">
			SELECT     Attendee.AttendeeID, Credit.CreditID, Credit.Amount, Credit.ReferenceNo, Credit.ExpirationDate, Attendee.ActivityID, Attendee.PersonID, Attendee.StatusID, 
				  Attendee.CheckedInFlag, Attendee.CheckIn, Attendee.CheckedOutFlag, Attendee.CheckOut, Attendee.MDflag, Attendee.TermsFlag, Attendee.PaymentFlag, 
				  Attendee.PayAmount, Attendee.PayOrderNo, Attendee.PaymentDate, Attendee.RegisterDate, CONVERT(nvarchar,Attendee.CompleteDate,101) As CompleteDate, Attendee.TermDate
			FROM         ceschema.ce_Attendee AS Attendee LEFT OUTER JOIN
				  ceschema.ce_AttendeeCredit AS Credit ON Attendee.AttendeeID = Credit.AttendeeID
			WHERE     (Attendee.ActivityID = <cfqueryparam value="#arguments.ToActivityID#" cfsqltype="cf_sql_integer" />) AND (Attendee.PersonID = <cfqueryparam value="#arguments.ToPersonID#" cfsqltype="cf_sql_integer" />) AND (Credit.CreditID = <cfqueryparam value="#arguments.ToCreditID#" cfsqltype="cf_sql_integer" />) AND (Credit.DeletedFlag = 'N')
			</cfquery>
		</cfif>
		
		<cfif Arguments.ToCreditID GT 0>
			<cfset ToCredit = Application.Com.CreditGateway.getByAttributes(ID=Arguments.ToCreditID)>
		</cfif>
		
		<cfif Arguments.ToContainerID GT 0>
			<cfset ToContainer = Application.Com.CategoryGateway.getByAttributes(ContainerID=Arguments.ToContainerID)>
		</cfif>
		
		<cfif Arguments.ToEmailID GT 0>
			<cfset ToEmail = Application.Com.PersonEmailGateway.getByAttributesQuery(email_id=Arguments.ToEmailId)>
		</cfif>
		
		<cfif Arguments.ToHistoryID GT 0>
			<cfset ToHistory = Application.Com.HistoryGateway.getByAttributes(ID=Arguments.ToHistoryID)>
		</cfif>
        
        <cfset Domain = Application.Settings.WebURL>
        <cfset Myself = Request.Myself>
        
		<!--- SUBJECT PARSE --->
		<cfloop from="1" to="#ArrayLen(aSubjectFields)#" index="i">
			<cfset VarName = Trim(Replace(aSubjectFields[i],"%","","ALL"))>
			
			<cfset EmailSubject = Replace(EmailSubject,VarName,Evaluate("#VarName#"),"ALL")>
		</cfloop>
		
		<cfset EmailSubject = Replace(EmailSubject,"%","","ALL")>
		
		<!--- BODY PARSE --->
		<cfloop from="1" to="#ArrayLen(aFoundFields)#" index="i">
			<cfset VarName = Trim(Replace(aFoundFields[i],"%","","ALL"))>
			
			<cfif isDefined("#VarName#")>
				<cfset EmailBody = Replace(EmailBody,VarName,Evaluate("#VarName#"),"ALL")>
			</cfif>
		</cfloop>
		
		<!--- BODY PARSE --->
		<cfloop from="1" to="#ArrayLen(aFoundFields)#" index="i">
			<cfset VarName = Trim(Replace(aFoundFields[i],"%","","ALL"))>
			
			<cfif isDefined("#VarName#")>
				<cfset EmailBodyText = Replace(EmailBodyText,VarName,Evaluate("#VarName#"),"ALL")>
			</cfif>
		</cfloop>
        
        <!--- SET UP THE "TO" EMAIL ADDRESS --->
        <cfif len(trim(arguments.toEmailAddress)) EQ 0>
        	<cfset arguments.toEmailAddress = ToPerson.Email>
        </cfif>
		
		<cfset EmailBody = Replace(EmailBody,"%","","ALL")>
		<cfset EmailBodyText = Replace(EmailBodyText,"%","","ALL")>
        
		<!--- SEND EMAIL --->
		<cfmail to="#arguments.toEmailAddress#" from="#FromEmail#" subject="#EmailSubject#" replyto="do-not-reply@uc.edu" failto="rountrjf@ucmail.uc.edu">
			<cfmailpart type="html">
				<body style="background-color:##f7f7f7;font-family:Arial, Helvetica, sans-serif;font-size:12px;">
				<table cellspacing="0" cellpadding="0" border="0" width="620">
					<tbody>
						<tr>
							<td style="background: none repeat scroll 0% 0% ##333; color: rgb(255, 255, 255); font-weight: bold;font-family:Arial, Helvetica, sans-serif; padding: 4px 8px; vertical-align: middle; font-size: 16px; letter-spacing: -0.03em; text-align: left;"><a target="_blank" href="https://ccpd.uc.edu/" style="color: rgb(255, 255, 255); text-decoration: none;"><span style="color: rgb(255, 255, 255);">CCPD</span></a></td>
							<td style="background: none repeat scroll 0% 0% ##333; color: rgb(255, 255, 255); font-weight: bold;font-family:Arial, Helvetica, sans-serif; padding: 4px 8px; vertical-align: middle; font-size: 11px; text-align: right;"></td>
						</tr>
						<tr>
							<td valign="top" style="background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(59, 89, 152); border-left: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); font-family: Arial, Helvetica, sans-serif; padding: 15px;" colspan="2">
								#EmailBody#
							</td>
						</tr>
						<tr>
							<td style="color: rgb(153, 153, 153); padding: 10px; font-size: 11px; font-family: Arial, Helvetica, sans-serif;" colspan="2">The message was sent to <a target="_blank" href="mailto:#ToPerson.Email#" style="color: ##2769AB; text-decoration: none; font-weight: normal;">#ToPerson.Email#</a>. <br />
								If you don't want to receive these emails from CCPD in the future, you can <a target="_blank" style="color: ##2769AB; text-decoration: none; font-weight: normal;" href="https://ccpd.uc.edu/lms/preferences">unsubscribe</a>. <br />
							<font color="##888888">UC Center for Continuous  Professional Development. P.O. Box 670556, Cincinnati, OH 45267-0556</font></td>
						</tr>
					</tbody>
				</table>
				</body>
			</cfmailpart>
			<cfmailpart type="plain">
			#EmailBodyText#
			
			=======================================
			The message was sent to #ToPerson.Email#. If you don't want to receive these emails from CCPD in the future, please follow the link below to unsubscribe.
			http://ccpd.uc.edu/lms/preferences
			
			UC Center for Continuous Professional Development. P.O. Box 670556, Cincinnati, OH 45267-0556
			</cfmailpart>
			<cfmailpart type="text">
			#EmailBodyText#
			
			=======================================
			The message was sent to #ToPerson.Email#. If you don't want to receive these emails from CCPD in the future, please follow the link below to unsubscribe.
			http://ccpd.uc.edu/lms/preferences
			
			UC Center for Continuous Professional Development. P.O. Box 670556, Cincinnati, OH 45267-0556
			</cfmailpart>
		</cfmail>
		
		<cfif arguments.emailStyleId EQ 5 AND arguments.toAttendeeId GT 0>
			<cflog text="EMAIL SEND ATTEMPT TO Attendee: #arguments.ToAttendeeId# (#ToPerson.Email#)" file="ccpd-attendee-emails" type="information">
			
			<cfquery name="updateEmailSent" datasource="#application.settings.dsn#">
				UPDATE ce_attendee
				SET emailSentFlag=1
				WHERE attendeeId = #arguments.toAttendeeId#
			</cfquery>
		</cfif>
	</cffunction>
	
</cfcomponent>