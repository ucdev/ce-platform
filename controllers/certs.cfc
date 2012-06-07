<cfcomponent extends="Controller" output="false">
	
	<!--- certs/index --->
	<cffunction name="index">
		<cfset certs = model("Cert").findAll()>
	</cffunction>
	
	<!--- certs/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset cert = model("Cert").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(cert)>
	        <cfset flashInsert(error="Cert #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- certs/new --->
	<cffunction name="new">
		<cfset cert = model("Cert").new()>
	</cffunction>
	
	<!--- certs/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset cert = model("Cert").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(cert)>
	        <cfset flashInsert(error="Cert #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- certs/create --->
	<cffunction name="create">
		<cfset cert = model("Cert").new(params.cert)>
		
		<!--- Verify that the cert creates successfully --->
		<cfif cert.save()>
			<cfset flashInsert(success="The cert was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the cert.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- certs/update --->
	<cffunction name="update">
		<cfset cert = model("Cert").findByKey(params.key)>
		
		<!--- Verify that the cert updates successfully --->
		<cfif cert.update(params.cert)>
			<cfset flashInsert(success="The cert was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the cert.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- certs/delete/key --->
	<cffunction name="delete">
		<cfset cert = model("Cert").findByKey(params.key)>
		
		<!--- Verify that the cert deletes successfully --->
		<cfif cert.delete()>
			<cfset flashInsert(success="The cert was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the cert.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
