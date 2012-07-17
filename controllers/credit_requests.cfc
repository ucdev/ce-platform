<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset filters(through="loginRequired") />
		<cfset filters(through="adminRequired") />
		<cfset super.init() />
	</cffunction>
	<!--- certificates/index --->
	<cffunction name="index">
		<cfset requests = model("credit_request").findAllByActivityid(value=params.activityId,order="name") />
		<cfset $setActivity() />
		<cfset subLayout("adm_activity") />
	</cffunction>
	
</cfcomponent>
