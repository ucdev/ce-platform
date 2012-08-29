<cfcomponent extends="Controller" output="false">
	
	<!--- sys_ethnicities/index --->
	<cffunction name="index">
		<cfset sys_ethnicities = model("Sys_ethnicity").findAll()>
	</cffunction>
	
	<!--- sys_ethnicities/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_ethnicity = model("Sys_ethnicity").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_ethnicity)>
	        <cfset flashInsert(error="Sys_ethnicity #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_ethnicities/new --->
	<cffunction name="new">
		<cfset sys_ethnicity = model("Sys_ethnicity").new()>
	</cffunction>
	
	<!--- sys_ethnicities/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_ethnicity = model("Sys_ethnicity").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_ethnicity)>
	        <cfset flashInsert(error="Sys_ethnicity #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_ethnicities/create --->
	<cffunction name="create">
		<cfset sys_ethnicity = model("Sys_ethnicity").new(params.sys_ethnicity)>
		
		<!--- Verify that the sys_ethnicity creates successfully --->
		<cfif sys_ethnicity.save()>
			<cfset flashInsert(success="The sys_ethnicity was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_ethnicity.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_ethnicities/update --->
	<cffunction name="update">
		<cfset sys_ethnicity = model("Sys_ethnicity").findByKey(params.key)>
		
		<!--- Verify that the sys_ethnicity updates successfully --->
		<cfif sys_ethnicity.update(params.sys_ethnicity)>
			<cfset flashInsert(success="The sys_ethnicity was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_ethnicity.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_ethnicities/delete/key --->
	<cffunction name="delete">
		<cfset sys_ethnicity = model("Sys_ethnicity").findByKey(params.key)>
		
		<!--- Verify that the sys_ethnicity deletes successfully --->
		<cfif sys_ethnicity.delete()>
			<cfset flashInsert(success="The sys_ethnicity was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_ethnicity.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
