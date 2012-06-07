<cfcomponent extends="Controller" output="false">
	
	<!--- sys_assessquestiontypes/index --->
	<cffunction name="index">
		<cfset sys_assessquestiontypes = model("Sys_assessquestiontype").findAll()>
	</cffunction>
	
	<!--- sys_assessquestiontypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_assessquestiontype = model("Sys_assessquestiontype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_assessquestiontype)>
	        <cfset flashInsert(error="Sys_assessquestiontype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_assessquestiontypes/new --->
	<cffunction name="new">
		<cfset sys_assessquestiontype = model("Sys_assessquestiontype").new()>
	</cffunction>
	
	<!--- sys_assessquestiontypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_assessquestiontype = model("Sys_assessquestiontype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_assessquestiontype)>
	        <cfset flashInsert(error="Sys_assessquestiontype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_assessquestiontypes/create --->
	<cffunction name="create">
		<cfset sys_assessquestiontype = model("Sys_assessquestiontype").new(params.sys_assessquestiontype)>
		
		<!--- Verify that the sys_assessquestiontype creates successfully --->
		<cfif sys_assessquestiontype.save()>
			<cfset flashInsert(success="The sys_assessquestiontype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_assessquestiontype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_assessquestiontypes/update --->
	<cffunction name="update">
		<cfset sys_assessquestiontype = model("Sys_assessquestiontype").findByKey(params.key)>
		
		<!--- Verify that the sys_assessquestiontype updates successfully --->
		<cfif sys_assessquestiontype.update(params.sys_assessquestiontype)>
			<cfset flashInsert(success="The sys_assessquestiontype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_assessquestiontype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_assessquestiontypes/delete/key --->
	<cffunction name="delete">
		<cfset sys_assessquestiontype = model("Sys_assessquestiontype").findByKey(params.key)>
		
		<!--- Verify that the sys_assessquestiontype deletes successfully --->
		<cfif sys_assessquestiontype.delete()>
			<cfset flashInsert(success="The sys_assessquestiontype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_assessquestiontype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
