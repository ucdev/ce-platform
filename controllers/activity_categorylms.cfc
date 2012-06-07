<cfcomponent extends="Controller" output="false">
	
	<!--- activity_categorylms/index --->
	<cffunction name="index">
		<cfset activity_categorylms = model("Activity_categorylms").findAll()>
	</cffunction>
	
	<!--- activity_categorylms/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_categorylms = model("Activity_categorylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_categorylms)>
	        <cfset flashInsert(error="Activity_categorylms #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_categorylms/new --->
	<cffunction name="new">
		<cfset activity_categorylms = model("Activity_categorylms").new()>
	</cffunction>
	
	<!--- activity_categorylms/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_categorylms = model("Activity_categorylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_categorylms)>
	        <cfset flashInsert(error="Activity_categorylms #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_categorylms/create --->
	<cffunction name="create">
		<cfset activity_categorylms = model("Activity_categorylms").new(params.activity_categorylms)>
		
		<!--- Verify that the activity_categorylms creates successfully --->
		<cfif activity_categorylms.save()>
			<cfset flashInsert(success="The activity_categorylms was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_categorylms.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_categorylms/update --->
	<cffunction name="update">
		<cfset activity_categorylms = model("Activity_categorylms").findByKey(params.key)>
		
		<!--- Verify that the activity_categorylms updates successfully --->
		<cfif activity_categorylms.update(params.activity_categorylms)>
			<cfset flashInsert(success="The activity_categorylms was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_categorylms.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_categorylms/delete/key --->
	<cffunction name="delete">
		<cfset activity_categorylms = model("Activity_categorylms").findByKey(params.key)>
		
		<!--- Verify that the activity_categorylms deletes successfully --->
		<cfif activity_categorylms.delete()>
			<cfset flashInsert(success="The activity_categorylms was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_categorylms.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
