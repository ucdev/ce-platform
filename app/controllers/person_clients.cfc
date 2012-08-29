<cfcomponent extends="Controller" output="false">
	
	<!--- person_clients/index --->
	<cffunction name="index">
		<cfset person_clients = model("Person_client").findAll()>
	</cffunction>
	
	<!--- person_clients/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_client = model("Person_client").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_client)>
	        <cfset flashInsert(error="Person_client #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_clients/new --->
	<cffunction name="new">
		<cfset person_client = model("Person_client").new()>
	</cffunction>
	
	<!--- person_clients/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_client = model("Person_client").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_client)>
	        <cfset flashInsert(error="Person_client #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_clients/create --->
	<cffunction name="create">
		<cfset person_client = model("Person_client").new(params.person_client)>
		
		<!--- Verify that the person_client creates successfully --->
		<cfif person_client.save()>
			<cfset flashInsert(success="The person_client was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_client.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_clients/update --->
	<cffunction name="update">
		<cfset person_client = model("Person_client").findByKey(params.key)>
		
		<!--- Verify that the person_client updates successfully --->
		<cfif person_client.update(params.person_client)>
			<cfset flashInsert(success="The person_client was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_client.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_clients/delete/key --->
	<cffunction name="delete">
		<cfset person_client = model("Person_client").findByKey(params.key)>
		
		<!--- Verify that the person_client deletes successfully --->
		<cfif person_client.delete()>
			<cfset flashInsert(success="The person_client was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_client.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
