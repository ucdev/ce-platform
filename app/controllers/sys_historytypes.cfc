<cfcomponent extends="Controller" output="false">
	
	<!--- sys_historytypes/index --->
	<cffunction name="index">
		<cfset sys_historytypes = model("Sys_historytype").findAll()>
	</cffunction>
	
	<!--- sys_historytypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_historytype = model("Sys_historytype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_historytype)>
	        <cfset flashInsert(error="Sys_historytype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_historytypes/new --->
	<cffunction name="new">
		<cfset sys_historytype = model("Sys_historytype").new()>
	</cffunction>
	
	<!--- sys_historytypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_historytype = model("Sys_historytype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_historytype)>
	        <cfset flashInsert(error="Sys_historytype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_historytypes/create --->
	<cffunction name="create">
		<cfset sys_historytype = model("Sys_historytype").new(params.sys_historytype)>
		
		<!--- Verify that the sys_historytype creates successfully --->
		<cfif sys_historytype.save()>
			<cfset flashInsert(success="The sys_historytype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_historytype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_historytypes/update --->
	<cffunction name="update">
		<cfset sys_historytype = model("Sys_historytype").findByKey(params.key)>
		
		<!--- Verify that the sys_historytype updates successfully --->
		<cfif sys_historytype.update(params.sys_historytype)>
			<cfset flashInsert(success="The sys_historytype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_historytype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_historytypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_historytype = model("Sys_historytype").findByKey(params.key)>
		
		<!--- Verify that the sys_historytype deletes successfully --->
		<cfif sys_historytype.delete()>
			<cfset flashInsert(success="The sys_historytype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_historytype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
