<cfcomponent extends="Controller" output="false">
	
	<!--- imagetypes/index --->
	<cffunction name="index">
		<cfset imagetypes = model("Imagetype").findAll()>
	</cffunction>
	
	<!--- imagetypes/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset imagetype = model("Imagetype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(imagetype)>
	        <cfset flashInsert(error="Imagetype #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- imagetypes/new --->
	<cffunction name="new">
		<cfset imagetype = model("Imagetype").new()>
	</cffunction>
	
	<!--- imagetypes/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset imagetype = model("Imagetype").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(imagetype)>
	        <cfset flashInsert(error="Imagetype #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- imagetypes/create --->
	<cffunction name="create">
		<cfset imagetype = model("Imagetype").new(params.imagetype)>
		
		<!--- Verify that the imagetype creates successfully --->
		<cfif imagetype.save()>
			<cfset flashInsert(success="The imagetype was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the imagetype.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- imagetypes/update --->
	<cffunction name="update">
		<cfset imagetype = model("Imagetype").findByKey(params.key)>
		
		<!--- Verify that the imagetype updates successfully --->
		<cfif imagetype.update(params.imagetype)>
			<cfset flashInsert(success="The imagetype was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the imagetype.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- imagetypes/delete/key --->
	<cffunction name="delete">
		<cfset imagetype = model("Imagetype").findByKey(params.key)>
		
		<!--- Verify that the imagetype deletes successfully --->
		<cfif imagetype.delete()>
			<cfset flashInsert(success="The imagetype was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the imagetype.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
