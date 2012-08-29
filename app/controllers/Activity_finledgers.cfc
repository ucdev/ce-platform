<cfcomponent extends="Controller" output="false">
	
	<cffunction name="init">
		<cfset filters(through="loginRequired") />
		<cfset filters(through="adminRequired") />
		<cfset super.init() />
	</cffunction>
	
	<!--- activity_finledgers/index --->
	<cffunction name="index">
		<cfset activity_finledgers = model("Activity_finledger").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_finledgers/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_finledger = model("Activity_finledger").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finledger)>
	        <cfset flashInsert(error="Activity_finledger #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_finledgers/new --->
	<cffunction name="new">
		<cfset activity_finledger = model("Activity_finledger").new()>
	</cffunction>
	
	<!--- activity_finledgers/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_finledger = model("Activity_finledger").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_finledger)>
	        <cfset flashInsert(error="Activity_finledger #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_finledgers/create --->
	<cffunction name="create">
		<cfset activity_finledger = model("Activity_finledger").new(params.activity_finledger)>
		
		<!--- Verify that the activity_finledger creates successfully --->
		<cfif activity_finledger.save()>
			<cfset flashInsert(success="The activity_finledger was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_finledger.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_finledgers/update --->
	<cffunction name="update">
		<cfset activity_finledger = model("Activity_finledger").findByKey(params.key)>
		
		<!--- Verify that the activity_finledger updates successfully --->
		<cfif activity_finledger.update(params.activity_finledger)>
			<cfset flashInsert(success="The activity_finledger was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_finledger.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_finledgers/delete/key --->
	<cffunction name="delete">
		<cfset activity_finledger = model("Activity_finledger").findByKey(params.key)>
		
		<!--- Verify that the activity_finledger deletes successfully --->
		<cfif activity_finledger.delete()>
			<cfset flashInsert(success="The activity_finledger was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_finledger.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
