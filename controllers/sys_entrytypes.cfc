<cfcomponent extends="Controller" output="false">
	
	<!--- sys_entrytypes/index --->
	<cffunction name="index">
		<cfset sys_entrytypes = model("Sys_entrytype").findAll()>
	</cffunction>
	
	<!--- sys_entrytypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_entrytype = model("Sys_entrytype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_entrytype)>
	        <cfset flashInsert(error="Sys_entrytype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_entrytypes/new --->
	<cffunction name="new">
		<cfset sys_entrytype = model("Sys_entrytype").new()>
	</cffunction>
	
	<!--- sys_entrytypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_entrytype = model("Sys_entrytype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_entrytype)>
	        <cfset flashInsert(error="Sys_entrytype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_entrytypes/create --->
	<cffunction name="create">
		<cfset sys_entrytype = model("Sys_entrytype").new(params.sys_entrytype)>
		
		<!--- Verify that the sys_entrytype creates successfully --->
		<cfif sys_entrytype.save()>
			<cfset flashInsert(success="The sys_entrytype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_entrytype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_entrytypes/update --->
	<cffunction name="update">
		<cfset sys_entrytype = model("Sys_entrytype").findByKey(params.key)>
		
		<!--- Verify that the sys_entrytype updates successfully --->
		<cfif sys_entrytype.update(params.sys_entrytype)>
			<cfset flashInsert(success="The sys_entrytype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_entrytype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_entrytypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_entrytype = model("Sys_entrytype").findByKey(params.key)>
		
		<!--- Verify that the sys_entrytype deletes successfully --->
		<cfif sys_entrytype.delete()>
			<cfset flashInsert(success="The sys_entrytype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_entrytype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
