<cfcomponent extends="Controller" output="false">
	
	<!--- images/index --->
	<cffunction name="index">
		<cfset images = model("Image").findAll()>
	</cffunction>
	
	<cffunction name="fugues">
		<cfdirectory name="icons" action="list" directory="#expandPath('/images/fugue/')#" filter="*.png">
		
		<cfset baseDir = expandPath("/images/fugue") />
		<cfset dir = {} />
		<cfset dir['original'] = baseDir & "/" />
		<cfset dir['basic'] = baseDir & "-basic/" />
		<cfset dir['basic-mini'] = baseDir & "-basic-mini/" />
		
		<cfset keepers = [] />
		
		<cfloop query="icons">
			<cfif icons.name DOES NOT CONTAIN "--">
				<cfif listLen(icons.name,'-') LTE 1>
					<cfset keepers.add(icons.name) />
					
					<!---
					<cffile action="copy" source="#dir['original']##icons.name#" destination="#dir['basic']##icons.name#">
					--->
					<cfset origImg = imageRead(dir['original'] & icons.name) />
					<cfset ImageScaleToFit(origImg, 14, 14) />
					<cfset imageWrite(origImg,dir['basic-mini'] & icons.name) />
				</cfif>
			</cfif>
		</cfloop>
		
		<cfdump var="#keepers#" abort />
	</cffunction>
	
	<!--- images/show/key --->
	<cffunction name="show">
		
		<!--- Find the record --->
    	<cfset image = model("Image").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(image)>
	        <cfset flashInsert(error="Image #params.key# was not found")>
	        <cfset redirectTo(action="index")>
	    </cfif>
			
	</cffunction>
	
	<!--- images/new --->
	<cffunction name="new">
		<cfset image = model("Image").new()>
	</cffunction>
	
	<!--- images/edit/key --->
	<cffunction name="edit">
	
		<!--- Find the record --->
    	<cfset image = model("Image").findByKey(params.key)>
    	
    	<!--- Check if the record exists --->
	    <cfif NOT IsObject(image)>
	        <cfset flashInsert(error="Image #params.key# was not found")>
			<cfset redirectTo(action="index")>
	    </cfif>
		
	</cffunction>
	
	<!--- images/create --->
	<cffunction name="create">
		<cfset image = model("Image").new(params.image)>
		
		<!--- Verify that the image creates successfully --->
		<cfif image.save()>
			<cfset flashInsert(success="The image was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the image.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- images/update --->
	<cffunction name="update">
		<cfset image = model("Image").findByKey(params.key)>
		
		<!--- Verify that the image updates successfully --->
		<cfif image.update(params.image)>
			<cfset flashInsert(success="The image was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error updating the image.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- images/delete/key --->
	<cffunction name="delete">
		<cfset image = model("Image").findByKey(params.key)>
		
		<!--- Verify that the image deletes successfully --->
		<cfif image.delete()>
			<cfset flashInsert(success="The image was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the image.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
