<cfcomponent extends="Controller" output="false">
	
	<!--- activity_finsupports/index --->
	<cffunction name="index">
		<cfset activity_finsupports = model("Activity_finsupport").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_finsupports/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_finsupport = model("Activity_finsupport").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finsupport)>
	        <cfset flashInsert(error="Activity_finsupport #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_finsupports/new --->
	<cffunction name="new">
		<cfset activity_finsupport = model("Activity_finsupport").new()>
	</cffunction>
	
	<!--- activity_finsupports/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_finsupport = model("Activity_finsupport").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finsupport)>
	        <cfset flashInsert(error="Activity_finsupport #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_finsupports/create --->
	<cffunction name="create">
		<cfset activity_finsupport = model("Activity_finsupport").new(params.activity_finsupport)>
		
		<!--- Verify that the activity_finsupport creates successfully --->
		<cfif activity_finsupport.save()>
			<cfset flashInsert(success="The activity_finsupport was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_finsupport.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_finsupports/update --->
	<cffunction name="update">
		<cfset activity_finsupport = model("Activity_finsupport").findByKey(params.key)>
		
		<!--- Verify that the activity_finsupport updates successfully --->
		<cfif activity_finsupport.update(params.activity_finsupport)>
			<cfset flashInsert(success="The activity_finsupport was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_finsupport.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_finsupports/delete/key --->
	<cffunction name="delete">
		<cfset activity_finsupport = model("Activity_finsupport").findByKey(params.key)>
		
		<!--- Verify that the activity_finsupport deletes successfully --->
		<cfif activity_finsupport.delete()>
			<cfset flashInsert(success="The activity_finsupport was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_finsupport.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
