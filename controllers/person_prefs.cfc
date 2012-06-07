<cfcomponent extends="Controller" output="false">
	
	<!--- person_prefs/index --->
	<cffunction name="index">
		<cfset person_prefs = model("Person_pref").findAll()>
	</cffunction>
	
	<!--- person_prefs/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_pref = model("Person_pref").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_pref)>
	        <cfset flashInsert(error="Person_pref #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_prefs/new --->
	<cffunction name="new">
		<cfset person_pref = model("Person_pref").new()>
	</cffunction>
	
	<!--- person_prefs/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_pref = model("Person_pref").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_pref)>
	        <cfset flashInsert(error="Person_pref #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_prefs/create --->
	<cffunction name="create">
		<cfset person_pref = model("Person_pref").new(params.person_pref)>
		
		<!--- Verify that the person_pref creates successfully --->
		<cfif person_pref.save()>
			<cfset flashInsert(success="The person_pref was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_pref.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_prefs/update --->
	<cffunction name="update">
		<cfset person_pref = model("Person_pref").findByKey(params.key)>
		
		<!--- Verify that the person_pref updates successfully --->
		<cfif person_pref.update(params.person_pref)>
			<cfset flashInsert(success="The person_pref was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_pref.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_prefs/delete/key --->
	<cffunction name="delete">
		<cfset person_pref = model("Person_pref").findByKey(params.key)>
		
		<!--- Verify that the person_pref deletes successfully --->
		<cfif person_pref.delete()>
			<cfset flashInsert(success="The person_pref was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_pref.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
