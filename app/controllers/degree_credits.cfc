<cfcomponent extends="Controller" output="false">
	
	<!--- degree_credits/index --->
	<cffunction name="index">
		<cfset degree_credits = model("Degree_credit").findAll()>
	</cffunction>
	
	<!--- degree_credits/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset degree_credit = model("Degree_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(degree_credit)>
	        <cfset flashInsert(error="Degree_credit #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- degree_credits/new --->
	<cffunction name="new">
		<cfset degree_credit = model("Degree_credit").new()>
	</cffunction>
	
	<!--- degree_credits/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset degree_credit = model("Degree_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(degree_credit)>
	        <cfset flashInsert(error="Degree_credit #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- degree_credits/create --->
	<cffunction name="create">
		<cfset degree_credit = model("Degree_credit").new(params.degree_credit)>
		
		<!--- Verify that the degree_credit creates successfully --->
		<cfif degree_credit.save()>
			<cfset flashInsert(success="The degree_credit was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the degree_credit.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- degree_credits/update --->
	<cffunction name="update">
		<cfset degree_credit = model("Degree_credit").findByKey(params.key)>
		
		<!--- Verify that the degree_credit updates successfully --->
		<cfif degree_credit.update(params.degree_credit)>
			<cfset flashInsert(success="The degree_credit was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the degree_credit.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- degree_credits/delete/key --->
	<cffunction name="delete">
		<cfset degree_credit = model("Degree_credit").findByKey(params.key)>
		
		<!--- Verify that the degree_credit deletes successfully --->
		<cfif degree_credit.delete()>
			<cfset flashInsert(success="The degree_credit was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the degree_credit.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
