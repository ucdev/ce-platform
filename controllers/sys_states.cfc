<cfcomponent extends="Controller" output="false">
	
	<!--- sys_states/index --->
	<cffunction name="index">
		<cfset sys_states = model("Sys_state").findAll()>
	</cffunction>
	
	<!--- sys_states/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_state = model("Sys_state").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_state)>
	        <cfset flashInsert(error="Sys_state #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_states/new --->
	<cffunction name="new">
		<cfset sys_state = model("Sys_state").new()>
	</cffunction>
	
	<!--- sys_states/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_state = model("Sys_state").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_state)>
	        <cfset flashInsert(error="Sys_state #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_states/create --->
	<cffunction name="create">
		<cfset sys_state = model("Sys_state").new(params.sys_state)>
		
		<!--- Verify that the sys_state creates successfully --->
		<cfif sys_state.save()>
			<cfset flashInsert(success="The sys_state was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_state.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_states/update --->
	<cffunction name="update">
		<cfset sys_state = model("Sys_state").findByKey(params.key)>
		
		<!--- Verify that the sys_state updates successfully --->
		<cfif sys_state.update(params.sys_state)>
			<cfset flashInsert(success="The sys_state was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_state.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_states/delete/key --->
	<cffunction name="delete">
		<cfset sys_state = model("Sys_state").findByKey(params.key)>
		
		<!--- Verify that the sys_state deletes successfully --->
		<cfif sys_state.delete()>
			<cfset flashInsert(success="The sys_state was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_state.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
