<cfcomponent extends="Controller" output="false">
	
	<!--- sys_emailstyles/index --->
	<cffunction name="index">
		<cfset sys_emailstyles = model("Sys_emailstyle").findAll()>
	</cffunction>
	
	<!--- sys_emailstyles/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_emailstyle = model("Sys_emailstyle").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_emailstyle)>
	        <cfset flashInsert(error="Sys_emailstyle #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_emailstyles/new --->
	<cffunction name="new">
		<cfset sys_emailstyle = model("Sys_emailstyle").new()>
	</cffunction>
	
	<!--- sys_emailstyles/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_emailstyle = model("Sys_emailstyle").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_emailstyle)>
	        <cfset flashInsert(error="Sys_emailstyle #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_emailstyles/create --->
	<cffunction name="create">
		<cfset sys_emailstyle = model("Sys_emailstyle").new(params.sys_emailstyle)>
		
		<!--- Verify that the sys_emailstyle creates successfully --->
		<cfif sys_emailstyle.save()>
			<cfset flashInsert(success="The sys_emailstyle was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_emailstyle.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_emailstyles/update --->
	<cffunction name="update">
		<cfset sys_emailstyle = model("Sys_emailstyle").findByKey(params.key)>
		
		<!--- Verify that the sys_emailstyle updates successfully --->
		<cfif sys_emailstyle.update(params.sys_emailstyle)>
			<cfset flashInsert(success="The sys_emailstyle was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_emailstyle.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_emailstyles/delete/key --->
	<cffunction name="delete">
		<cfset sys_emailstyle = model("Sys_emailstyle").findByKey(params.key)>
		
		<!--- Verify that the sys_emailstyle deletes successfully --->
		<cfif sys_emailstyle.delete()>
			<cfset flashInsert(success="The sys_emailstyle was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_emailstyle.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
