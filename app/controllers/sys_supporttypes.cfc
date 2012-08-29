<cfcomponent extends="Controller" output="false">
	
	<!--- sys_supporttypes/index --->
	<cffunction name="index">
		<cfset sys_supporttypes = model("Sys_supporttype").findAll()>
	</cffunction>
	
	<!--- sys_supporttypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_supporttype = model("Sys_supporttype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_supporttype)>
	        <cfset flashInsert(error="Sys_supporttype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_supporttypes/new --->
	<cffunction name="new">
		<cfset sys_supporttype = model("Sys_supporttype").new()>
	</cffunction>
	
	<!--- sys_supporttypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_supporttype = model("Sys_supporttype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_supporttype)>
	        <cfset flashInsert(error="Sys_supporttype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_supporttypes/create --->
	<cffunction name="create">
		<cfset sys_supporttype = model("Sys_supporttype").new(params.sys_supporttype)>
		
		<!--- Verify that the sys_supporttype creates successfully --->
		<cfif sys_supporttype.save()>
			<cfset flashInsert(success="The sys_supporttype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_supporttype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_supporttypes/update --->
	<cffunction name="update">
		<cfset sys_supporttype = model("Sys_supporttype").findByKey(params.key)>
		
		<!--- Verify that the sys_supporttype updates successfully --->
		<cfif sys_supporttype.update(params.sys_supporttype)>
			<cfset flashInsert(success="The sys_supporttype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_supporttype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_supporttypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_supporttype = model("Sys_supporttype").findByKey(params.key)>
		
		<!--- Verify that the sys_supporttype deletes successfully --->
		<cfif sys_supporttype.delete()>
			<cfset flashInsert(success="The sys_supporttype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_supporttype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
