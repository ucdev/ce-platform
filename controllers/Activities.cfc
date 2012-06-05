<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset activityTypes = model("sysActivityType").findAll(maxRows=5)>
        <cfset activityCategories = model("activityCategory").findAll(maxRows=5)>
        <cfset activityGroupings = model("sysGrouping").findAll(maxRows=5)>
		<cfset activities = model("activity").findAll(maxRows=100) />
	</cffunction>
	
	<cffunction name="edit">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="show">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('show') />
	</cffunction>
</cfcomponent>