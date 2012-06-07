<cfcomponent extends="Controller" output="false">
	
	<!--- files/index --->
	<cffunction name="index">
		<cfset files = model("File").findAll()>
	</cffunction>
	
	<!--- files/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset file = model("File").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(file)>
	        <cfset flashInsert(error="File #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- files/new --->
	<cffunction name="new">
		<cfset file = model("File").new()>
	</cffunction>
	
	<!--- files/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset file = model("File").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(file)>
	        <cfset flashInsert(error="File #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- files/create --->
	<cffunction name="create">
		<cfset file = model("File").new(params.file)>
		
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
	
	<!--- files/update --->
	<cffunction name="update">
		<cfset file = model("File").findByKey(params.key)>
		
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
	
	<!--- files/delete/key --->
	<cffunction name="delete">
		<cfset file = model("File").findByKey(params.key)>
		
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
