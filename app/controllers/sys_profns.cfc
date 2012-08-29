<cfcomponent extends="Controller" output="false">
	
	<!--- sys_profns/index --->
	<cffunction name="index">
		<cfset sys_profns = model("Sys_profn").findAll()>
	</cffunction>
	
	<!--- sys_profns/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_profn = model("Sys_profn").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_profn)>
	        <cfset flashInsert(error="Sys_profn #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_profns/new --->
	<cffunction name="new">
		<cfset sys_profn = model("Sys_profn").new()>
	</cffunction>
	
	<!--- sys_profns/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_profn = model("Sys_profn").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_profn)>
	        <cfset flashInsert(error="Sys_profn #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_profns/create --->
	<cffunction name="create">
		<cfset sys_profn = model("Sys_profn").new(params.sys_profn)>
		
		<!--- Verify that the sys_profn creates successfully --->
		<cfif sys_profn.save()>
			<cfset flashInsert(success="The sys_profn was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_profn.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_profns/update --->
	<cffunction name="update">
		<cfset sys_profn = model("Sys_profn").findByKey(params.key)>
		
		<!--- Verify that the sys_profn updates successfully --->
		<cfif sys_profn.update(params.sys_profn)>
			<cfset flashInsert(success="The sys_profn was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_profn.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_profns/delete/key --->
	<cffunction name="delete">
		<cfset sys_profn = model("Sys_profn").findByKey(params.key)>
		
		<!--- Verify that the sys_profn deletes successfully --->
		<cfif sys_profn.delete()>
			<cfset flashInsert(success="The sys_profn was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_profn.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
