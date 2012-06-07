<cfcomponent extends="Controller" output="false">
	
	<!--- person_degrees/index --->
	<cffunction name="index">
		<cfset person_degrees = model("Person_degree").findAll()>
	</cffunction>
	
	<!--- person_degrees/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_degree = model("Person_degree").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_degree)>
	        <cfset flashInsert(error="Person_degree #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_degrees/new --->
	<cffunction name="new">
		<cfset person_degree = model("Person_degree").new()>
	</cffunction>
	
	<!--- person_degrees/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_degree = model("Person_degree").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_degree)>
	        <cfset flashInsert(error="Person_degree #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_degrees/create --->
	<cffunction name="create">
		<cfset person_degree = model("Person_degree").new(params.person_degree)>
		
		<!--- Verify that the person_degree creates successfully --->
		<cfif person_degree.save()>
			<cfset flashInsert(success="The person_degree was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_degree.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_degrees/update --->
	<cffunction name="update">
		<cfset person_degree = model("Person_degree").findByKey(params.key)>
		
		<!--- Verify that the person_degree updates successfully --->
		<cfif person_degree.update(params.person_degree)>
			<cfset flashInsert(success="The person_degree was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_degree.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_degrees/delete/key --->
	<cffunction name="delete">
		<cfset person_degree = model("Person_degree").findByKey(params.key)>
		
		<!--- Verify that the person_degree deletes successfully --->
		<cfif person_degree.delete()>
			<cfset flashInsert(success="The person_degree was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_degree.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
