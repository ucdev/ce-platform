<cfcomponent extends="Controller">
	<cffunction name="index">
		<cfset activityTypes = model("sysActivityType").findAll(maxRows=5)>
        <cfset activityCategories = model("Category").findAll(order="name")>
        <cfset activityGroupings = model("sysGrouping").findAll(maxRows=5)>
		<cfset activities = model("activity").findAll(maxRows=100) />
		
		<cfset pageTitle("Activities") />
		<cfset pageSubTitle("Browse or search activities.") />
		
		<cfif isLoggedin()>
			<cfset subLayout("user") />
		<cfelse>
			<cfset subLayout("guest") />
		</cfif>
	</cffunction>
	
	<cffunction name="edit">
		<cfparam name="params.key" type="integer" />
        
		<cfset activity = model("activity").findByKey(key=params.key) />
        
        <cfif NOT isObject(activity)>
	        <cfset flashInsert(error="Activity #params.key# was not found")>
			<cfset redirectTo(action="index")>
        </cfif>
        
		<cfset activityTypes = model("sysActivityType").findAll(maxRows=5)>
        <cfset activityCategories = model("Category").findAll(order="name")>
        <cfset activityGroupings = model("sysGrouping").findAll(maxRows=5)>
        
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_credit">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_participants">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_faculty">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_committee">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_finances">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_documents">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_other">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_publish">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_reports">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_history">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_notes">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_accme">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_cdc">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_agenda">
		<cfparam name="params.key" type="integer" />
		<cfset activity = model("activity").findByKey(params.key) />
		<cfset pageTitle("#activity.title#") />
		<cfset subLayout('edit') />
	</cffunction>
	
	<cffunction name="edit_app">
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
	
	<cffunction name="show">
		<cfset activity = model("activity").findByKey(key=params.key, include="activityType,grouping, status", returnAs="query") />
	</cffunction>
</cfcomponent>