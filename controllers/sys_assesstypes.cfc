<cfcomponent extends="Controller" output="false">
	
	<!--- sys_assesstypes/index --->
	<cffunction name="index">
		<cfset sys_assesstypes = model("Sys_assesstype").findAll()>
	</cffunction>
	
	<!--- sys_assesstypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_assesstype = model("Sys_assesstype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_assesstype)>
	        <cfset flashInsert(error="Sys_assesstype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_assesstypes/new --->
	<cffunction name="new">
		<cfset sys_assesstype = model("Sys_assesstype").new()>
	</cffunction>
	
	<!--- sys_assesstypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_assesstype = model("Sys_assesstype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_assesstype)>
	        <cfset flashInsert(error="Sys_assesstype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_assesstypes/create --->
	<cffunction name="create">
		<cfset sys_assesstype = model("Sys_assesstype").new(params.sys_assesstype)>
		
		<!--- Verify that the sys_assesstype creates successfully --->
		<cfif sys_assesstype.save()>
			<cfset flashInsert(success="The sys_assesstype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_assesstype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_assesstypes/update --->
	<cffunction name="update">
		<cfset sys_assesstype = model("Sys_assesstype").findByKey(params.key)>
		
		<!--- Verify that the sys_assesstype updates successfully --->
		<cfif sys_assesstype.update(params.sys_assesstype)>
			<cfset flashInsert(success="The sys_assesstype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_assesstype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_assesstypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_assesstype = model("Sys_assesstype").findByKey(params.key)>
		
		<!--- Verify that the sys_assesstype deletes successfully --->
		<cfif sys_assesstype.delete()>
			<cfset flashInsert(success="The sys_assesstype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_assesstype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
