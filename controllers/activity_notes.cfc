<cfcomponent extends="Controller" output="false">
	
	<cffunction name="init">
		<cfset filters(through="loginRequired") />
		<cfset filters(through="adminRequired") />
		<cfset super.init() />
	</cffunction>
	
	<!--- activity_notes/index --->
	<cffunction name="index">
		<cfset activity_notes = model("Activity_note").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_notes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_note = model("Activity_note").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_note)>
	        <cfset flashInsert(error="Activity_note #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_notes/new --->
	<cffunction name="new">
		<cfset activity_note = model("Activity_note").new()>
	</cffunction>
	
	<!--- activity_notes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_note = model("Activity_note").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_note)>
	        <cfset flashInsert(error="Activity_note #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_notes/create --->
	<cffunction name="create">
		<cfset activity_note = model("Activity_note").new(params.activity_note)>
		
		<!--- Verify that the activity_note creates successfully --->
		<cfif activity_note.save()>
			<cfset flashInsert(success="The activity_note was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_note.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_notes/update --->
	<cffunction name="update">
		<cfset activity_note = model("Activity_note").findByKey(params.key)>
		
		<!--- Verify that the activity_note updates successfully --->
		<cfif activity_note.update(params.activity_note)>
			<cfset flashInsert(success="The activity_note was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_note.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_notes/delete/key --->
	<cffunction name="delete">
		<cfset activity_note = model("Activity_note").findByKey(params.key)>
		
		<!--- Verify that the activity_note deletes successfully --->
		<cfif activity_note.delete()>
			<cfset flashInsert(success="The activity_note was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_note.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
