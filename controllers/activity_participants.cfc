<cfcomponent extends="Controller" output="false">
	
	<!--- activity_participants/index --->
	<cffunction name="index">
		<cfset activity_participants = model("activity_participant").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_participants/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_participant = model("activity_participant").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_participant)>
	        <cfset flashInsert(error="activity_participant #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_participants/new --->
	<cffunction name="new">
		<cfset activity_participant = model("activity_participant").new()>
	</cffunction>
	
	<!--- activity_participants/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_participant = model("activity_participant").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_participant)>
	        <cfset flashInsert(error="activity_participant #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_participants/create --->
	<cffunction name="create">
		<cfset activity_participant = model("activity_participant").new(params.activity_participant)>
		
		<!--- Verify that the activity_participant creates successfully --->
		<cfif activity_participant.save()>
			<cfset flashInsert(success="The activity_participant was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_participant.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_participants/update --->
	<cffunction name="update">
		<cfset activity_participant = model("activity_participant").findByKey(params.key)>
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
			<cfset flashInsert(success="The activity_participant was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_participant.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_participants/delete/key --->
	<cffunction name="delete">
		<cfset activity_participant = model("activity_participant").findByKey(params.key)>
		
		<!--- Verify that the activity_participant deletes successfully --->
		<cfif activity_participant.delete()>
			<cfset flashInsert(success="The activity_participant was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_participant.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
