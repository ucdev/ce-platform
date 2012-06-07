<cfcomponent extends="Controller" output="false">
	
	<!--- attendees/index --->
	<cffunction name="index">
		<cfset attendees = model("Attendee").findAll()>
	</cffunction>
	
	<!--- attendees/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset attendee = model("Attendee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendee)>
	        <cfset flashInsert(error="Attendee #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- attendees/new --->
	<cffunction name="new">
		<cfset attendee = model("Attendee").new()>
	</cffunction>
	
	<!--- attendees/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset attendee = model("Attendee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendee)>
	        <cfset flashInsert(error="Attendee #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- attendees/create --->
	<cffunction name="create">
		<cfset attendee = model("Attendee").new(params.attendee)>
		
		<!--- Verify that the attendee creates successfully --->
		<cfif attendee.save()>
			<cfset flashInsert(success="The attendee was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the attendee.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- attendees/update --->
	<cffunction name="update">
		<cfset attendee = model("Attendee").findByKey(params.key)>
		
		<!--- Verify that the attendee updates successfully --->
		<cfif attendee.update(params.attendee)>
			<cfset flashInsert(success="The attendee was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendee.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- attendees/delete/key --->
	<cffunction name="delete">
		<cfset attendee = model("Attendee").findByKey(params.key)>
		
		<!--- Verify that the attendee deletes successfully --->
		<cfif attendee.delete()>
			<cfset flashInsert(success="The attendee was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the attendee.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
