<cfcomponent extends="Controller" output="false">
	
	<!--- person_specialtylms/index --->
	<cffunction name="index">
		<cfset person_specialtylms = model("Person_specialtylms").findAll()>
	</cffunction>
	
	<!--- person_specialtylms/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset person_specialtylms = model("Person_specialtylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_specialtylms)>
	        <cfset flashInsert(error="Person_specialtylms #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- person_specialtylms/new --->
	<cffunction name="new">
		<cfset person_specialtylms = model("Person_specialtylms").new()>
	</cffunction>
	
	<!--- person_specialtylms/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset person_specialtylms = model("Person_specialtylms").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(person_specialtylms)>
	        <cfset flashInsert(error="Person_specialtylms #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- person_specialtylms/create --->
	<cffunction name="create">
		<cfset person_specialtylms = model("Person_specialtylms").new(params.person_specialtylms)>
		
		<!--- Verify that the person_specialtylms creates successfully --->
		<cfif person_specialtylms.save()>
			<cfset flashInsert(success="The person_specialtylms was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the person_specialtylms.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- person_specialtylms/update --->
	<cffunction name="update">
		<cfset person_specialtylms = model("Person_specialtylms").findByKey(params.key)>
		
		<!--- Verify that the person_specialtylms updates successfully --->
		<cfif person_specialtylms.update(params.person_specialtylms)>
			<cfset flashInsert(success="The person_specialtylms was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the person_specialtylms.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- person_specialtylms/delete/key --->
	<cffunction name="delete">
		<cfset person_specialtylms = model("Person_specialtylms").findByKey(params.key)>
		
		<!--- Verify that the person_specialtylms deletes successfully --->
		<cfif person_specialtylms.delete()>
			<cfset flashInsert(success="The person_specialtylms was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the person_specialtylms.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
