<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset super.init() />
	</cffunction>
	<!---  activity_accmes/index --->
	<cffunction name="index">
		<cfset activity_accmes = model("activity_other").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!---  activity_accmes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_accme = model("activity_other").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_other)>
	        <cfset flashInsert(error="activity_other #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!---  activity_accmes/new --->
	<cffunction name="new">
		<cfset activity_accme = model("activity_other").new()>
	</cffunction>
	
	<!---  activity_accmes/edit/key --->
	<cffunction name="edit">
			
	</cffunction>
	
	<!---  activity_accmes/create --->
	<cffunction name="create">
		<cfset activity_accme = model("activity_other").new(params.activity_other)>
		
		<!--- Verify that the activity_other creates successfully --->
		<cfif activity_other.save()>
			<cfset flashInsert(success="The activity_other was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_other.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!---  activity_accmes/update --->
	<cffunction name="update">
		<cfset activity_accme = model("activity_other").findByKey(params.key)>
		
		<!--- Verify that the activity_other updates successfully --->
		<cfif activity_other.update(params.activity_other)>
			<cfset flashInsert(success="The activity_other was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_other.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!---  activity_accmes/delete/key --->
	<cffunction name="delete">
		<cfset activity_accme = model("activity_other").findByKey(params.key)>
		
		<!--- Verify that the activity_other deletes successfully --->
		<cfif activity_other.delete()>
			<cfset flashInsert(success="The activity_other was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_other.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
