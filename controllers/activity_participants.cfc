<cfcomponent extends="Controller" output="false">
	
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
	
	<!--- activity_participants/index --->
	<cffunction name="index">
		<cfparam name="params.key" type="integer" />
		<cfparam name="params.status" type="numeric" default="0" />
        <cfparam name="params.page" type="numeric" default="1" />
		
		<cfset showInfoBar(false) />
        
		<cfset qAttendees = Application.activityAttendee.getAttendees(ActivityID=params.key,DeletedFlag="N")>
		<cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=params.key)>
		
		<!--- LEGACY FIX --->
		<cfset attributes.status = params.status />
		
		<!--- TOTALATTENDEELIST IS USED FOR SELECTING ALL ATTENDEES IN AN ACTIVITY --->
		<cfset TotalAttendeeList = "">
		<cfset totalCount = qAttendees.recordCount>
		<cfset completeCount = 0>
		<cfset failCount = 0>
		<cfset progressCount = 0>
		<cfset registeredCount = 0>
		
		<cfloop query="qAttendees">
			<cfswitch expression="#qAttendees.statusId#">
				<cfcase value="1">
					<cfset completeCount++>
				</cfcase>
				<cfcase value="2">
					<cfset progressCount++>
				</cfcase>
				<cfcase value="3">
					<cfset registeredCount++>
				</cfcase>
				<cfcase value="4">
					<cfset failCount++>
				</cfcase>
			</cfswitch>
		</cfloop>
		
		<cfif params.status EQ 0 AND structKeyExists(cookie, "user_attendeeStatus") AND getToken(cookie.USER_AttendeeStatus,1,"|") EQ params.key>
			<cfset params.status = getToken(cookie.USER_AttendeeStatus,2,"|")>
		</cfif>
	</cffunction>
	
	<!--- activity_participants/new --->
	<cffunction name="new">
		<cfset activity_participant = model("activity_participant").new()>
	</cffunction>
    
    <!--- activity_participants/search --->
    <cffunction name="search">
    	<cfparam name="params.key" default="0" />
    	<cfparam name="params.q" default="" />
        
		<cfset params.q = listToArray(replace(trim(params.q), " ", ",", "ALL"))>
        
        <cfset qActivityCredits = Application.Com.ActivityCreditGateway.getByViewAttributes(ActivityID=params.key)>
        <cfset qAttendees = model("Activity_participant").searchActivity(params.key, params.q)>
        
        <!--- TOTALATTENDEELIST IS USED FOR SELECTING ALL ATTENDEES IN AN ACTIVITY --->
        <cfset TotalAttendeeList = "">
        <cfset totalCount = qAttendees.recordCount>
        <cfset completeCount = 0>
        <cfset failCount = 0>
        <cfset progressCount = 0>
        <cfset registeredCount = 0>
        
        <cfloop query="qAttendees">
            <cfset TotalAttendeeList = ListAppend(TotalAttendeeList, qAttendees.PersonID,",")>
            
            <cfswitch expression="#qAttendees.statusId#">
                <cfcase value="1">
                    <cfset completeCount++>
                </cfcase>
                <cfcase value="2">
                    <cfset progressCount++>
                </cfcase>
                <cfcase value="3">
                    <cfset registeredCount++>
                </cfcase>
                <cfcase value="4">
                    <cfset failCount++>
                </cfcase>
            </cfswitch>
        </cfloop>
    
        <cfset AttendeePager = CreateObject("component","#Application.Settings.Com#Pagination").init()>
        <cfset AttendeePager.setQueryToPaginate(qAttendees)>
        <cfset AttendeePager.setPreviousLinkHTML("&larr; Previous") />
        <cfset AttendeePager.setNextLinkHTML("Next &rarr;") />
        <cfset AttendeePager.setItemsPerPage(15) />
        <cfset AttendeePager.setNumericDistanceFromCurrentPageVisible(1) />
        <cfset AttendeePager.setNumericEndBufferCount(2) />
        <cfset AttendeePager.setMissingNumbersHTML('...') />
        <cfset AttendeePager.setUrlPageIndicator("page") />
        <cfset AttendeePager.setShowNumericLinks(true) />
        <cfset AttendeePager.setClassName("pager") />
    	
        <cfset renderPage(action="ahah",layout=false)>
        <!---<cfset renderText(status.getJSON()) />--->
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
</cfcomponent>
