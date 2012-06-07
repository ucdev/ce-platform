<cfcomponent extends="Controller" output="false">
	
	<!--- assessquestions/index --->
	<cffunction name="index">
		<cfset assessquestions = model("Assessquestion").findAll()>
	</cffunction>
	
	<!--- assessquestions/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset assessquestion = model("Assessquestion").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessquestion)>
	        <cfset flashInsert(error="Assessquestion #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- assessquestions/new --->
	<cffunction name="new">
		<cfset assessquestion = model("Assessquestion").new()>
	</cffunction>
	
	<!--- assessquestions/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset assessquestion = model("Assessquestion").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessquestion)>
	        <cfset flashInsert(error="Assessquestion #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- assessquestions/create --->
	<cffunction name="create">
		<cfset assessquestion = model("Assessquestion").new(params.assessquestion)>
		
		<!--- Verify that the assessquestion creates successfully --->
		<cfif assessquestion.save()>
			<cfset flashInsert(success="The assessquestion was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the assessquestion.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- assessquestions/update --->
	<cffunction name="update">
		<cfset assessquestion = model("Assessquestion").findByKey(params.key)>
		
		<!--- Verify that the assessquestion updates successfully --->
		<cfif assessquestion.update(params.assessquestion)>
			<cfset flashInsert(success="The assessquestion was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the assessquestion.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- assessquestions/delete/key --->
	<cffunction name="delete">
		<cfset assessquestion = model("Assessquestion").findByKey(params.key)>
		
		<!--- Verify that the assessquestion deletes successfully --->
		<cfif assessquestion.delete()>
			<cfset flashInsert(success="The assessquestion was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the assessquestion.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
