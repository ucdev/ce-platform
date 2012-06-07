<cfcomponent extends="Controller" output="false">
	
	<!--- sys_funrcs/index --->
	<cffunction name="index">
		<cfset sys_funrcs = model("Sys_funrc").findAll()>
	</cffunction>
	
	<!--- sys_funrcs/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_funrc = model("Sys_funrc").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_funrc)>
	        <cfset flashInsert(error="Sys_funrc #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_funrcs/new --->
	<cffunction name="new">
		<cfset sys_funrc = model("Sys_funrc").new()>
	</cffunction>
	
	<!--- sys_funrcs/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_funrc = model("Sys_funrc").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_funrc)>
	        <cfset flashInsert(error="Sys_funrc #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_funrcs/create --->
	<cffunction name="create">
		<cfset sys_funrc = model("Sys_funrc").new(params.sys_funrc)>
		
		<!--- Verify that the sys_funrc creates successfully --->
		<cfif sys_funrc.save()>
			<cfset flashInsert(success="The sys_funrc was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_funrc.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_funrcs/update --->
	<cffunction name="update">
		<cfset sys_funrc = model("Sys_funrc").findByKey(params.key)>
		
		<!--- Verify that the sys_funrc updates successfully --->
		<cfif sys_funrc.update(params.sys_funrc)>
			<cfset flashInsert(success="The sys_funrc was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_funrc.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_funrcs/delete/key --->
	<cffunction name="delete">
		<cfset sys_funrc = model("Sys_funrc").findByKey(params.key)>
		
		<!--- Verify that the sys_funrc deletes successfully --->
		<cfif sys_funrc.delete()>
			<cfset flashInsert(success="The sys_funrc was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_funrc.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
