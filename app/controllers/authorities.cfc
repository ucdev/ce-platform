<cfcomponent extends="Controller" output="false">
	
	<!--- authorities/index --->
	<cffunction name="index">
		<cfset authorities = model("Authority").findAll()>
	</cffunction>
	
	<!--- authorities/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset authority = model("Authority").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(authority)>
	        <cfset flashInsert(error="Authority #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- authorities/new --->
	<cffunction name="new">
		<cfset authority = model("Authority").new()>
	</cffunction>
	
	<!--- authorities/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset authority = model("Authority").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(authority)>
	        <cfset flashInsert(error="Authority #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- authorities/create --->
	<cffunction name="create">
		<cfset authority = model("Authority").new(params.authority)>
		
		<!--- Verify that the authority creates successfully --->
		<cfif authority.save()>
			<cfset flashInsert(success="The authority was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the authority.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- authorities/update --->
	<cffunction name="update">
		<cfset authority = model("Authority").findByKey(params.key)>
		
		<!--- Verify that the authority updates successfully --->
		<cfif authority.update(params.authority)>
			<cfset flashInsert(success="The authority was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the authority.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- authorities/delete/key --->
	<cffunction name="delete">
		<cfset authority = model("Authority").findByKey(params.key)>
		
		<!--- Verify that the authority deletes successfully --->
		<cfif authority.delete()>
			<cfset flashInsert(success="The authority was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the authority.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
