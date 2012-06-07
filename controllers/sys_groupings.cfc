<cfcomponent extends="Controller" output="false">
	
	<!--- sys_groupings/index --->
	<cffunction name="index">
		<cfset sys_groupings = model("Sys_grouping").findAll()>
	</cffunction>
	
	<!--- sys_groupings/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_grouping = model("Sys_grouping").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_grouping)>
	        <cfset flashInsert(error="Sys_grouping #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_groupings/new --->
	<cffunction name="new">
		<cfset sys_grouping = model("Sys_grouping").new()>
	</cffunction>
	
	<!--- sys_groupings/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_grouping = model("Sys_grouping").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_grouping)>
	        <cfset flashInsert(error="Sys_grouping #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_groupings/create --->
	<cffunction name="create">
		<cfset sys_grouping = model("Sys_grouping").new(params.sys_grouping)>
		
		<!--- Verify that the sys_grouping creates successfully --->
		<cfif sys_grouping.save()>
			<cfset flashInsert(success="The sys_grouping was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_grouping.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_groupings/update --->
	<cffunction name="update">
		<cfset sys_grouping = model("Sys_grouping").findByKey(params.key)>
		
		<!--- Verify that the sys_grouping updates successfully --->
		<cfif sys_grouping.update(params.sys_grouping)>
			<cfset flashInsert(success="The sys_grouping was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_grouping.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_groupings/delete/key --->
	<cffunction name="delete">
		<cfset sys_grouping = model("Sys_grouping").findByKey(params.key)>
		
		<!--- Verify that the sys_grouping deletes successfully --->
		<cfif sys_grouping.delete()>
			<cfset flashInsert(success="The sys_grouping was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_grouping.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
