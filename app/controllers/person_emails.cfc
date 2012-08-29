<cfcomponent extends="Controller" output="false">
	
	<!--- person_emails/index --->
	<cffunction name="index">
		<cfset person_emails = model("Person_email").findAll()>
	</cffunction>
	
	<!--- person_emails/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_email = model("Person_email").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_email)>
	        <cfset flashInsert(error="Person_email #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_emails/new --->
	<cffunction name="new">
		<cfset person_email = model("Person_email").new()>
	</cffunction>
	
	<!--- person_emails/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_email = model("Person_email").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_email)>
	        <cfset flashInsert(error="Person_email #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_emails/create --->
	<cffunction name="create">
		<cfset person_email = model("Person_email").new(params.person_email)>
		
		<!--- Verify that the person_email creates successfully --->
		<cfif person_email.save()>
			<cfset flashInsert(success="The person_email was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_email.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_emails/update --->
	<cffunction name="update">
		<cfset person_email = model("Person_email").findByKey(params.key)>
		
		<!--- Verify that the person_email updates successfully --->
		<cfif person_email.update(params.person_email)>
			<cfset flashInsert(success="The person_email was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_email.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_emails/delete/key --->
	<cffunction name="delete">
		<cfset person_email = model("Person_email").findByKey(params.key)>
		
		<!--- Verify that the person_email deletes successfully --->
		<cfif person_email.delete()>
			<cfset flashInsert(success="The person_email was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_email.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
