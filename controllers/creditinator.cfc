<cfcomponent extends="Controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="init">
		<cfset filters(through="loginRequired",except="start") />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="start">
		<cfset SMTPAPI = {
			"category": "credit_email",
			"unique_args" = {"user_id": "12345", "eventID": "6789"}
		} />
		<cfmail to="rountrjf@ucmail.uc.edu" from="notif@uc.edu" subject="TESTING SMTP">
			<cfmailparam name="X-SMTPAPI" value="#serializeJson(SMTPAPI)#" />
			TESTING THIS OUT
		</cfmail>
		<cfset renderPage(layout="layout") />
	</cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="checkCode">
		<cfset model("activity").findByCode(params.key) />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

</cfcomponent>

