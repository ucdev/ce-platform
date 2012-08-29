<cfcomponent extends="Controller" output="false">
	
	<!--- person_users/index --->
	<cffunction name="index">
		<cfset person_users = model("Person_user").findAll()>
	</cffunction>
	
	<!--- person_users/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_user = model("Person_user").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_user)>
	        <cfset flashInsert(error="Person_user #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_users/new --->
	<cffunction name="new">
		<cfset person_user = model("Person_user").new()>
	</cffunction>
	
	<!--- person_users/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_user = model("Person_user").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_user)>
	        <cfset flashInsert(error="Person_user #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_users/create --->
	<cffunction name="create">
		<cfset person_user = model("Person_user").new(params.person_user)>
		
		<!--- Verify that the person_user creates successfully --->
		<cfif person_user.save()>
			<cfset flashInsert(success="The person_user was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_user.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_users/update --->
	<cffunction name="update">
		<cfset person_user = model("Person_user").findByKey(params.key)>
		
		<!--- Verify that the person_user updates successfully --->
		<cfif person_user.update(params.person_user)>
			<cfset flashInsert(success="The person_user was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_user.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_users/delete/key --->
	<cffunction name="delete">
		<cfset person_user = model("Person_user").findByKey(params.key)>
		
		<!--- Verify that the person_user deletes successfully --->
		<cfif person_user.delete()>
			<cfset flashInsert(success="The person_user was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_user.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
