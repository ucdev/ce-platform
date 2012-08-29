<cfcomponent extends="Controller" output="false">
	
	<!--- sys_cbofunds/index --->
	<cffunction name="index">
		<cfset sys_cbofunds = model("Sys_cbofund").findAll()>
	</cffunction>
	
	<!--- sys_cbofunds/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_cbofund = model("Sys_cbofund").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_cbofund)>
	        <cfset flashInsert(error="Sys_cbofund #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_cbofunds/new --->
	<cffunction name="new">
		<cfset sys_cbofund = model("Sys_cbofund").new()>
	</cffunction>
	
	<!--- sys_cbofunds/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_cbofund = model("Sys_cbofund").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_cbofund)>
	        <cfset flashInsert(error="Sys_cbofund #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_cbofunds/create --->
	<cffunction name="create">
		<cfset sys_cbofund = model("Sys_cbofund").new(params.sys_cbofund)>
		
		<!--- Verify that the sys_cbofund creates successfully --->
		<cfif sys_cbofund.save()>
			<cfset flashInsert(success="The sys_cbofund was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_cbofund.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_cbofunds/update --->
	<cffunction name="update">
		<cfset sys_cbofund = model("Sys_cbofund").findByKey(params.key)>
		
		<!--- Verify that the sys_cbofund updates successfully --->
		<cfif sys_cbofund.update(params.sys_cbofund)>
			<cfset flashInsert(success="The sys_cbofund was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_cbofund.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_cbofunds/delete/key --->
	<cffunction name="delete">
		<cfset sys_cbofund = model("Sys_cbofund").findByKey(params.key)>
		
		<!--- Verify that the sys_cbofund deletes successfully --->
		<cfif sys_cbofund.delete()>
			<cfset flashInsert(success="The sys_cbofund was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_cbofund.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
