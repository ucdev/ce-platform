<cfcomponent extends="Controller" output="false">
	
	<!--- sys_degrees/index --->
	<cffunction name="index">
		<cfset sys_degrees = model("Sys_degree").findAll()>
	</cffunction>
	
	<!--- sys_degrees/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_degree = model("Sys_degree").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_degree)>
	        <cfset flashInsert(error="Sys_degree #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_degrees/new --->
	<cffunction name="new">
		<cfset sys_degree = model("Sys_degree").new()>
	</cffunction>
	
	<!--- sys_degrees/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_degree = model("Sys_degree").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_degree)>
	        <cfset flashInsert(error="Sys_degree #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_degrees/create --->
	<cffunction name="create">
		<cfset sys_degree = model("Sys_degree").new(params.sys_degree)>
		
		<!--- Verify that the sys_degree creates successfully --->
		<cfif sys_degree.save()>
			<cfset flashInsert(success="The sys_degree was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_degree.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_degrees/update --->
	<cffunction name="update">
		<cfset sys_degree = model("Sys_degree").findByKey(params.key)>
		
		<!--- Verify that the sys_degree updates successfully --->
		<cfif sys_degree.update(params.sys_degree)>
			<cfset flashInsert(success="The sys_degree was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_degree.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_degrees/delete/key --->
	<cffunction name="delete">
		<cfset sys_degree = model("Sys_degree").findByKey(params.key)>
		
		<!--- Verify that the sys_degree deletes successfully --->
		<cfif sys_degree.delete()>
			<cfset flashInsert(success="The sys_degree was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_degree.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
