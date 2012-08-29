<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset filters(through="loginRequired") />
		<cfset filters(through="adminRequired") />
		<cfset super.init() />
	</cffunction>
	
	
	<!--- activity_applications/index --->
	<cffunction name="index">
		<cfset activity_applications = model("Activity_application").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_applications/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_application = model("Activity_application").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_application)>
	        <cfset flashInsert(error="Activity_application #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_applications/new --->
	<cffunction name="new">
		<cfset activity_application = model("Activity_application").new()>
	</cffunction>
	
	<!--- activity_applications/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_application = model("Activity_application").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_application)>
	        <cfset flashInsert(error="Activity_application #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_applications/create --->
	<cffunction name="create">
		<cfset activity_application = model("Activity_application").new(params.activity_application)>
		
		<!--- Verify that the activity_application creates successfully --->
		<cfif activity_application.save()>
			<cfset flashInsert(success="The activity_application was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_application.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_applications/update --->
	<cffunction name="update">
		<cfset activity_application = model("Activity_application").findByKey(params.key)>
		
		<!--- Verify that the activity_application updates successfully --->
		<cfif activity_application.update(params.activity_application)>
			<cfset flashInsert(success="The activity_application was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_application.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_applications/delete/key --->
	<cffunction name="delete">
		<cfset activity_application = model("Activity_application").findByKey(params.key)>
		
		<!--- Verify that the activity_application deletes successfully --->
		<cfif activity_application.delete()>
			<cfset flashInsert(success="The activity_application was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_application.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
