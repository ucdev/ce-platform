<cfcomponent extends="Controller" output="false">
	
	<!--- sys_occclasses/index --->
	<cffunction name="index">
		<cfset sys_occclasses = model("Sys_occclass").findAll()>
	</cffunction>
	
	<!--- sys_occclasses/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset sys_occclass = model("Sys_occclass").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_occclass)>
	        <cfset flashInsert(error="Sys_occclass #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- sys_occclasses/new --->
	<cffunction name="new">
		<cfset sys_occclass = model("Sys_occclass").new()>
	</cffunction>
	
	<!--- sys_occclasses/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset sys_occclass = model("Sys_occclass").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(sys_occclass)>
	        <cfset flashInsert(error="Sys_occclass #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- sys_occclasses/create --->
	<cffunction name="create">
		<cfset sys_occclass = model("Sys_occclass").new(params.sys_occclass)>
		
		<!--- Verify that the sys_occclass creates successfully --->
		<cfif sys_occclass.save()>
			<cfset flashInsert(success="The sys_occclass was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the sys_occclass.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- sys_occclasses/update --->
	<cffunction name="update">
		<cfset sys_occclass = model("Sys_occclass").findByKey(params.key)>
		
		<!--- Verify that the sys_occclass updates successfully --->
		<cfif sys_occclass.update(params.sys_occclass)>
			<cfset flashInsert(success="The sys_occclass was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the sys_occclass.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- sys_occclasses/delete/key --->
	<cffunction name="delete">
		<cfset sys_occclass = model("Sys_occclass").findByKey(params.key)>
		
		<!--- Verify that the sys_occclass deletes successfully --->
		<cfif sys_occclass.delete()>
			<cfset flashInsert(success="The sys_occclass was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the sys_occclass.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
