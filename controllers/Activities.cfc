<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset activityTypes = model("sysActivityType").findAll(maxRows=5)>
        <cfset activityCategories = model("Category").findAll(order="name")>
        <cfset activityGroupings = model("sysGrouping").findAll(maxRows=5)>
		<cfset activities = model("activity").findAll(maxRows=100) />
	</cffunction>
	
	<cffunction name="edit">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_credits">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="show">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset subLayout('show') />
	</cffunction>
	
	<cffunction name="show">
		<cfset activity = model("activity").findByKey(key=params.key, include="activityType,grouping, status", returnAs="query") />
	</cffunction>
</cfcomponent>