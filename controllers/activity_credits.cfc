<cfcomponent extends="Controller" output="false">
	
	<!--- activity_credits/index --->
	<cffunction name="index">
		<cfset activity_credits = model("Activity_credit").findAll()>
	</cffunction>
	
	<!--- activity_credits/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_credit = model("Activity_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_credit)>
	        <cfset flashInsert(error="Activity_credit #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_credits/new --->
	<cffunction name="new">
		<cfset activity_credit = model("Activity_credit").new()>
	</cffunction>
	
	<!--- activity_credits/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_credit = model("Activity_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_credit)>
	        <cfset flashInsert(error="Activity_credit #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_credits/create --->
	<cffunction name="create">
		<cfset activity_credit = model("Activity_credit").new(params.activity_credit)>
		
		<!--- Verify that the activity_credit creates successfully --->
		<cfif activity_credit.save()>
			<cfset flashInsert(success="The activity_credit was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_credit.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_credits/update --->
	<cffunction name="update">
		<cfset activity_credit = model("Activity_credit").findByKey(params.key)>
		
		<!--- Verify that the activity_credit updates successfully --->
		<cfif activity_credit.update(params.activity_credit)>
			<cfset flashInsert(success="The activity_credit was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_credit.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_credits/delete/key --->
	<cffunction name="delete">
		<cfset activity_credit = model("Activity_credit").findByKey(params.key)>
		
		<!--- Verify that the activity_credit deletes successfully --->
		<cfif activity_credit.delete()>
			<cfset flashInsert(success="The activity_credit was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_credit.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
