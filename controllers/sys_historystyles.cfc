<cfcomponent extends="Controller" output="false">
	
	<!--- sys_historystyles/index --->
	<cffunction name="index">
		<cfset sys_historystyles = model("Sys_historystyle").findAll()>
	</cffunction>
	
	<!--- sys_historystyles/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_historystyle = model("Sys_historystyle").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_historystyle)>
	        <cfset flashInsert(error="Sys_historystyle #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_historystyles/new --->
	<cffunction name="new">
		<cfset sys_historystyle = model("Sys_historystyle").new()>
	</cffunction>
	
	<!--- sys_historystyles/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_historystyle = model("Sys_historystyle").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_historystyle)>
	        <cfset flashInsert(error="Sys_historystyle #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_historystyles/create --->
	<cffunction name="create">
		<cfset sys_historystyle = model("Sys_historystyle").new(params.sys_historystyle)>
		
		<!--- Verify that the sys_historystyle creates successfully --->
		<cfif sys_historystyle.save()>
			<cfset flashInsert(success="The sys_historystyle was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_historystyle.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_historystyles/update --->
	<cffunction name="update">
		<cfset sys_historystyle = model("Sys_historystyle").findByKey(params.key)>
		
		<!--- Verify that the sys_historystyle updates successfully --->
		<cfif sys_historystyle.update(params.sys_historystyle)>
			<cfset flashInsert(success="The sys_historystyle was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_historystyle.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_historystyles/delete/key --->
	<cffunction name="delete">
		<cfset sys_historystyle = model("Sys_historystyle").findByKey(params.key)>
		
		<!--- Verify that the sys_historystyle deletes successfully --->
		<cfif sys_historystyle.delete()>
			<cfset flashInsert(success="The sys_historystyle was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_historystyle.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
