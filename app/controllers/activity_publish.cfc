<cfcomponent extends="Controller" output="false">
	
	<!--- activity_pubgenerals/index --->
	<cffunction name="index">
		<cfset activity_pubgenerals = model("Activity_pubgeneral").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_pubgenerals/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_pubgeneral = model("Activity_pubgeneral").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_pubgeneral)>
	        <cfset flashInsert(error="Activity_pubgeneral #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_pubgenerals/new --->
	<cffunction name="new">
		<cfset activity_pubgeneral = model("Activity_pubgeneral").new()>
	</cffunction>
	
	<!--- activity_pubgenerals/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_pubgeneral = model("Activity_pubgeneral").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_pubgeneral)>
	        <cfset flashInsert(error="Activity_pubgeneral #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_pubgenerals/create --->
	<cffunction name="create">
		<cfset activity_pubgeneral = model("Activity_pubgeneral").new(params.activity_pubgeneral)>
		
		<!--- Verify that the activity_pubgeneral creates successfully --->
		<cfif activity_pubgeneral.save()>
			<cfset flashInsert(success="The activity_pubgeneral was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_pubgeneral.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_pubgenerals/update --->
	<cffunction name="update">
		<cfset activity_pubgeneral = model("Activity_pubgeneral").findByKey(params.key)>
		
		<!--- Verify that the activity_pubgeneral updates successfully --->
		<cfif activity_pubgeneral.update(params.activity_pubgeneral)>
			<cfset flashInsert(success="The activity_pubgeneral was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_pubgeneral.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_pubgenerals/delete/key --->
	<cffunction name="delete">
		<cfset activity_pubgeneral = model("Activity_pubgeneral").findByKey(params.key)>
		
		<!--- Verify that the activity_pubgeneral deletes successfully --->
		<cfif activity_pubgeneral.delete()>
			<cfset flashInsert(success="The activity_pubgeneral was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_pubgeneral.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
