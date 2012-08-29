<cfcomponent extends="Controller" output="false">
	
	<!--- sys_sitelms/index --->
	<cffunction name="index">
		<cfset sys_sitelms = model("Sys_sitelms").findAll()>
	</cffunction>
	
	<!--- sys_sitelms/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_sitelms = model("Sys_sitelms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_sitelms)>
	        <cfset flashInsert(error="Sys_sitelms #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_sitelms/new --->
	<cffunction name="new">
		<cfset sys_sitelms = model("Sys_sitelms").new()>
	</cffunction>
	
	<!--- sys_sitelms/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_sitelms = model("Sys_sitelms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_sitelms)>
	        <cfset flashInsert(error="Sys_sitelms #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_sitelms/create --->
	<cffunction name="create">
		<cfset sys_sitelms = model("Sys_sitelms").new(params.sys_sitelms)>
		
		<!--- Verify that the sys_sitelms creates successfully --->
		<cfif sys_sitelms.save()>
			<cfset flashInsert(success="The sys_sitelms was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_sitelms.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_sitelms/update --->
	<cffunction name="update">
		<cfset sys_sitelms = model("Sys_sitelms").findByKey(params.key)>
		
		<!--- Verify that the sys_sitelms updates successfully --->
		<cfif sys_sitelms.update(params.sys_sitelms)>
			<cfset flashInsert(success="The sys_sitelms was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_sitelms.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_sitelms/delete/key --->
	<cffunction name="delete">
		<cfset sys_sitelms = model("Sys_sitelms").findByKey(params.key)>
		
		<!--- Verify that the sys_sitelms deletes successfully --->
		<cfif sys_sitelms.delete()>
			<cfset flashInsert(success="The sys_sitelms was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_sitelms.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
