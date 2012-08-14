<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset filters(through="loginRequired") />
		<cfset filters(through="adminRequired") />
		<cfset super.init() />
	</cffunction>
	
	<cffunction name="index">
		<cfset requests = model("credit_request").findAllByActivityid(value=params.activityId,order="name") />
		
		<cfset credit_requests = queryToStruct(requests) />
		<cfset $setActivity() />
		<cfset subLayout("adm_activity") />
	</cffunction>
	
	<cffunction name="new">
		<cfparams name="params.credit_request">

		<cfset returnVar = createObject("component","lib.buildStruct").init(status=false,statusMsg="failed") />

		<cfset credit_request = model("credit_request").new() />

		<cfif credit_request.save(validate=false)>
			<cfset returnVar.setStatus(true) />
			<cfset returnVar.setStatusMsg("Success")
			<cfset returnVar.setPayload(credit_request.properties())
		</cfif>
		<cfcontent type="text/javascript" />
		<cfset renderText(returnVar.getJson()) />
	</cffunction>
</cfcomponent>
