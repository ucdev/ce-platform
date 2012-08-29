<cfcomponent extends="Controller" output="false">
	
	<!--- sys_addresstypes/index --->
	<cffunction name="index">
		<cfset sys_addresstypes = model("Sys_addresstype").findAll()>
	</cffunction>
	
	<!--- sys_addresstypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_addresstype = model("Sys_addresstype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_addresstype)>
	        <cfset flashInsert(error="Sys_addresstype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_addresstypes/new --->
	<cffunction name="new">
		<cfset sys_addresstype = model("Sys_addresstype").new()>
	</cffunction>
	
	<!--- sys_addresstypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_addresstype = model("Sys_addresstype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_addresstype)>
	        <cfset flashInsert(error="Sys_addresstype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_addresstypes/create --->
	<cffunction name="create">
		<cfset sys_addresstype = model("Sys_addresstype").new(params.sys_addresstype)>
		
		<!--- Verify that the sys_addresstype creates successfully --->
		<cfif sys_addresstype.save()>
			<cfset flashInsert(success="The sys_addresstype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_addresstype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_addresstypes/update --->
	<cffunction name="update">
		<cfset sys_addresstype = model("Sys_addresstype").findByKey(params.key)>
		
		<!--- Verify that the sys_addresstype updates successfully --->
		<cfif sys_addresstype.update(params.sys_addresstype)>
			<cfset flashInsert(success="The sys_addresstype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_addresstype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_addresstypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_addresstype = model("Sys_addresstype").findByKey(params.key)>
		
		<!--- Verify that the sys_addresstype deletes successfully --->
		<cfif sys_addresstype.delete()>
			<cfset flashInsert(success="The sys_addresstype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_addresstype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
