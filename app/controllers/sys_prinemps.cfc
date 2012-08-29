<cfcomponent extends="Controller" output="false">
	
	<!--- sys_prinemps/index --->
	<cffunction name="index">
		<cfset sys_prinemps = model("Sys_prinemp").findAll()>
	</cffunction>
	
	<!--- sys_prinemps/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_prinemp = model("Sys_prinemp").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_prinemp)>
	        <cfset flashInsert(error="Sys_prinemp #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_prinemps/new --->
	<cffunction name="new">
		<cfset sys_prinemp = model("Sys_prinemp").new()>
	</cffunction>
	
	<!--- sys_prinemps/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_prinemp = model("Sys_prinemp").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_prinemp)>
	        <cfset flashInsert(error="Sys_prinemp #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_prinemps/create --->
	<cffunction name="create">
		<cfset sys_prinemp = model("Sys_prinemp").new(params.sys_prinemp)>
		
		<!--- Verify that the sys_prinemp creates successfully --->
		<cfif sys_prinemp.save()>
			<cfset flashInsert(success="The sys_prinemp was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_prinemp.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_prinemps/update --->
	<cffunction name="update">
		<cfset sys_prinemp = model("Sys_prinemp").findByKey(params.key)>
		
		<!--- Verify that the sys_prinemp updates successfully --->
		<cfif sys_prinemp.update(params.sys_prinemp)>
			<cfset flashInsert(success="The sys_prinemp was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_prinemp.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_prinemps/delete/key --->
	<cffunction name="delete">
		<cfset sys_prinemp = model("Sys_prinemp").findByKey(params.key)>
		
		<!--- Verify that the sys_prinemp deletes successfully --->
		<cfif sys_prinemp.delete()>
			<cfset flashInsert(success="The sys_prinemp was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_prinemp.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
