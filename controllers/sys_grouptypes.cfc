<cfcomponent extends="Controller" output="false">
	
	<!--- sys_grouptypes/index --->
	<cffunction name="index">
		<cfset sys_grouptypes = model("Sys_grouptype").findAll()>
	</cffunction>
	
	<!--- sys_grouptypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_grouptype = model("Sys_grouptype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_grouptype)>
	        <cfset flashInsert(error="Sys_grouptype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_grouptypes/new --->
	<cffunction name="new">
		<cfset sys_grouptype = model("Sys_grouptype").new()>
	</cffunction>
	
	<!--- sys_grouptypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_grouptype = model("Sys_grouptype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_grouptype)>
	        <cfset flashInsert(error="Sys_grouptype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_grouptypes/create --->
	<cffunction name="create">
		<cfset sys_grouptype = model("Sys_grouptype").new(params.sys_grouptype)>
		
		<!--- Verify that the sys_grouptype creates successfully --->
		<cfif sys_grouptype.save()>
			<cfset flashInsert(success="The sys_grouptype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_grouptype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_grouptypes/update --->
	<cffunction name="update">
		<cfset sys_grouptype = model("Sys_grouptype").findByKey(params.key)>
		
		<!--- Verify that the sys_grouptype updates successfully --->
		<cfif sys_grouptype.update(params.sys_grouptype)>
			<cfset flashInsert(success="The sys_grouptype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_grouptype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_grouptypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_grouptype = model("Sys_grouptype").findByKey(params.key)>
		
		<!--- Verify that the sys_grouptype deletes successfully --->
		<cfif sys_grouptype.delete()>
			<cfset flashInsert(success="The sys_grouptype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_grouptype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
