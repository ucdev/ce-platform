<cfcomponent extends="Controller" output="false">
	
	<!--- attendeecdcs/index --->
	<cffunction name="index">
		<cfset attendeecdcs = model("Attendeecdc").findAll()>
	</cffunction>
	
	<!--- attendeecdcs/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset attendeecdc = model("Attendeecdc").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendeecdc)>
	        <cfset flashInsert(error="Attendeecdc #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- attendeecdcs/new --->
	<cffunction name="new">
		<cfset attendeecdc = model("Attendeecdc").new()>
	</cffunction>
	
	<!--- attendeecdcs/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset attendeecdc = model("Attendeecdc").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(attendeecdc)>
	        <cfset flashInsert(error="Attendeecdc #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- attendeecdcs/create --->
	<cffunction name="create">
		<cfset attendeecdc = model("Attendeecdc").new(params.attendeecdc)>
		
		<!--- Verify that the attendeecdc creates successfully --->
		<cfif attendeecdc.save()>
			<cfset flashInsert(success="The attendeecdc was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the attendeecdc.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- attendeecdcs/update --->
	<cffunction name="update">
		<cfset attendeecdc = model("Attendeecdc").findByKey(params.key)>
		
		<!--- Verify that the attendeecdc updates successfully --->
		<cfif attendeecdc.update(params.attendeecdc)>
			<cfset flashInsert(success="The attendeecdc was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendeecdc.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- attendeecdcs/delete/key --->
	<cffunction name="delete">
		<cfset attendeecdc = model("Attendeecdc").findByKey(params.key)>
		
		<!--- Verify that the attendeecdc deletes successfully --->
		<cfif attendeecdc.delete()>
			<cfset flashInsert(success="The attendeecdc was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the attendeecdc.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
