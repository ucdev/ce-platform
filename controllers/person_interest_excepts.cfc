<cfcomponent extends="Controller" output="false">
	
	<!--- person_interest_excepts/index --->
	<cffunction name="index">
		<cfset person_interest_excepts = model("Person_interest_except").findAll()>
	</cffunction>
	
	<!--- person_interest_excepts/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_interest_except = model("Person_interest_except").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_interest_except)>
	        <cfset flashInsert(error="Person_interest_except #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_interest_excepts/new --->
	<cffunction name="new">
		<cfset person_interest_except = model("Person_interest_except").new()>
	</cffunction>
	
	<!--- person_interest_excepts/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_interest_except = model("Person_interest_except").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_interest_except)>
	        <cfset flashInsert(error="Person_interest_except #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_interest_excepts/create --->
	<cffunction name="create">
		<cfset person_interest_except = model("Person_interest_except").new(params.person_interest_except)>
		
		<!--- Verify that the person_interest_except creates successfully --->
		<cfif person_interest_except.save()>
			<cfset flashInsert(success="The person_interest_except was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_interest_except.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_interest_excepts/update --->
	<cffunction name="update">
		<cfset person_interest_except = model("Person_interest_except").findByKey(params.key)>
		
		<!--- Verify that the person_interest_except updates successfully --->
		<cfif person_interest_except.update(params.person_interest_except)>
			<cfset flashInsert(success="The person_interest_except was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_interest_except.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_interest_excepts/delete/key --->
	<cffunction name="delete">
		<cfset person_interest_except = model("Person_interest_except").findByKey(params.key)>
		
		<!--- Verify that the person_interest_except deletes successfully --->
		<cfif person_interest_except.delete()>
			<cfset flashInsert(success="The person_interest_except was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_interest_except.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
