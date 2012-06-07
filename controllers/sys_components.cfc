<cfcomponent extends="Controller" output="false">
	
	<!--- sys_components/index --->
	<cffunction name="index">
		<cfset sys_components = model("Sys_component").findAll()>
	</cffunction>
	
	<!--- sys_components/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_component = model("Sys_component").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_component)>
	        <cfset flashInsert(error="Sys_component #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_components/new --->
	<cffunction name="new">
		<cfset sys_component = model("Sys_component").new()>
	</cffunction>
	
	<!--- sys_components/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_component = model("Sys_component").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_component)>
	        <cfset flashInsert(error="Sys_component #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_components/create --->
	<cffunction name="create">
		<cfset sys_component = model("Sys_component").new(params.sys_component)>
		
		<!--- Verify that the sys_component creates successfully --->
		<cfif sys_component.save()>
			<cfset flashInsert(success="The sys_component was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_component.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_components/update --->
	<cffunction name="update">
		<cfset sys_component = model("Sys_component").findByKey(params.key)>
		
		<!--- Verify that the sys_component updates successfully --->
		<cfif sys_component.update(params.sys_component)>
			<cfset flashInsert(success="The sys_component was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_component.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_components/delete/key --->
	<cffunction name="delete">
		<cfset sys_component = model("Sys_component").findByKey(params.key)>
		
		<!--- Verify that the sys_component deletes successfully --->
		<cfif sys_component.delete()>
			<cfset flashInsert(success="The sys_component was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_component.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
