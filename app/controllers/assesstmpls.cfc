<cfcomponent extends="Controller" output="false">
	
	<!--- assesstmpls/index --->
	<cffunction name="index">
		<cfset assesstmpls = model("Assesstmpl").findAll()>
	</cffunction>
	
	<!--- assesstmpls/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset assesstmpl = model("Assesstmpl").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assesstmpl)>
	        <cfset flashInsert(error="Assesstmpl #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- assesstmpls/new --->
	<cffunction name="new">
		<cfset assesstmpl = model("Assesstmpl").new()>
	</cffunction>
	
	<!--- assesstmpls/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset assesstmpl = model("Assesstmpl").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(assesstmpl)>
	        <cfset flashInsert(error="Assesstmpl #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- assesstmpls/create --->
	<cffunction name="create">
		<cfset assesstmpl = model("Assesstmpl").new(params.assesstmpl)>
		
		<!--- Verify that the assesstmpl creates successfully --->
		<cfif assesstmpl.save()>
			<cfset flashInsert(success="The assesstmpl was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the assesstmpl.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- assesstmpls/update --->
	<cffunction name="update">
		<cfset assesstmpl = model("Assesstmpl").findByKey(params.key)>
		
		<!--- Verify that the assesstmpl updates successfully --->
		<cfif assesstmpl.update(params.assesstmpl)>
			<cfset flashInsert(success="The assesstmpl was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the assesstmpl.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- assesstmpls/delete/key --->
	<cffunction name="delete">
		<cfset assesstmpl = model("Assesstmpl").findByKey(params.key)>
		
		<!--- Verify that the assesstmpl deletes successfully --->
		<cfif assesstmpl.delete()>
			<cfset flashInsert(success="The assesstmpl was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the assesstmpl.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
