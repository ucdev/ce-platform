<cfcomponent extends="Controller" output="false">
	
	<!--- sys_categorylms/index --->
	<cffunction name="index">
		<cfset sys_categorylms = model("Sys_categorylms").findAll()>
	</cffunction>
	
	<!--- sys_categorylms/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_categorylms = model("Sys_categorylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_categorylms)>
	        <cfset flashInsert(error="Sys_categorylms #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_categorylms/new --->
	<cffunction name="new">
		<cfset sys_categorylms = model("Sys_categorylms").new()>
	</cffunction>
	
	<!--- sys_categorylms/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_categorylms = model("Sys_categorylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_categorylms)>
	        <cfset flashInsert(error="Sys_categorylms #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_categorylms/create --->
	<cffunction name="create">
		<cfset sys_categorylms = model("Sys_categorylms").new(params.sys_categorylms)>
		
		<!--- Verify that the sys_categorylms creates successfully --->
		<cfif sys_categorylms.save()>
			<cfset flashInsert(success="The sys_categorylms was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_categorylms.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_categorylms/update --->
	<cffunction name="update">
		<cfset sys_categorylms = model("Sys_categorylms").findByKey(params.key)>
		
		<!--- Verify that the sys_categorylms updates successfully --->
		<cfif sys_categorylms.update(params.sys_categorylms)>
			<cfset flashInsert(success="The sys_categorylms was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_categorylms.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_categorylms/delete/key --->
	<cffunction name="delete">
		<cfset sys_categorylms = model("Sys_categorylms").findByKey(params.key)>
		
		<!--- Verify that the sys_categorylms deletes successfully --->
		<cfif sys_categorylms.delete()>
			<cfset flashInsert(success="The sys_categorylms was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_categorylms.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
