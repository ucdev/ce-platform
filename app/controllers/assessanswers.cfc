<cfcomponent extends="Controller" output="false">
	
	<!--- assessanswers/index --->
	<cffunction name="index">
		<cfset assessanswers = model("Assessanswer").findAll()>
	</cffunction>
	
	<!--- assessanswers/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset assessanswer = model("Assessanswer").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessanswer)>
	        <cfset flashInsert(error="Assessanswer #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- assessanswers/new --->
	<cffunction name="new">
		<cfset assessanswer = model("Assessanswer").new()>
	</cffunction>
	
	<!--- assessanswers/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset assessanswer = model("Assessanswer").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessanswer)>
	        <cfset flashInsert(error="Assessanswer #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- assessanswers/create --->
	<cffunction name="create">
		<cfset assessanswer = model("Assessanswer").new(params.assessanswer)>
		
		<!--- Verify that the assessanswer creates successfully --->
		<cfif assessanswer.save()>
			<cfset flashInsert(success="The assessanswer was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the assessanswer.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- assessanswers/update --->
	<cffunction name="update">
		<cfset assessanswer = model("Assessanswer").findByKey(params.key)>
		
		<!--- Verify that the assessanswer updates successfully --->
		<cfif assessanswer.update(params.assessanswer)>
			<cfset flashInsert(success="The assessanswer was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the assessanswer.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- assessanswers/delete/key --->
	<cffunction name="delete">
		<cfset assessanswer = model("Assessanswer").findByKey(params.key)>
		
		<!--- Verify that the assessanswer deletes successfully --->
		<cfif assessanswer.delete()>
			<cfset flashInsert(success="The assessanswer was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the assessanswer.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
