<cfcomponent extends="Controller" output="false">
	
	<!--- activity_finfees/index --->
	<cffunction name="index">
		<cfset activity_finfees = model("Activity_finfee").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_finfees/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_finfee = model("Activity_finfee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finfee)>
	        <cfset flashInsert(error="Activity_finfee #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_finfees/new --->
	<cffunction name="new">
		<cfset activity_finfee = model("Activity_finfee").new()>
	</cffunction>
	
	<!--- activity_finfees/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_finfee = model("Activity_finfee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finfee)>
	        <cfset flashInsert(error="Activity_finfee #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_finfees/create --->
	<cffunction name="create">
		<cfset activity_finfee = model("Activity_finfee").new(params.activity_finfee)>
		
		<!--- Verify that the activity_finfee creates successfully --->
		<cfif activity_finfee.save()>
			<cfset flashInsert(success="The activity_finfee was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_finfee.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_finfees/update --->
	<cffunction name="update">
		<cfset activity_finfee = model("Activity_finfee").findByKey(params.key)>
		
		<!--- Verify that the activity_finfee updates successfully --->
		<cfif activity_finfee.update(params.activity_finfee)>
			<cfset flashInsert(success="The activity_finfee was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_finfee.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_finfees/delete/key --->
	<cffunction name="delete">
		<cfset activity_finfee = model("Activity_finfee").findByKey(params.key)>
		
		<!--- Verify that the activity_finfee deletes successfully --->
		<cfif activity_finfee.delete()>
			<cfset flashInsert(success="The activity_finfee was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_finfee.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
