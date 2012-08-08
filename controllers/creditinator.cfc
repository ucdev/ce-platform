<cfcomponent extends="Controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="init">
		<cfset filters(through="loginRequired",except="start,sms,email") />
		<cfset super.init() />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="start">
		
		<cfset renderPage(layout="layout") />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="mobilesetup">
		
		<cfset renderPage(layout="layout") />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="checkcode">
		<cfset activity = model("activity").findOneByCode(params.key) />
		
		<cfset returnVar = createObject("component","lib.buildStruct").init(status=false,statusmsg="check_failed") />
			
		<cfif isObject(activity)>
			<cfset returnVar.setStatus(true) />
			<cfset returnVar.setStatusMsg("code_found") />
			<cfset returnVar.setPayload(activity.properties()) />
		<cfelse>
			<cfset returnVar.setStatus(false) />
			<cfset returnVar.setStatusMsg("invalid_code") />
		</cfif>
		
		<cfset renderText(returnVar.getJson()) />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	<cffunction name="email"  output="no">
		<cfparam name="params.message" default="" />
		
		<!--- IMAP CONNECTION --->
		<cfset imapCFC = CreateObject("component","lib.imap") />
		<cfset imapInit = imapCFC.Init("ccpdcredit@gmail.com","cfr010408","imap.gmail.com",993,15,1) />
		<cfset emails = imapCFC.list("Inbox") />
		
		<cfif emails.recordCount GT 0>
			<cfloop query="emails">
				<cfset email = model("credit_request_email").new() />
				<cfset email.emailId = emails.id />
				<cfset email.emailDate = emails.date />
				<cfset email.emailFrom = emails.from />
				<cfset email.messagenumber = emails.messagenumber />
				<cfset email.emailReplyTo = emails.replyto />
				<cfset email.emailSubject = emails.subject />
				<cfset email.emailTo = emails.to />
				<cfset email.emailSize = emails.size />
				
				<cfset email.save(validate=false) />
			</cfloop>
		</cfif>
		
		<cfset renderText(emails.recordCount) />
	</cffunction>
	
	<cffunction name="sms"  output="no">
		<cfparam name="params.message" default="" />
		
		<cfset twilio = {
			'number':numberFormat(params.from,'0000000000'),
			'body':params.body,
			'city':params.fromcity,
			'state':params.fromstate,
			'country':params.fromcountry,
			'zip':params.fromzip,
			'messageid':params.SmsMessageSid,
			'accountid':params.accountSid,
			'smsid':params.smsSid,
			'status':params.smsstatus
		} />
		
		<cfset logger = model("twilio_log").new() />

		<cfset logger.type = "sms" />
		<cfset logger.data = serializeJson(params) />
		
		<cfset logger.createdAt=now() />
		<cfset logger.save() />
		
		<cfset credit_request = model("credit_request").new() />
		<cfset credit_request.phone = twilio.number />
		<cfset credit_request.name = twilio.number />
		<cfset credit_request.personId = 0 />
		<cfset credit_request.activityId = 0 />
		<cfset credit_request.attendeeId = 0 />
		<cfset credit_request.email = '' />
		
		<!--- LOOKUP ACTIVITY --->
		<cfset activity = model("activity").findOneByCode(trim(twilio.body)) />
		
		<cfif isObject(activity)>
			<cfset credit_request.activityId = activity.id />
			
			<!--- LOOKUP ACCOUNT --->
			<cfset person = model("person").findByMobile(trim(twilio.number)) />
			
			<cfif isObject(person)>
				<cfset credit_request.personId = person.id />
			<cfelse>
				<!--- LOOKUP PRIOR ATTENDEES --->
				<cfset attendee = model("activity_participant").findByMobile(trim(twilio.number)) />
				
				<cfif isObject(attendee)>
					<cfset credit_request.attendeeid = attendee.id />
				</cfif>
			</cfif>
			
			<cfset credit_request.type='sms' />
			<cfset credit_request.recordHash = HASH('#credit_request.personId#,#credit_request.activityId#,#credit_request.attendeeId#,#credit_request.phone#,#credit_request.email#','MD5') />
			<cfset credit_request.createdAt=now() />
			
			<cfif isEmpty(params.message)>
				<cfif credit_request.save()>
					<!--- IF NO PERSON OR ATTENDEE --->
					<cfif credit_request.activityId GT 0 AND 
						(
							NOT structKeyExists(credit_request,'personId')
							OR 
							credit_request.personId LTE 0
						)
						AND 
						(NOT structKeyExists(credit_request,'attendeeId') OR credit_request.attendeeId LTE 0)>
						<cfset params.message = "We have logged your attendance. We still need to identify you, visit http://ccpd.uc.edu/ to link this mobile number to an account. This is a one time thing." />
					<!--- IF PERSON --->
					<cfelseif structKeyExists(credit_request,'personId') AND credit_request.personId GT 0>
						<cfset params.message = "Thank you, #person.firstname#! We have logged your attendance. Visit http://ccpd.uc.edu/ for certificates and transcripts." />
					<!--- IF PERSON --->
					<cfelseif structKeyExists(credit_request,'attendeeId') AND credit_request.attendeeId GT 0>
						<cfset params.message = "We have logged your attendance. We still need to identify you, visit http://ccpd.uc.edu/ to link this mobile number to an account. This is a one time thing." />
					</cfif>
				<cfelse>
					<cfset params.message = "Invalid request. We have already logged your attendance for this event. If you feel this is incorrect, visit http://ccpd.uc.edu/support" />
				</cfif>
			<cfelse>
				<cfset params.message = params.error />
			</cfif>
		<cfelse>
			<cfset params.message = "Invalid request. The code you provided is invalid." />
		</cfif>
		
		
		<cfscript>renderText($renderLayout($layout=false,$type='template',$content=$renderPage($template="",$controller=params.controller,$action=params.action,$layout=false)))</cfscript>
	</cffunction>
	
	<cffunction name="process_pending"  output="no">
		
	</cffunction>
</cfcomponent>

