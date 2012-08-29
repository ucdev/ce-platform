<cfcomponent extends="Controller" output="false">
	
	<!--- cert_credits/index --->
	<cffunction name="index">
		<cfset cert_credits = model("Cert_credit").findAll()>
	</cffunction>
	
	<!--- cert_credits/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset cert_credit = model("Cert_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(cert_credit)>
	        <cfset flashInsert(error="Cert_credit #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- cert_credits/new --->
	<cffunction name="new">
		<cfset cert_credit = model("Cert_credit").new()>
	</cffunction>
	
	<!--- cert_credits/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset cert_credit = model("Cert_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(cert_credit)>
	        <cfset flashInsert(error="Cert_credit #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- cert_credits/create --->
	<cffunction name="create">
		<cfset cert_credit = model("Cert_credit").new(params.cert_credit)>
		
		<!--- Verify that the cert_credit creates successfully --->
		<cfif cert_credit.save()>
			<cfset flashInsert(success="The cert_credit was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the cert_credit.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- cert_credits/update --->
	<cffunction name="update">
		<cfset cert_credit = model("Cert_credit").findByKey(params.key)>
		
		<!--- Verify that the cert_credit updates successfully --->
		<cfif cert_credit.update(params.cert_credit)>
			<cfset flashInsert(success="The cert_credit was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the cert_credit.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- cert_credits/delete/key --->
	<cffunction name="delete">
		<cfset cert_credit = model("Cert_credit").findByKey(params.key)>
		
		<!--- Verify that the cert_credit deletes successfully --->
		<cfif cert_credit.delete()>
			<cfset flashInsert(success="The cert_credit was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the cert_credit.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
