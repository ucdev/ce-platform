<cfcomponent extends="Controller" output="false">
	
	<!--- sys_attendeestatuses/index --->
	<cffunction name="index">
		<cfset sys_attendeestatuses = model("Sys_attendeestatus").findAll()>
	</cffunction>
	
	<!--- sys_attendeestatuses/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_attendeestatus = model("Sys_attendeestatus").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_attendeestatus)>
	        <cfset flashInsert(error="Sys_attendeestatus #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_attendeestatuses/new --->
	<cffunction name="new">
		<cfset sys_attendeestatus = model("Sys_attendeestatus").new()>
	</cffunction>
	
	<!--- sys_attendeestatuses/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_attendeestatus = model("Sys_attendeestatus").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_attendeestatus)>
	        <cfset flashInsert(error="Sys_attendeestatus #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_attendeestatuses/create --->
	<cffunction name="create">
		<cfset sys_attendeestatus = model("Sys_attendeestatus").new(params.sys_attendeestatus)>
		
		<!--- Verify that the sys_attendeestatus creates successfully --->
		<cfif sys_attendeestatus.save()>
			<cfset flashInsert(success="The sys_attendeestatus was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_attendeestatus.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_attendeestatuses/update --->
	<cffunction name="update">
		<cfset sys_attendeestatus = model("Sys_attendeestatus").findByKey(params.key)>
		
		<!--- Verify that the sys_attendeestatus updates successfully --->
		<cfif sys_attendeestatus.update(params.sys_attendeestatus)>
			<cfset flashInsert(success="The sys_attendeestatus was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_attendeestatus.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_attendeestatuses/delete/key --->
	<cffunction name="delete">
		<cfset sys_attendeestatus = model("Sys_attendeestatus").findByKey(params.key)>
		
		<!--- Verify that the sys_attendeestatus deletes successfully --->
		<cfif sys_attendeestatus.delete()>
			<cfset flashInsert(success="The sys_attendeestatus was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_attendeestatus.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
