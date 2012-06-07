<cfcomponent extends="Controller" output="false">
	
	<!--- sys_orgtypes/index --->
	<cffunction name="index">
		<cfset sys_orgtypes = model("Sys_orgtype").findAll()>
	</cffunction>
	
	<!--- sys_orgtypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_orgtype = model("Sys_orgtype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_orgtype)>
	        <cfset flashInsert(error="Sys_orgtype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_orgtypes/new --->
	<cffunction name="new">
		<cfset sys_orgtype = model("Sys_orgtype").new()>
	</cffunction>
	
	<!--- sys_orgtypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_orgtype = model("Sys_orgtype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_orgtype)>
	        <cfset flashInsert(error="Sys_orgtype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_orgtypes/create --->
	<cffunction name="create">
		<cfset sys_orgtype = model("Sys_orgtype").new(params.sys_orgtype)>
		
		<!--- Verify that the sys_orgtype creates successfully --->
		<cfif sys_orgtype.save()>
			<cfset flashInsert(success="The sys_orgtype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_orgtype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_orgtypes/update --->
	<cffunction name="update">
		<cfset sys_orgtype = model("Sys_orgtype").findByKey(params.key)>
		
		<!--- Verify that the sys_orgtype updates successfully --->
		<cfif sys_orgtype.update(params.sys_orgtype)>
			<cfset flashInsert(success="The sys_orgtype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_orgtype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_orgtypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_orgtype = model("Sys_orgtype").findByKey(params.key)>
		
		<!--- Verify that the sys_orgtype deletes successfully --->
		<cfif sys_orgtype.delete()>
			<cfset flashInsert(success="The sys_orgtype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_orgtype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
