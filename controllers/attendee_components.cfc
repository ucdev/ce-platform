<cfcomponent extends="Controller" output="false">
	
	<!--- attendee_components/index --->
	<cffunction name="index">
		<cfset attendee_components = model("Attendee_component").findAll()>
	</cffunction>
	
	<!--- attendee_components/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset attendee_component = model("Attendee_component").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendee_component)>
	        <cfset flashInsert(error="Attendee_component #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- attendee_components/new --->
	<cffunction name="new">
		<cfset attendee_component = model("Attendee_component").new()>
	</cffunction>
	
	<!--- attendee_components/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset attendee_component = model("Attendee_component").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendee_component)>
	        <cfset flashInsert(error="Attendee_component #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- attendee_components/create --->
	<cffunction name="create">
		<cfset attendee_component = model("Attendee_component").new(params.attendee_component)>
		
		<!--- Verify that the attendee_component creates successfully --->
		<cfif attendee_component.save()>
			<cfset flashInsert(success="The attendee_component was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the attendee_component.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- attendee_components/update --->
	<cffunction name="update">
		<cfset attendee_component = model("Attendee_component").findByKey(params.key)>
		
		<!--- Verify that the attendee_component updates successfully --->
		<cfif attendee_component.update(params.attendee_component)>
			<cfset flashInsert(success="The attendee_component was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendee_component.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- attendee_components/delete/key --->
	<cffunction name="delete">
		<cfset attendee_component = model("Attendee_component").findByKey(params.key)>
		
		<!--- Verify that the attendee_component deletes successfully --->
		<cfif attendee_component.delete()>
			<cfset flashInsert(success="The attendee_component was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the attendee_component.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
