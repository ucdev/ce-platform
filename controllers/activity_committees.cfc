<cfcomponent extends="Controller" output="false">
	
	<!--- activity_committees/index --->
	<cffunction name="index">
		<cfset activity_committees = model("Activity_committee").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_committees/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_committee = model("Activity_committee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_committee)>
	        <cfset flashInsert(error="Activity_committee #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_committees/new --->
	<cffunction name="new">
		<cfset activity_committee = model("Activity_committee").new()>
	</cffunction>
	
	<!--- activity_committees/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_committee = model("Activity_committee").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_committee)>
	        <cfset flashInsert(error="Activity_committee #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_committees/create --->
	<cffunction name="create">
		<cfset activity_committee = model("Activity_committee").new(params.activity_committee)>
		
		<!--- Verify that the activity_committee creates successfully --->
		<cfif activity_committee.save()>
			<cfset flashInsert(success="The activity_committee was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_committee.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_committees/update --->
	<cffunction name="update">
		<cfset activity_committee = model("Activity_committee").findByKey(params.key)>
		
		<!--- Verify that the activity_committee updates successfully --->
		<cfif activity_committee.update(params.activity_committee)>
			<cfset flashInsert(success="The activity_committee was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_committee.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_committees/delete/key --->
	<cffunction name="delete">
		<cfset activity_committee = model("Activity_committee").findByKey(params.key)>
		
		<!--- Verify that the activity_committee deletes successfully --->
		<cfif activity_committee.delete()>
			<cfset flashInsert(success="The activity_committee was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_committee.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
