<cfcomponent extends="Controller">

	<cffunction name="index">
		<cfset activityTypes = model("sysActivityType").findAll()>
        <cfset activityCategories = model("activityCategory").findAll()>
        <cfset activityGroupings = model("sysGrouping").findAll()>
		
		<cfset activities = model("activity").findAll(limit=100) />
	</cffunction>
	
</cfcomponent>



