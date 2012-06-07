<cfcomponent extends="Controller" output="false">
	
	<!--- sys_specialtylms/index --->
	<cffunction name="index">
		<cfset sys_specialtylms = model("Sys_specialtylms").findAll()>
	</cffunction>
	
	<!--- sys_specialtylms/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_specialtylms = model("Sys_specialtylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_specialtylms)>
	        <cfset flashInsert(error="Sys_specialtylms #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_specialtylms/new --->
	<cffunction name="new">
		<cfset sys_specialtylms = model("Sys_specialtylms").new()>
	</cffunction>
	
	<!--- sys_specialtylms/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_specialtylms = model("Sys_specialtylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_specialtylms)>
	        <cfset flashInsert(error="Sys_specialtylms #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_specialtylms/create --->
	<cffunction name="create">
		<cfset sys_specialtylms = model("Sys_specialtylms").new(params.sys_specialtylms)>
		
		<!--- Verify that the sys_specialtylms creates successfully --->
		<cfif sys_specialtylms.save()>
			<cfset flashInsert(success="The sys_specialtylms was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_specialtylms.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_specialtylms/update --->
	<cffunction name="update">
		<cfset sys_specialtylms = model("Sys_specialtylms").findByKey(params.key)>
		
		<!--- Verify that the sys_specialtylms updates successfully --->
		<cfif sys_specialtylms.update(params.sys_specialtylms)>
			<cfset flashInsert(success="The sys_specialtylms was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_specialtylms.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_specialtylms/delete/key --->
	<cffunction name="delete">
		<cfset sys_specialtylms = model("Sys_specialtylms").findByKey(params.key)>
		
		<!--- Verify that the sys_specialtylms deletes successfully --->
		<cfif sys_specialtylms.delete()>
			<cfset flashInsert(success="The sys_specialtylms was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_specialtylms.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
