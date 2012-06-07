<cfcomponent extends="Controller" output="false">
	
	<!--- certificates/index --->
	<cffunction name="index">
		<cfset certificates = model("Certificate").findAll()>
	</cffunction>
	
	<!--- certificates/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset certificate = model("Certificate").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(certificate)>
	        <cfset flashInsert(error="Certificate #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- certificates/new --->
	<cffunction name="new">
		<cfset certificate = model("Certificate").new()>
	</cffunction>
	
	<!--- certificates/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset certificate = model("Certificate").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(certificate)>
	        <cfset flashInsert(error="Certificate #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- certificates/create --->
	<cffunction name="create">
		<cfset certificate = model("Certificate").new(params.certificate)>
		
		<!--- Verify that the certificate creates successfully --->
		<cfif certificate.save()>
			<cfset flashInsert(success="The certificate was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the certificate.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- certificates/update --->
	<cffunction name="update">
		<cfset certificate = model("Certificate").findByKey(params.key)>
		
		<!--- Verify that the certificate updates successfully --->
		<cfif certificate.update(params.certificate)>
			<cfset flashInsert(success="The certificate was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the certificate.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- certificates/delete/key --->
	<cffunction name="delete">
		<cfset certificate = model("Certificate").findByKey(params.key)>
		
		<!--- Verify that the certificate deletes successfully --->
		<cfif certificate.delete()>
			<cfset flashInsert(success="The certificate was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the certificate.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
