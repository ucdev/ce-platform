<cfcomponent extends="Controller" output="false">
	
	<!--- activity_categories/index --->
	<cffunction name="index">
		<cfset activity_categories = model("Activity_category").findAll()>
	</cffunction>
	
	<!--- activity_categories/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_category = model("Activity_category").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_category)>
	        <cfset flashInsert(error="Activity_category #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_categories/new --->
	<cffunction name="new">
		<cfset activity_category = model("Activity_category").new()>
	</cffunction>
	
	<!--- activity_categories/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_category = model("Activity_category").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_category)>
	        <cfset flashInsert(error="Activity_category #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_categories/create --->
	<cffunction name="create">
		<cfset activity_category = model("Activity_category").new(params.activity_category)>
		
		<!--- Verify that the activity_category creates successfully --->
		<cfif activity_category.save()>
			<cfset flashInsert(success="The activity_category was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_category.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_categories/update --->
	<cffunction name="update">
		<cfset activity_category = model("Activity_category").findByKey(params.key)>
		
		<!--- Verify that the activity_category updates successfully --->
		<cfif activity_category.update(params.activity_category)>
			<cfset flashInsert(success="The activity_category was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_category.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_categories/delete/key --->
	<cffunction name="delete">
		<cfset activity_category = model("Activity_category").findByKey(params.key)>
		
		<!--- Verify that the activity_category deletes successfully --->
		<cfif activity_category.delete()>
			<cfset flashInsert(success="The activity_category was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_category.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
