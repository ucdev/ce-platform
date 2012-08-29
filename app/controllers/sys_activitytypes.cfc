<cfcomponent extends="Controller" output="false">
	
	<!--- sys_activitytypes/index --->
	<cffunction name="index">
		<cfset sys_activitytypes = model("Sys_activitytype").findAll()>
	</cffunction>
	
	<!--- sys_activitytypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_activitytype = model("Sys_activitytype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_activitytype)>
	        <cfset flashInsert(error="Sys_activitytype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_activitytypes/new --->
	<cffunction name="new">
		<cfset sys_activitytype = model("Sys_activitytype").new()>
	</cffunction>
	
	<!--- sys_activitytypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_activitytype = model("Sys_activitytype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_activitytype)>
	        <cfset flashInsert(error="Sys_activitytype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_activitytypes/create --->
	<cffunction name="create">
		<cfset sys_activitytype = model("Sys_activitytype").new(params.sys_activitytype)>
		
		<!--- Verify that the sys_activitytype creates successfully --->
		<cfif sys_activitytype.save()>
			<cfset flashInsert(success="The sys_activitytype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_activitytype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_activitytypes/update --->
	<cffunction name="update">
		<cfset sys_activitytype = model("Sys_activitytype").findByKey(params.key)>
		
		<!--- Verify that the sys_activitytype updates successfully --->
		<cfif sys_activitytype.update(params.sys_activitytype)>
			<cfset flashInsert(success="The sys_activitytype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_activitytype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_activitytypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_activitytype = model("Sys_activitytype").findByKey(params.key)>
		
		<!--- Verify that the sys_activitytype deletes successfully --->
		<cfif sys_activitytype.delete()>
			<cfset flashInsert(success="The sys_activitytype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_activitytype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
