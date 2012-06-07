<cfcomponent extends="Controller" output="false">
	
	<!--- activity_finbudgets/index --->
	<cffunction name="index">
		<cfset activity_finbudgets = model("Activity_finbudget").findAll()>
	</cffunction>
	
	<!--- activity_finbudgets/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_finbudget = model("Activity_finbudget").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finbudget)>
	        <cfset flashInsert(error="Activity_finbudget #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_finbudgets/new --->
	<cffunction name="new">
		<cfset activity_finbudget = model("Activity_finbudget").new()>
	</cffunction>
	
	<!--- activity_finbudgets/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_finbudget = model("Activity_finbudget").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finbudget)>
	        <cfset flashInsert(error="Activity_finbudget #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_finbudgets/create --->
	<cffunction name="create">
		<cfset activity_finbudget = model("Activity_finbudget").new(params.activity_finbudget)>
		
		<!--- Verify that the activity_finbudget creates successfully --->
		<cfif activity_finbudget.save()>
			<cfset flashInsert(success="The activity_finbudget was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_finbudget.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_finbudgets/update --->
	<cffunction name="update">
		<cfset activity_finbudget = model("Activity_finbudget").findByKey(params.key)>
		
		<!--- Verify that the activity_finbudget updates successfully --->
		<cfif activity_finbudget.update(params.activity_finbudget)>
			<cfset flashInsert(success="The activity_finbudget was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_finbudget.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_finbudgets/delete/key --->
	<cffunction name="delete">
		<cfset activity_finbudget = model("Activity_finbudget").findByKey(params.key)>
		
		<!--- Verify that the activity_finbudget deletes successfully --->
		<cfif activity_finbudget.delete()>
			<cfset flashInsert(success="The activity_finbudget was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_finbudget.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
