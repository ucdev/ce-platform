<cfcomponent extends="Controller" output="false">
	<cffunction name="init">
		<cfset super.init() />
	</cffunction>
	<!--- activity_credits/index --->
	<cffunction name="index">
		<cfset files = model("file").findAllByActivityid(params.key)>
	</cffunction>
	
	<!--- activity_credits/show/key --->
	<cffunction name="show">
		<!---
		<!--- Find the record --->
    	<cfset file = model("file").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(file)>
	        <cfset flashInsert(error="file #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>--->
			
	</cffunction>
	
	<!--- activity_credits/new --->
	<cffunction name="new">
		<cfset file = model("file").new()>
	</cffunction>
	
	<!--- activity_credits/edit/key --->
	<cffunction name="edit">
		
	</cffunction>
	
	<!--- activity_credits/create --->
	<cffunction name="create">
		<cfset file = model("file").new(params.file)>
		
		<!--- Verify that the file creates successfully --->
		<cfif file.save()>
			<cfset flashInsert(success="The file was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the file.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- activity_credits/update --->
	<cffunction name="update">
		<cfset file = model("file").findByKey(params.key)>
		
		<!--- Verify that the file updates successfully --->
		<cfif file.update(params.file)>
			<cfset flashInsert(success="The file was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the file.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- activity_credits/delete/key --->
	<cffunction name="delete">
		<cfset file = model("file").findByKey(params.key)>
		
		<!--- Verify that the file deletes successfully --->
		<cfif file.delete()>
			<cfset flashInsert(success="The file was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the file.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
