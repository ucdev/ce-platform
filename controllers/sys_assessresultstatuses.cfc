<cfcomponent extends="Controller" output="false">
	
	<!--- sys_assessresultstatuses/index --->
	<cffunction name="index">
		<cfset sys_assessresultstatuses = model("Sys_assessresultstatus").findAll()>
	</cffunction>
	
	<!--- sys_assessresultstatuses/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_assessresultstatus = model("Sys_assessresultstatus").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_assessresultstatus)>
	        <cfset flashInsert(error="Sys_assessresultstatus #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_assessresultstatuses/new --->
	<cffunction name="new">
		<cfset sys_assessresultstatus = model("Sys_assessresultstatus").new()>
	</cffunction>
	
	<!--- sys_assessresultstatuses/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_assessresultstatus = model("Sys_assessresultstatus").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_assessresultstatus)>
	        <cfset flashInsert(error="Sys_assessresultstatus #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_assessresultstatuses/create --->
	<cffunction name="create">
		<cfset sys_assessresultstatus = model("Sys_assessresultstatus").new(params.sys_assessresultstatus)>
		
		<!--- Verify that the sys_assessresultstatus creates successfully --->
		<cfif sys_assessresultstatus.save()>
			<cfset flashInsert(success="The sys_assessresultstatus was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_assessresultstatus.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_assessresultstatuses/update --->
	<cffunction name="update">
		<cfset sys_assessresultstatus = model("Sys_assessresultstatus").findByKey(params.key)>
		
		<!--- Verify that the sys_assessresultstatus updates successfully --->
		<cfif sys_assessresultstatus.update(params.sys_assessresultstatus)>
			<cfset flashInsert(success="The sys_assessresultstatus was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_assessresultstatus.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_assessresultstatuses/delete/key --->
	<cffunction name="delete">
		<cfset sys_assessresultstatus = model("Sys_assessresultstatus").findByKey(params.key)>
		
		<!--- Verify that the sys_assessresultstatus deletes successfully --->
		<cfif sys_assessresultstatus.delete()>
			<cfset flashInsert(success="The sys_assessresultstatus was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_assessresultstatus.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
