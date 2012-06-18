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
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
    	<cfset var activity_participant = model("attendee").findByKey(params.key)>
        
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Attendee Update Failed.")>
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
        	<cfset status.setStatus(true)>
			<cfset status.setStatusMsg("The attendee was updated successfully.")>
		<!--- Otherwise --->
		<cfelse>
			<cfset status.setStatusMsg("There was an error updating the attendee.")>
		</cfif>
        
        <cfset renderText(status.getJSON()) />
	</cffunction>
	
	<!--- attendees/update_address --->
	<cffunction name="update_address">
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
    	<cfset var activity_participant = model("attendee_address").findByKey(params.key)>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Attendee Address Update Failed.")>
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
			<cfset flashInsert(success="The attendee was updated successfully.")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendee.")>
		</cfif>
        
        <cfset renderText(status.getJSON()) />
	</cffunction>
	
	<!--- attendees/update_phone --->
	<cffunction name="update_phone">
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
    	<cfset var activity_participant = model("attendee_phone").findByKey(params.key)>
		
		<cfcontent type="text/javascript" />
		
		<cfset status.setStatus(false)>
		<cfset status.setStatusMsg("Attendee Phone Update Failed.")>
        
		
		<!--- Verify that the activity_participant updates successfully --->
		<cfif activity_participant.update(params.activity_participant)>
			<cfset flashInsert(success="The attendee was updated successfully.")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the attendee.")>
		</cfif>
        
        <cfset renderText(status.getJSON()) />
	</cffunction>
</cfcomponent>