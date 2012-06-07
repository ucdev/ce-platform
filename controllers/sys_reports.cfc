<cfcomponent extends="Controller" output="false">
	
	<!--- sys_reports/index --->
	<cffunction name="index">
		<cfset sys_reports = model("Sys_report").findAll()>
	</cffunction>
	
	<!--- sys_reports/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_report = model("Sys_report").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_report)>
	        <cfset flashInsert(error="Sys_report #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_reports/new --->
	<cffunction name="new">
		<cfset sys_report = model("Sys_report").new()>
	</cffunction>
	
	<!--- sys_reports/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_report = model("Sys_report").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_report)>
	        <cfset flashInsert(error="Sys_report #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_reports/create --->
	<cffunction name="create">
		<cfset sys_report = model("Sys_report").new(params.sys_report)>
		
		<!--- Verify that the sys_report creates successfully --->
		<cfif sys_report.save()>
			<cfset flashInsert(success="The sys_report was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_report.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_reports/update --->
	<cffunction name="update">
		<cfset sys_report = model("Sys_report").findByKey(params.key)>
		
		<!--- Verify that the sys_report updates successfully --->
		<cfif sys_report.update(params.sys_report)>
			<cfset flashInsert(success="The sys_report was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_report.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_reports/delete/key --->
	<cffunction name="delete">
		<cfset sys_report = model("Sys_report").findByKey(params.key)>
		
		<!--- Verify that the sys_report deletes successfully --->
		<cfif sys_report.delete()>
			<cfset flashInsert(success="The sys_report was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_report.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
