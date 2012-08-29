<cfcomponent extends="Controller" output="false">
	
	<!--- sys_credits/index --->
	<cffunction name="index">
		<cfset sys_credits = model("Sys_credit").findAll()>
	</cffunction>
	
	<!--- sys_credits/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_credit = model("Sys_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_credit)>
	        <cfset flashInsert(error="Sys_credit #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_credits/new --->
	<cffunction name="new">
		<cfset sys_credit = model("Sys_credit").new()>
	</cffunction>
	
	<!--- sys_credits/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_credit = model("Sys_credit").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_credit)>
	        <cfset flashInsert(error="Sys_credit #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_credits/create --->
	<cffunction name="create">
		<cfset sys_credit = model("Sys_credit").new(params.sys_credit)>
		
		<!--- Verify that the sys_credit creates successfully --->
		<cfif sys_credit.save()>
			<cfset flashInsert(success="The sys_credit was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_credit.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_credits/update --->
	<cffunction name="update">
		<cfset sys_credit = model("Sys_credit").findByKey(params.key)>
		
		<!--- Verify that the sys_credit updates successfully --->
		<cfif sys_credit.update(params.sys_credit)>
			<cfset flashInsert(success="The sys_credit was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_credit.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_credits/delete/key --->
	<cffunction name="delete">
		<cfset sys_credit = model("Sys_credit").findByKey(params.key)>
		
		<!--- Verify that the sys_credit deletes successfully --->
		<cfif sys_credit.delete()>
			<cfset flashInsert(success="The sys_credit was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_credit.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
