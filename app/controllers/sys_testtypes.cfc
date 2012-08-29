<cfcomponent extends="Controller" output="false">
	
	<!--- sys_testtypes/index --->
	<cffunction name="index">
		<cfset sys_testtypes = model("Sys_testtype").findAll()>
	</cffunction>
	
	<!--- sys_testtypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_testtype = model("Sys_testtype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_testtype)>
	        <cfset flashInsert(error="Sys_testtype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_testtypes/new --->
	<cffunction name="new">
		<cfset sys_testtype = model("Sys_testtype").new()>
	</cffunction>
	
	<!--- sys_testtypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_testtype = model("Sys_testtype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_testtype)>
	        <cfset flashInsert(error="Sys_testtype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_testtypes/create --->
	<cffunction name="create">
		<cfset sys_testtype = model("Sys_testtype").new(params.sys_testtype)>
		
		<!--- Verify that the sys_testtype creates successfully --->
		<cfif sys_testtype.save()>
			<cfset flashInsert(success="The sys_testtype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_testtype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_testtypes/update --->
	<cffunction name="update">
		<cfset sys_testtype = model("Sys_testtype").findByKey(params.key)>
		
		<!--- Verify that the sys_testtype updates successfully --->
		<cfif sys_testtype.update(params.sys_testtype)>
			<cfset flashInsert(success="The sys_testtype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_testtype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_testtypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_testtype = model("Sys_testtype").findByKey(params.key)>
		
		<!--- Verify that the sys_testtype deletes successfully --->
		<cfif sys_testtype.delete()>
			<cfset flashInsert(success="The sys_testtype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_testtype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
