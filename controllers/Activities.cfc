<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset activityTypes = model("sysActivityType").findAll(maxRows=5)>
        <cfset activityCategories = model("activityCategory").findAll(maxRows=5)>
        <cfset activityGroupings = model("sysGrouping").findAll(maxRows=5)>
		<cfset activities = model("activity").findAll(maxRows=100) />
	</cffunction>
	
	<cffunction name="edit">
		<cfset activity = model("activity").findByKey(params.key) />
	</cffunction>
	
	<cffunction name="show">
		<cfset activity = model("activity").findByKey(params.key) />
	</cffunction>
</cfcomponent>