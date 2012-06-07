<cfcomponent extends="Controller" output="false">
	
	<!--- agendas/index --->
	<cffunction name="index">
		<cfset agendas = model("Agenda").findAll()>
	</cffunction>
	
	<!--- agendas/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset agenda = model("Agenda").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(agenda)>
	        <cfset flashInsert(error="Agenda #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- agendas/new --->
	<cffunction name="new">
		<cfset agenda = model("Agenda").new()>
	</cffunction>
	
	<!--- agendas/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset agenda = model("Agenda").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(agenda)>
	        <cfset flashInsert(error="Agenda #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- agendas/create --->
	<cffunction name="create">
		<cfset agenda = model("Agenda").new(params.agenda)>
		
		<!--- Verify that the agenda creates successfully --->
		<cfif agenda.save()>
			<cfset flashInsert(success="The agenda was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the agenda.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- agendas/update --->
	<cffunction name="update">
		<cfset agenda = model("Agenda").findByKey(params.key)>
		
		<!--- Verify that the agenda updates successfully --->
		<cfif agenda.update(params.agenda)>
			<cfset flashInsert(success="The agenda was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the agenda.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- agendas/delete/key --->
	<cffunction name="delete">
		<cfset agenda = model("Agenda").findByKey(params.key)>
		
		<!--- Verify that the agenda deletes successfully --->
		<cfif agenda.delete()>
			<cfset flashInsert(success="The agenda was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the agenda.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
