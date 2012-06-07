<cfcomponent extends="Controller" output="false">
	
	<!--- histories/index --->
	<cffunction name="index">
		<cfset histories = model("History").findAll()>
	</cffunction>
	
	<!--- histories/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset history = model("History").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(history)>
	        <cfset flashInsert(error="History #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- histories/new --->
	<cffunction name="new">
		<cfset history = model("History").new()>
	</cffunction>
	
	<!--- histories/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset history = model("History").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(history)>
	        <cfset flashInsert(error="History #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- histories/create --->
	<cffunction name="create">
		<cfset history = model("History").new(params.history)>
		
		<!--- Verify that the history creates successfully --->
		<cfif history.save()>
			<cfset flashInsert(success="The history was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the history.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- histories/update --->
	<cffunction name="update">
		<cfset history = model("History").findByKey(params.key)>
		
		<!--- Verify that the history updates successfully --->
		<cfif history.update(params.history)>
			<cfset flashInsert(success="The history was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the history.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- histories/delete/key --->
	<cffunction name="delete">
		<cfset history = model("History").findByKey(params.key)>
		
		<!--- Verify that the history deletes successfully --->
		<cfif history.delete()>
			<cfset flashInsert(success="The history was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the history.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
