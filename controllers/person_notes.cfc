<cfcomponent extends="Controller" output="false">
	
	<!--- person_notes/index --->
	<cffunction name="index">
		<cfset person_notes = model("Person_note").findAll()>
	</cffunction>
	
	<!--- person_notes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_note = model("Person_note").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_note)>
	        <cfset flashInsert(error="Person_note #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_notes/new --->
	<cffunction name="new">
		<cfset person_note = model("Person_note").new()>
	</cffunction>
	
	<!--- person_notes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_note = model("Person_note").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_note)>
	        <cfset flashInsert(error="Person_note #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_notes/create --->
	<cffunction name="create">
		<cfset person_note = model("Person_note").new(params.person_note)>
		
		<!--- Verify that the person_note creates successfully --->
		<cfif person_note.save()>
			<cfset flashInsert(success="The person_note was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_note.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_notes/update --->
	<cffunction name="update">
		<cfset person_note = model("Person_note").findByKey(params.key)>
		
		<!--- Verify that the person_note updates successfully --->
		<cfif person_note.update(params.person_note)>
			<cfset flashInsert(success="The person_note was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_note.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_notes/delete/key --->
	<cffunction name="delete">
		<cfset person_note = model("Person_note").findByKey(params.key)>
		
		<!--- Verify that the person_note deletes successfully --->
		<cfif person_note.delete()>
			<cfset flashInsert(success="The person_note was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_note.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
