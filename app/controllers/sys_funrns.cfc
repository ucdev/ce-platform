<cfcomponent extends="Controller" output="false">
	
	<!--- sys_funrns/index --->
	<cffunction name="index">
		<cfset sys_funrns = model("Sys_funrn").findAll()>
	</cffunction>
	
	<!--- sys_funrns/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_funrn = model("Sys_funrn").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_funrn)>
	        <cfset flashInsert(error="Sys_funrn #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_funrns/new --->
	<cffunction name="new">
		<cfset sys_funrn = model("Sys_funrn").new()>
	</cffunction>
	
	<!--- sys_funrns/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_funrn = model("Sys_funrn").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_funrn)>
	        <cfset flashInsert(error="Sys_funrn #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_funrns/create --->
	<cffunction name="create">
		<cfset sys_funrn = model("Sys_funrn").new(params.sys_funrn)>
		
		<!--- Verify that the sys_funrn creates successfully --->
		<cfif sys_funrn.save()>
			<cfset flashInsert(success="The sys_funrn was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_funrn.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_funrns/update --->
	<cffunction name="update">
		<cfset sys_funrn = model("Sys_funrn").findByKey(params.key)>
		
		<!--- Verify that the sys_funrn updates successfully --->
		<cfif sys_funrn.update(params.sys_funrn)>
			<cfset flashInsert(success="The sys_funrn was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_funrn.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_funrns/delete/key --->
	<cffunction name="delete">
		<cfset sys_funrn = model("Sys_funrn").findByKey(params.key)>
		
		<!--- Verify that the sys_funrn deletes successfully --->
		<cfif sys_funrn.delete()>
			<cfset flashInsert(success="The sys_funrn was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_funrn.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
