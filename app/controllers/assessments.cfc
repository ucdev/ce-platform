<cfcomponent extends="Controller" output="false">
	
	<!--- assessments/index --->
	<cffunction name="index">
		<cfset assessments = model("Assessment").findAll()>
	</cffunction>
	
	<!--- assessments/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset assessment = model("Assessment").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessment)>
	        <cfset flashInsert(error="Assessment #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- assessments/new --->
	<cffunction name="new">
		<cfset assessment = model("Assessment").new()>
	</cffunction>
	
	<!--- assessments/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset assessment = model("Assessment").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessment)>
	        <cfset flashInsert(error="Assessment #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- assessments/create --->
	<cffunction name="create">
		<cfset assessment = model("Assessment").new(params.assessment)>
		
		<!--- Verify that the assessment creates successfully --->
		<cfif assessment.save()>
			<cfset flashInsert(success="The assessment was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the assessment.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- assessments/update --->
	<cffunction name="update">
		<cfset assessment = model("Assessment").findByKey(params.key)>
		
		<!--- Verify that the assessment updates successfully --->
		<cfif assessment.update(params.assessment)>
			<cfset flashInsert(success="The assessment was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the assessment.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- assessments/delete/key --->
	<cffunction name="delete">
		<cfset assessment = model("Assessment").findByKey(params.key)>
		
		<!--- Verify that the assessment deletes successfully --->
		<cfif assessment.delete()>
			<cfset flashInsert(success="The assessment was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the assessment.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
