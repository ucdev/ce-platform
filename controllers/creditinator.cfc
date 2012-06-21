<cfcomponent extends="Controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="init">
		<cfset filters(through="loginRequired",except="start") />
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

</cfcomponent>

