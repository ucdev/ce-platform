<cfcomponent extends="Controller" output="false">
	
	<!--- attendeecredits/index --->
	<cffunction name="index">
		<cfset attendeecredits = model("Attendeecredit").findAll()>
	</cffunction>
	
	<!--- attendeecredits/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset attendeecredit = model("Attendeecredit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendeecredit)>
	        <cfset flashInsert(error="Attendeecredit #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- attendeecredits/new --->
	<cffunction name="new">
		<cfset attendeecredit = model("Attendeecredit").new()>
	</cffunction>
	
	<!--- attendeecredits/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset attendeecredit = model("Attendeecredit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendeecredit)>
	        <cfset flashInsert(error="Attendeecredit #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- attendeecredits/create --->
	<cffunction name="create">
		<cfset attendeecredit = model("Attendeecredit").new(params.attendeecredit)>
		
		<!--- Verify that the attendeecredit creates successfully --->
		<cfif attendeecredit.save()>
			<cfset flashInsert(success="The attendeecredit was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the attendeecredit.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- attendeecredits/update --->
	<cffunction name="update">
		<cfset attendeecredit = model("Attendeecredit").findByKey(params.key)>
		
		<!--- Verify that the attendeecredit updates successfully --->
		<cfif attendeecredit.update(params.attendeecredit)>
			<cfset flashInsert(success="The attendeecredit was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendeecredit.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- attendeecredits/delete/key --->
	<cffunction name="delete">
		<cfset attendeecredit = model("Attendeecredit").findByKey(params.key)>
		
		<!--- Verify that the attendeecredit deletes successfully --->
		<cfif attendeecredit.delete()>
			<cfset flashInsert(success="The attendeecredit was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the attendeecredit.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
