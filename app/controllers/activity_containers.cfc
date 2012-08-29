<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset filters(through="loginRequired") />
		<cfset filters(through="adminRequired") />
		<cfset super.init() />
	</cffunction>
	
	
	<!--- activity_containers/index --->
	<cffunction name="index">
		<cfset activity_containers = model("Activity_container").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_containers/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset Activity_container = model("Activity_container").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(Activity_container)>
	        <cfset flashInsert(error="Activity_container #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_containers/new --->
	<cffunction name="new">
		<cfset Activity_container = model("Activity_container").new()>
	</cffunction>
	
	<!--- activity_containers/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset Activity_container = model("Activity_container").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(Activity_container)>
	        <cfset flashInsert(error="Activity_container #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_containers/create --->
	<cffunction name="create">
		<cfset Activity_container = model("Activity_container").new(params.Activity_container)>
		
		<!--- Verify that the Activity_container creates successfully --->
		<cfif Activity_container.save()>
			<cfset flashInsert(success="The Activity_container was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the Activity_container.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_containers/update --->
	<cffunction name="update">
		<cfset Activity_container = model("Activity_container").findByKey(params.key)>
		
		<!--- Verify that the Activity_container updates successfully --->
		<cfif Activity_container.update(params.Activity_container)>
			<cfset flashInsert(success="The Activity_container was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the Activity_container.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_containers/delete/key --->
	<cffunction name="delete">
		<cfset Activity_container = model("Activity_container").findByKey(params.key)>
		
		<!--- Verify that the Activity_container deletes successfully --->
		<cfif Activity_container.delete()>
			<cfset flashInsert(success="The Activity_container was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the Activity_container.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
