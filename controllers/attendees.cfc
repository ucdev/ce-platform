<cfcomponent extends="Controller" output="false">
	<!--- attendees/edit/key --->
	<cffunction name="edit">
		<!--- Find the record --->
    	<cfset activity_participant = model("attendee").findByKey(params.key)>
        <cfset statuses = model("Sys_attendeeStatus").findAll(order="name")>
        
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_participant)>
	        <cfset flashInsert(error="activity_participant #params.key# was not found")>
			<cfset redirectTo(controller='activity_participants',action='index', key=params.activityId)>
	    </cfif>
	</cffunction>
    
	<!--- attendees/edit_address/key --->
	<cffunction name="edit_address">
		<!--- Find the record --->
    	<cfset activity_participant = model("attendee_address").findByKey(params.key)>
        
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_participant)>
	        <cfset flashInsert(error="activity_participant #params.key# was not found")>
			<cfset redirectTo(controller='activity_participants',action='index', key=params.activityId)>
	    </cfif>
	</cffunction>
    
	<!--- attendees/edit_phone/key --->
	<cffunction name="edit_phone">
		<!--- Find the record --->
    	<cfset activity_participant = model("attendee_phone").findByKey(params.key)>
        
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_participant)>
	        <cfset flashInsert(error="activity_participant #params.key# was not found")>
			<cfset redirectTo(controller='activity_participants',action='index', key=params.activityId)>
	    </cfif>
	</cffunction>
	
	<!--- attendees/update --->
	<cffunction name="update">
		<cfset activity_participant = model("attendee").findByKey(params.key)>
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
			<cfset flashInsert(success="The attendee was updated successfully.")>	
            <cfset redirectTo(controller="activity_participants",action="index", key=params.activityId)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendee.")>
			<cfset renderPage(action="edit", params="activityId=" & params.activityid)>
		</cfif>
	</cffunction>
	
	<!--- attendees/update_address --->
	<cffunction name="update_address">
    	<cfset activity_participant = model("attendee_address").findByKey(params.key)>
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
			<cfset flashInsert(success="The attendee was updated successfully.")>	
            <cfset redirectTo(controller="activity_participants",action="index", key=params.activityId)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendee.")>
			<cfset renderPage(action="edit_address", params="activityId=" & params.activityid)>
		</cfif>
	</cffunction>
	
	<!--- attendees/update_phone --->
	<cffunction name="update_phone">
    	<cfset activity_participant = model("attendee_phone").findByKey(params.key)>
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
			<cfset flashInsert(success="The attendee was updated successfully.")>	
            <cfset redirectTo(controller="activity_participants",action="index", key=params.activityId)>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendee.")>
			<cfset renderPage(action="edit_phone", params="activityId=" & params.activityid)>
		</cfif>
	</cffunction>
</cfcomponent>