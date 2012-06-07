<cfcomponent extends="Controller" output="false">
	
	<!--- assesssections/index --->
	<cffunction name="index">
		<cfset assesssections = model("Assesssection").findAll()>
	</cffunction>
	
	<!--- assesssections/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset assesssection = model("Assesssection").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assesssection)>
	        <cfset flashInsert(error="Assesssection #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- assesssections/new --->
	<cffunction name="new">
		<cfset assesssection = model("Assesssection").new()>
	</cffunction>
	
	<!--- assesssections/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset assesssection = model("Assesssection").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assesssection)>
	        <cfset flashInsert(error="Assesssection #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- assesssections/create --->
	<cffunction name="create">
		<cfset assesssection = model("Assesssection").new(params.assesssection)>
		
		<!--- Verify that the assesssection creates successfully --->
		<cfif assesssection.save()>
			<cfset flashInsert(success="The assesssection was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the assesssection.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- assesssections/update --->
	<cffunction name="update">
		<cfset assesssection = model("Assesssection").findByKey(params.key)>
		
		<!--- Verify that the assesssection updates successfully --->
		<cfif assesssection.update(params.assesssection)>
			<cfset flashInsert(success="The assesssection was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the assesssection.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- assesssections/delete/key --->
	<cffunction name="delete">
		<cfset assesssection = model("Assesssection").findByKey(params.key)>
		
		<!--- Verify that the assesssection deletes successfully --->
		<cfif assesssection.delete()>
			<cfset flashInsert(success="The assesssection was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the assesssection.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
