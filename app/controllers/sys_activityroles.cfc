<cfcomponent extends="Controller" output="false">
	
	<!--- sys_activityroles/index --->
	<cffunction name="index">
		<cfset sys_activityroles = model("Sys_activityrole").findAll()>
	</cffunction>
	
	<!--- sys_activityroles/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_activityrole = model("Sys_activityrole").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_activityrole)>
	        <cfset flashInsert(error="Sys_activityrole #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_activityroles/new --->
	<cffunction name="new">
		<cfset sys_activityrole = model("Sys_activityrole").new()>
	</cffunction>
	
	<!--- sys_activityroles/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_activityrole = model("Sys_activityrole").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_activityrole)>
	        <cfset flashInsert(error="Sys_activityrole #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_activityroles/create --->
	<cffunction name="create">
		<cfset sys_activityrole = model("Sys_activityrole").new(params.sys_activityrole)>
		
		<!--- Verify that the sys_activityrole creates successfully --->
		<cfif sys_activityrole.save()>
			<cfset flashInsert(success="The sys_activityrole was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_activityrole.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_activityroles/update --->
	<cffunction name="update">
		<cfset sys_activityrole = model("Sys_activityrole").findByKey(params.key)>
		
		<!--- Verify that the sys_activityrole updates successfully --->
		<cfif sys_activityrole.update(params.sys_activityrole)>
			<cfset flashInsert(success="The sys_activityrole was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_activityrole.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_activityroles/delete/key --->
	<cffunction name="delete">
		<cfset sys_activityrole = model("Sys_activityrole").findByKey(params.key)>
		
		<!--- Verify that the sys_activityrole deletes successfully --->
		<cfif sys_activityrole.delete()>
			<cfset flashInsert(success="The sys_activityrole was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_activityrole.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
