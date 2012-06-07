<cfcomponent extends="Controller" output="false">
	
	<!--- activity_sites/index --->
	<cffunction name="index">
		<cfset activity_sites = model("Activity_site").findAll()>
	</cffunction>
	
	<!--- activity_sites/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_site = model("Activity_site").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_site)>
	        <cfset flashInsert(error="Activity_site #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_sites/new --->
	<cffunction name="new">
		<cfset activity_site = model("Activity_site").new()>
	</cffunction>
	
	<!--- activity_sites/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_site = model("Activity_site").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_site)>
	        <cfset flashInsert(error="Activity_site #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_sites/create --->
	<cffunction name="create">
		<cfset activity_site = model("Activity_site").new(params.activity_site)>
		
		<!--- Verify that the activity_site creates successfully --->
		<cfif activity_site.save()>
			<cfset flashInsert(success="The activity_site was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_site.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_sites/update --->
	<cffunction name="update">
		<cfset activity_site = model("Activity_site").findByKey(params.key)>
		
		<!--- Verify that the activity_site updates successfully --->
		<cfif activity_site.update(params.activity_site)>
			<cfset flashInsert(success="The activity_site was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_site.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_sites/delete/key --->
	<cffunction name="delete">
		<cfset activity_site = model("Activity_site").findByKey(params.key)>
		
		<!--- Verify that the activity_site deletes successfully --->
		<cfif activity_site.delete()>
			<cfset flashInsert(success="The activity_site was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_site.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
