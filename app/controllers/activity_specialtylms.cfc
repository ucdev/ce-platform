<cfcomponent extends="Controller" output="false">
	
	<!--- activity_specialtylms/index --->
	<cffunction name="index">
		<cfset activity_specialtylms = model("Activity_specialtylms").findAllByActivityId(value=params.key)>
	</cffunction>
	
	<!--- activity_specialtylms/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_specialtylms = model("Activity_specialtylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_specialtylms)>
	        <cfset flashInsert(error="Activity_specialtylms #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_specialtylms/new --->
	<cffunction name="new">
		<cfset activity_specialtylms = model("Activity_specialtylms").new()>
	</cffunction>
	
	<!--- activity_specialtylms/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_specialtylms = model("Activity_specialtylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_specialtylms)>
	        <cfset flashInsert(error="Activity_specialtylms #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_specialtylms/create --->
	<cffunction name="create">
		<cfset activity_specialtylms = model("Activity_specialtylms").new(params.activity_specialtylms)>
		
		<!--- Verify that the activity_specialtylms creates successfully --->
		<cfif activity_specialtylms.save()>
			<cfset flashInsert(success="The activity_specialtylms was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_specialtylms.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_specialtylms/update --->
	<cffunction name="update">
		<cfset activity_specialtylms = model("Activity_specialtylms").findByKey(params.key)>
		
		<!--- Verify that the activity_specialtylms updates successfully --->
		<cfif activity_specialtylms.update(params.activity_specialtylms)>
			<cfset flashInsert(success="The activity_specialtylms was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_specialtylms.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_specialtylms/delete/key --->
	<cffunction name="delete">
		<cfset activity_specialtylms = model("Activity_specialtylms").findByKey(params.key)>
		
		<!--- Verify that the activity_specialtylms deletes successfully --->
		<cfif activity_specialtylms.delete()>
			<cfset flashInsert(success="The activity_specialtylms was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_specialtylms.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
