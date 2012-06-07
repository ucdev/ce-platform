<cfcomponent extends="Controller" output="false">
	
	<!--- sys_personstatuses/index --->
	<cffunction name="index">
		<cfset sys_personstatuses = model("Sys_personstatus").findAll()>
	</cffunction>
	
	<!--- sys_personstatuses/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_personstatus = model("Sys_personstatus").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_personstatus)>
	        <cfset flashInsert(error="Sys_personstatus #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_personstatuses/new --->
	<cffunction name="new">
		<cfset sys_personstatus = model("Sys_personstatus").new()>
	</cffunction>
	
	<!--- sys_personstatuses/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_personstatus = model("Sys_personstatus").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_personstatus)>
	        <cfset flashInsert(error="Sys_personstatus #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_personstatuses/create --->
	<cffunction name="create">
		<cfset sys_personstatus = model("Sys_personstatus").new(params.sys_personstatus)>
		
		<!--- Verify that the sys_personstatus creates successfully --->
		<cfif sys_personstatus.save()>
			<cfset flashInsert(success="The sys_personstatus was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_personstatus.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_personstatuses/update --->
	<cffunction name="update">
		<cfset sys_personstatus = model("Sys_personstatus").findByKey(params.key)>
		
		<!--- Verify that the sys_personstatus updates successfully --->
		<cfif sys_personstatus.update(params.sys_personstatus)>
			<cfset flashInsert(success="The sys_personstatus was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_personstatus.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_personstatuses/delete/key --->
	<cffunction name="delete">
		<cfset sys_personstatus = model("Sys_personstatus").findByKey(params.key)>
		
		<!--- Verify that the sys_personstatus deletes successfully --->
		<cfif sys_personstatus.delete()>
			<cfset flashInsert(success="The sys_personstatus was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_personstatus.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
