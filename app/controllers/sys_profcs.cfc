<cfcomponent extends="Controller" output="false">
	
	<!--- sys_profcs/index --->
	<cffunction name="index">
		<cfset sys_profcs = model("Sys_profc").findAll()>
	</cffunction>
	
	<!--- sys_profcs/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_profc = model("Sys_profc").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_profc)>
	        <cfset flashInsert(error="Sys_profc #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_profcs/new --->
	<cffunction name="new">
		<cfset sys_profc = model("Sys_profc").new()>
	</cffunction>
	
	<!--- sys_profcs/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_profc = model("Sys_profc").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_profc)>
	        <cfset flashInsert(error="Sys_profc #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_profcs/create --->
	<cffunction name="create">
		<cfset sys_profc = model("Sys_profc").new(params.sys_profc)>
		
		<!--- Verify that the sys_profc creates successfully --->
		<cfif sys_profc.save()>
			<cfset flashInsert(success="The sys_profc was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_profc.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_profcs/update --->
	<cffunction name="update">
		<cfset sys_profc = model("Sys_profc").findByKey(params.key)>
		
		<!--- Verify that the sys_profc updates successfully --->
		<cfif sys_profc.update(params.sys_profc)>
			<cfset flashInsert(success="The sys_profc was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_profc.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_profcs/delete/key --->
	<cffunction name="delete">
		<cfset sys_profc = model("Sys_profc").findByKey(params.key)>
		
		<!--- Verify that the sys_profc deletes successfully --->
		<cfif sys_profc.delete()>
			<cfset flashInsert(success="The sys_profc was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_profc.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
