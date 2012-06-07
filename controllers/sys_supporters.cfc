<cfcomponent extends="Controller" output="false">
	
	<!--- sys_supporters/index --->
	<cffunction name="index">
		<cfset sys_supporters = model("Sys_supporter").findAll()>
	</cffunction>
	
	<!--- sys_supporters/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_supporter = model("Sys_supporter").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_supporter)>
	        <cfset flashInsert(error="Sys_supporter #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_supporters/new --->
	<cffunction name="new">
		<cfset sys_supporter = model("Sys_supporter").new()>
	</cffunction>
	
	<!--- sys_supporters/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_supporter = model("Sys_supporter").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_supporter)>
	        <cfset flashInsert(error="Sys_supporter #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_supporters/create --->
	<cffunction name="create">
		<cfset sys_supporter = model("Sys_supporter").new(params.sys_supporter)>
		
		<!--- Verify that the sys_supporter creates successfully --->
		<cfif sys_supporter.save()>
			<cfset flashInsert(success="The sys_supporter was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_supporter.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_supporters/update --->
	<cffunction name="update">
		<cfset sys_supporter = model("Sys_supporter").findByKey(params.key)>
		
		<!--- Verify that the sys_supporter updates successfully --->
		<cfif sys_supporter.update(params.sys_supporter)>
			<cfset flashInsert(success="The sys_supporter was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_supporter.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_supporters/delete/key --->
	<cffunction name="delete">
		<cfset sys_supporter = model("Sys_supporter").findByKey(params.key)>
		
		<!--- Verify that the sys_supporter deletes successfully --->
		<cfif sys_supporter.delete()>
			<cfset flashInsert(success="The sys_supporter was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_supporter.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
