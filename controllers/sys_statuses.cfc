<cfcomponent extends="Controller" output="false">
	
	<!--- sys_statuses/index --->
	<cffunction name="index">
		<cfset sys_statuses = model("Sys_status").findAll()>
	</cffunction>
	
	<!--- sys_statuses/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_status = model("Sys_status").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_status)>
	        <cfset flashInsert(error="Sys_status #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_statuses/new --->
	<cffunction name="new">
		<cfset sys_status = model("Sys_status").new()>
	</cffunction>
	
	<!--- sys_statuses/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_status = model("Sys_status").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_status)>
	        <cfset flashInsert(error="Sys_status #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_statuses/create --->
	<cffunction name="create">
		<cfset sys_status = model("Sys_status").new(params.sys_status)>
		
		<!--- Verify that the sys_status creates successfully --->
		<cfif sys_status.save()>
			<cfset flashInsert(success="The sys_status was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_status.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_statuses/update --->
	<cffunction name="update">
		<cfset sys_status = model("Sys_status").findByKey(params.key)>
		
		<!--- Verify that the sys_status updates successfully --->
		<cfif sys_status.update(params.sys_status)>
			<cfset flashInsert(success="The sys_status was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_status.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_statuses/delete/key --->
	<cffunction name="delete">
		<cfset sys_status = model("Sys_status").findByKey(params.key)>
		
		<!--- Verify that the sys_status deletes successfully --->
		<cfif sys_status.delete()>
			<cfset flashInsert(success="The sys_status was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_status.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
