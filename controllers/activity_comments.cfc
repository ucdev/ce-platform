<cfcomponent extends="Controller" output="false">
	
	<!--- activity_comments/index --->
	<cffunction name="index">
		<cfset activity_comments = model("Activity_comment").findAll()>
	</cffunction>
	
	<!--- activity_comments/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset activity_comment = model("Activity_comment").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_comment)>
	        <cfset flashInsert(error="Activity_comment #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- activity_comments/new --->
	<cffunction name="new">
		<cfset activity_comment = model("Activity_comment").new()>
	</cffunction>
	
	<!--- activity_comments/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset activity_comment = model("Activity_comment").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(activity_comment)>
	        <cfset flashInsert(error="Activity_comment #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- activity_comments/create --->
	<cffunction name="create">
		<cfset activity_comment = model("Activity_comment").new(params.activity_comment)>
		
		<!--- Verify that the activity_comment creates successfully --->
		<cfif activity_comment.save()>
			<cfset flashInsert(success="The activity_comment was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the activity_comment.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_comments/update --->
	<cffunction name="update">
		<cfset activity_comment = model("Activity_comment").findByKey(params.key)>
		
		<!--- Verify that the activity_comment updates successfully --->
		<cfif activity_comment.update(params.activity_comment)>
			<cfset flashInsert(success="The activity_comment was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the activity_comment.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_comments/delete/key --->
	<cffunction name="delete">
		<cfset activity_comment = model("Activity_comment").findByKey(params.key)>
		
		<!--- Verify that the activity_comment deletes successfully --->
		<cfif activity_comment.delete()>
			<cfset flashInsert(success="The activity_comment was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the activity_comment.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
