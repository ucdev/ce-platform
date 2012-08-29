<cfcomponent extends="Controller">
	
	<cffunction name="init">
		<cfset filters(through="loginRequired") />
		<cfset filters(through="adminRequired") />
		<cfset super.init() />
	</cffunction>
	
	<cffunction name="index">
		<!---<cfset activityTypes = model("sysActivityType").findAll(maxRows=5)>
        <cfset activityCategories = model("Category").findAll(order="name")>
        <cfset activityGroupings = model("sysGrouping").findAll(maxRows=5)>
		<cfset activities = model("activity").findAll(maxRows=100) />
		
		<cfset pageTitle("Activities") />
		<cfset pageSubTitle("Browse or search activities.") />
		
		<cfif isLoggedin()>
			<cfset subLayout("user") />
		<cfelse>
			<cfset subLayout("guest") />
		</cfif>--->
	</cffunction>

</cfcomponent>