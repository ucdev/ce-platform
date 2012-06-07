<cfcomponent extends="Controller" output="false">
	
	<!--- assessresults/index --->
	<cffunction name="index">
		<cfset assessresults = model("Assessresult").findAll()>
	</cffunction>
	
	<!--- assessresults/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset assessresult = model("Assessresult").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessresult)>
	        <cfset flashInsert(error="Assessresult #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- assessresults/new --->
	<cffunction name="new">
		<cfset assessresult = model("Assessresult").new()>
	</cffunction>
	
	<!--- assessresults/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset assessresult = model("Assessresult").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assessresult)>
	        <cfset flashInsert(error="Assessresult #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- assessresults/create --->
	<cffunction name="create">
		<cfset assessresult = model("Assessresult").new(params.assessresult)>
		
		<!--- Verify that the assessresult creates successfully --->
		<cfif assessresult.save()>
			<cfset flashInsert(success="The assessresult was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the assessresult.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- assessresults/update --->
	<cffunction name="update">
		<cfset assessresult = model("Assessresult").findByKey(params.key)>
		
		<!--- Verify that the assessresult updates successfully --->
		<cfif assessresult.update(params.assessresult)>
			<cfset flashInsert(success="The assessresult was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the assessresult.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- assessresults/delete/key --->
	<cffunction name="delete">
		<cfset assessresult = model("Assessresult").findByKey(params.key)>
		
		<!--- Verify that the assessresult deletes successfully --->
		<cfif assessresult.delete()>
			<cfset flashInsert(success="The assessresult was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the assessresult.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
