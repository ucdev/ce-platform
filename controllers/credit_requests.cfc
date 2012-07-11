<cfcomponent extends="Controller" output="false">
	
	<!--- certificates/index --->
	<cffunction name="index">
		<cfset requests = model("credit_request").findAllByActivityid(value=params.activityId,order="name") />
		<cfset $setActivity() />
		<cfset subLayout("adm_activity") />
	</cffunction>
	
</cfcomponent>
