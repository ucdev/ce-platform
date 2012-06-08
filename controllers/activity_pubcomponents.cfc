<cfcomponent extends="Controller" output="false">
	
	<!--- activity_pubcomponents/index --->
	<cffunction name="index">
		<cfset activity_pubcomponents = model("Activity_pubcomponent").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_pubcomponents/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_pubcomponent = model("Activity_pubcomponent").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_pubcomponent)>
	        <cfset flashInsert(error="Activity_pubcomponent #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_pubcomponents/new --->
	<cffunction name="new">
		<cfset activity_pubcomponent = model("Activity_pubcomponent").new()>
	</cffunction>
	
	<!--- activity_pubcomponents/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_pubcomponent = model("Activity_pubcomponent").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_pubcomponent)>
	        <cfset flashInsert(error="Activity_pubcomponent #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_pubcomponents/create --->
	<cffunction name="create">
		<cfset activity_pubcomponent = model("Activity_pubcomponent").new(params.activity_pubcomponent)>
		
		<!--- Verify that the activity_pubcomponent creates successfully --->
		<cfif activity_pubcomponent.save()>
			<cfset flashInsert(success="The activity_pubcomponent was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_pubcomponent.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_pubcomponents/update --->
	<cffunction name="update">
		<cfset activity_pubcomponent = model("Activity_pubcomponent").findByKey(params.key)>
		
		<!--- Verify that the activity_pubcomponent updates successfully --->
		<cfif activity_pubcomponent.update(params.activity_pubcomponent)>
			<cfset flashInsert(success="The activity_pubcomponent was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_pubcomponent.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_pubcomponents/delete/key --->
	<cffunction name="delete">
		<cfset activity_pubcomponent = model("Activity_pubcomponent").findByKey(params.key)>
		
		<!--- Verify that the activity_pubcomponent deletes successfully --->
		<cfif activity_pubcomponent.delete()>
			<cfset flashInsert(success="The activity_pubcomponent was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_pubcomponent.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
