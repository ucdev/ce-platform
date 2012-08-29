<cfcomponent extends="Controller" output="false">
	
	<!--- degrees/index --->
	<cffunction name="index">
		<cfset degrees = model("Degree").findAll()>
	</cffunction>
	
	<!--- degrees/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset degree = model("Degree").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(degree)>
	        <cfset flashInsert(error="Degree #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- degrees/new --->
	<cffunction name="new">
		<cfset degree = model("Degree").new()>
	</cffunction>
	
	<!--- degrees/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset degree = model("Degree").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(degree)>
	        <cfset flashInsert(error="Degree #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- degrees/create --->
	<cffunction name="create">
		<cfset degree = model("Degree").new(params.degree)>
		
		<!--- Verify that the degree creates successfully --->
		<cfif degree.save()>
			<cfset flashInsert(success="The degree was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the degree.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- degrees/update --->
	<cffunction name="update">
		<cfset degree = model("Degree").findByKey(params.key)>
		
		<!--- Verify that the degree updates successfully --->
		<cfif degree.update(params.degree)>
			<cfset flashInsert(success="The degree was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the degree.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- degrees/delete/key --->
	<cffunction name="delete">
		<cfset degree = model("Degree").findByKey(params.key)>
		
		<!--- Verify that the degree deletes successfully --->
		<cfif degree.delete()>
			<cfset flashInsert(success="The degree was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the degree.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
