<cfcomponent extends="Controller" output="false">
	
	<!--- activityfinfees/index --->
	<cffunction name="index">
		<cfset activityfinfees = model("Activityfinfee").findAll()>
	</cffunction>
	
	<!--- activityfinfees/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activityfinfee = model("Activityfinfee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activityfinfee)>
	        <cfset flashInsert(error="Activityfinfee #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activityfinfees/new --->
	<cffunction name="new">
		<cfset activityfinfee = model("Activityfinfee").new()>
	</cffunction>
	
	<!--- activityfinfees/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activityfinfee = model("Activityfinfee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activityfinfee)>
	        <cfset flashInsert(error="Activityfinfee #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activityfinfees/create --->
	<cffunction name="create">
		<cfset activityfinfee = model("Activityfinfee").new(params.activityfinfee)>
		
		<!--- Verify that the activityfinfee creates successfully --->
		<cfif activityfinfee.save()>
			<cfset flashInsert(success="The activityfinfee was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activityfinfee.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activityfinfees/update --->
	<cffunction name="update">
		<cfset activityfinfee = model("Activityfinfee").findByKey(params.key)>
		
		<!--- Verify that the activityfinfee updates successfully --->
		<cfif activityfinfee.update(params.activityfinfee)>
			<cfset flashInsert(success="The activityfinfee was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activityfinfee.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activityfinfees/delete/key --->
	<cffunction name="delete">
		<cfset activityfinfee = model("Activityfinfee").findByKey(params.key)>
		
		<!--- Verify that the activityfinfee deletes successfully --->
		<cfif activityfinfee.delete()>
			<cfset flashInsert(success="The activityfinfee was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activityfinfee.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
