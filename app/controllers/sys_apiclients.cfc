<cfcomponent extends="Controller" output="false">
	
	<!--- sys_apiclients/index --->
	<cffunction name="index">
		<cfset sys_apiclients = model("Sys_apiclient").findAll()>
	</cffunction>
	
	<!--- sys_apiclients/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_apiclient = model("Sys_apiclient").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_apiclient)>
	        <cfset flashInsert(error="Sys_apiclient #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_apiclients/new --->
	<cffunction name="new">
		<cfset sys_apiclient = model("Sys_apiclient").new()>
	</cffunction>
	
	<!--- sys_apiclients/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_apiclient = model("Sys_apiclient").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_apiclient)>
	        <cfset flashInsert(error="Sys_apiclient #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_apiclients/create --->
	<cffunction name="create">
		<cfset sys_apiclient = model("Sys_apiclient").new(params.sys_apiclient)>
		
		<!--- Verify that the sys_apiclient creates successfully --->
		<cfif sys_apiclient.save()>
			<cfset flashInsert(success="The sys_apiclient was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_apiclient.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_apiclients/update --->
	<cffunction name="update">
		<cfset sys_apiclient = model("Sys_apiclient").findByKey(params.key)>
		
		<!--- Verify that the sys_apiclient updates successfully --->
		<cfif sys_apiclient.update(params.sys_apiclient)>
			<cfset flashInsert(success="The sys_apiclient was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_apiclient.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_apiclients/delete/key --->
	<cffunction name="delete">
		<cfset sys_apiclient = model("Sys_apiclient").findByKey(params.key)>
		
		<!--- Verify that the sys_apiclient deletes successfully --->
		<cfif sys_apiclient.delete()>
			<cfset flashInsert(success="The sys_apiclient was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_apiclient.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
