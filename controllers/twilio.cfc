<cfcomponent extends="Controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="init">
		<cfset super.init() />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="receivesms"  output="no">
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
		
		<!--- LOOKUP ACTIVITY --->
		<cfset activity = model("activity").findOneByCode(trim(twilio.body)) />
		
		<cfif isObject(activity)>
			<cfset credit_request.activityId = activity.id />
		</cfif>
		
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
		<cfset credit_request.createdAt=now() />
		<cfset credit_request.save() />
		<cfscript>renderText($renderLayout($layout='/twilio/layout',$type='template',$content=$renderPage($template="",$controller=params.controller,$action=params.action,$layout=false)))</cfscript>
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="receivercall">
		
	</cffunction>
</cfcomponent>

