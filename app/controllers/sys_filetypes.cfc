<cfcomponent extends="Controller" output="false">
	
	<!--- sys_filetypes/index --->
	<cffunction name="index">
		<cfset sys_filetypes = model("Sys_filetype").findAll()>
	</cffunction>
	
	<!--- sys_filetypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_filetype = model("Sys_filetype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_filetype)>
	        <cfset flashInsert(error="Sys_filetype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_filetypes/new --->
	<cffunction name="new">
		<cfset sys_filetype = model("Sys_filetype").new()>
	</cffunction>
	
	<!--- sys_filetypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_filetype = model("Sys_filetype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_filetype)>
	        <cfset flashInsert(error="Sys_filetype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_filetypes/create --->
	<cffunction name="create">
		<cfset sys_filetype = model("Sys_filetype").new(params.sys_filetype)>
		
		<!--- Verify that the sys_filetype creates successfully --->
		<cfif sys_filetype.save()>
			<cfset flashInsert(success="The sys_filetype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_filetype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_filetypes/update --->
	<cffunction name="update">
		<cfset sys_filetype = model("Sys_filetype").findByKey(params.key)>
		
		<!--- Verify that the sys_filetype updates successfully --->
		<cfif sys_filetype.update(params.sys_filetype)>
			<cfset flashInsert(success="The sys_filetype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_filetype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_filetypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_filetype = model("Sys_filetype").findByKey(params.key)>
		
		<!--- Verify that the sys_filetype deletes successfully --->
		<cfif sys_filetype.delete()>
			<cfset flashInsert(success="The sys_filetype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_filetype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
