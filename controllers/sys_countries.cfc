<cfcomponent extends="Controller" output="false">
	
	<!--- sys_countries/index --->
	<cffunction name="index">
		<cfset sys_countries = model("Sys_country").findAll()>
	</cffunction>
	
	<!--- sys_countries/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_country = model("Sys_country").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_country)>
	        <cfset flashInsert(error="Sys_country #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_countries/new --->
	<cffunction name="new">
		<cfset sys_country = model("Sys_country").new()>
	</cffunction>
	
	<!--- sys_countries/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_country = model("Sys_country").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_country)>
	        <cfset flashInsert(error="Sys_country #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_countries/create --->
	<cffunction name="create">
		<cfset sys_country = model("Sys_country").new(params.sys_country)>
		
		<!--- Verify that the sys_country creates successfully --->
		<cfif sys_country.save()>
			<cfset flashInsert(success="The sys_country was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_country.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_countries/update --->
	<cffunction name="update">
		<cfset sys_country = model("Sys_country").findByKey(params.key)>
		
		<!--- Verify that the sys_country updates successfully --->
		<cfif sys_country.update(params.sys_country)>
			<cfset flashInsert(success="The sys_country was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_country.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_countries/delete/key --->
	<cffunction name="delete">
		<cfset sys_country = model("Sys_country").findByKey(params.key)>
		
		<!--- Verify that the sys_country deletes successfully --->
		<cfif sys_country.delete()>
			<cfset flashInsert(success="The sys_country was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_country.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
