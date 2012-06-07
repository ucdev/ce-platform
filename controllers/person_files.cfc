<cfcomponent extends="Controller" output="false">
	
	<!--- person_files/index --->
	<cffunction name="index">
		<cfset person_files = model("Person_file").findAll()>
	</cffunction>
	
	<!--- person_files/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_file = model("Person_file").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_file)>
	        <cfset flashInsert(error="Person_file #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_files/new --->
	<cffunction name="new">
		<cfset person_file = model("Person_file").new()>
	</cffunction>
	
	<!--- person_files/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_file = model("Person_file").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_file)>
	        <cfset flashInsert(error="Person_file #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_files/create --->
	<cffunction name="create">
		<cfset person_file = model("Person_file").new(params.person_file)>
		
		<!--- Verify that the person_file creates successfully --->
		<cfif person_file.save()>
			<cfset flashInsert(success="The person_file was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_file.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_files/update --->
	<cffunction name="update">
		<cfset person_file = model("Person_file").findByKey(params.key)>
		
		<!--- Verify that the person_file updates successfully --->
		<cfif person_file.update(params.person_file)>
			<cfset flashInsert(success="The person_file was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_file.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_files/delete/key --->
	<cffunction name="delete">
		<cfset person_file = model("Person_file").findByKey(params.key)>
		
		<!--- Verify that the person_file deletes successfully --->
		<cfif person_file.delete()>
			<cfset flashInsert(success="The person_file was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_file.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
