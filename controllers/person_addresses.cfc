<cfcomponent extends="Controller" output="false">
	
	<!--- person_addresses/index --->
	<cffunction name="index">
		<cfset person_addresses = model("Person_address").findAll()>
	</cffunction>
	
	<!--- person_addresses/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_address = model("Person_address").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_address)>
	        <cfset flashInsert(error="Person_address #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_addresses/new --->
	<cffunction name="new">
		<cfset person_address = model("Person_address").new()>
	</cffunction>
	
	<!--- person_addresses/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_address = model("Person_address").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_address)>
	        <cfset flashInsert(error="Person_address #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_addresses/create --->
	<cffunction name="create">
		<cfset person_address = model("Person_address").new(params.person_address)>
		
		<!--- Verify that the person_address creates successfully --->
		<cfif person_address.save()>
			<cfset flashInsert(success="The person_address was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_address.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_addresses/update --->
	<cffunction name="update">
		<cfset person_address = model("Person_address").findByKey(params.key)>
		
		<!--- Verify that the person_address updates successfully --->
		<cfif person_address.update(params.person_address)>
			<cfset flashInsert(success="The person_address was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_address.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_addresses/delete/key --->
	<cffunction name="delete">
		<cfset person_address = model("Person_address").findByKey(params.key)>
		
		<!--- Verify that the person_address deletes successfully --->
		<cfif person_address.delete()>
			<cfset flashInsert(success="The person_address was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_address.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
