<cfcomponent extends="Controller" output="false">
	
	<!--- sys_-c-b-a-funds/index --->
	<cffunction name="index">
		<cfset sys_cbafunds = model("Sys_CBAFund").findAll()>
	</cffunction>
	
	<!--- sys_-c-b-a-funds/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_cbafund = model("Sys_CBAFund").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_cbafund)>
	        <cfset flashInsert(error="Sys_CBAFund #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_-c-b-a-funds/new --->
	<cffunction name="new">
		<cfset sys_cbafund = model("Sys_CBAFund").new()>
	</cffunction>
	
	<!--- sys_-c-b-a-funds/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_cbafund = model("Sys_CBAFund").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_cbafund)>
	        <cfset flashInsert(error="Sys_CBAFund #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_-c-b-a-funds/create --->
	<cffunction name="create">
		<cfset sys_cbafund = model("Sys_CBAFund").new(params.sys_cbafund)>
		
		<!--- Verify that the sys_cbafund creates successfully --->
		<cfif sys_cbafund.save()>
			<cfset flashInsert(success="The sys_cbafund was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_cbafund.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_-c-b-a-funds/update --->
	<cffunction name="update">
		<cfset sys_cbafund = model("Sys_CBAFund").findByKey(params.key)>
		
		<!--- Verify that the sys_cbafund updates successfully --->
		<cfif sys_cbafund.update(params.sys_cbafund)>
			<cfset flashInsert(success="The sys_cbafund was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_cbafund.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_-c-b-a-funds/delete/key --->
	<cffunction name="delete">
		<cfset sys_cbafund = model("Sys_CBAFund").findByKey(params.key)>
		
		<!--- Verify that the sys_cbafund deletes successfully --->
		<cfif sys_cbafund.delete()>
			<cfset flashInsert(success="The sys_cbafund was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_cbafund.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
