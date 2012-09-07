<cfcomponent extends="Controller">
	<cffunction name="init">
		<cfset provides("css,js") />
	</cffunction>

	<cffunction name="sprockets">

	</cffunction>
	
	<cffunction name="sprites">
		<cfparam name="params.images" default="" />
		<cfset spriteHash = "" />
		<cfset imageFileList = [] />
		<cfset var response = createObject("component","lib.buildStruct").init(status=false,statusMsg="failed to locate resource.") />
		<cfset cssStore = expandPath("/stylesheets/sprites/") />
		<cfset imgStore = expandPath("/images/sprites/") />
		<cfset imgString = arrayTolist(params.images,',') />
		
		<cfif arrayLen(params.images)>
			<cfset spriteHash = left(lcase(HASH(imgString,'MD5')),5) />
		</cfif>
		
		<cfloop from="1" to="#arrayLen(params.images)#" index="i">
			<cfset imgFile = replace(params.images[i],'icon16-','') & ".png" />
			<cfset imageFileList.add(imgFile) />
		</cfloop>
		
		<cfif NOT directoryExists(imgStore)>
			<cfdirectory action="create" directory="#imgStore#">
		</cfif>
		
		<cfif NOT directoryExists(cssStore)>
			<cfdirectory action="create" directory="#cssStore#">
		</cfif>
		
		<cfset spritr = createObject("component","lib.sprite-generator.SpriteGenerator").generateFromList(
			arrImageList=imageFileList,
			sImagePath=expandPath("\images\fugue\"),
			sImageStorageLocation=imgStore,
			sStylesheetStorageLocation=cssStore,
			sName=spriteHash,
			bOneColumn=true) />
		
		<cfcontent type="text/javascript">
		<cfset renderText(spriteHash) />
	</cffunction>
	
	<cffunction name="jsloader">
		<cfparam name="params.key">
		
		<cfcontent type="text/javascript" />
		
		<cfset renderText(renderPartial(partial="/#params.key#",returnAs="string")) />
	</cffunction>
	
	<!---<cffunction name="spriteloader">
		<cfparam name="params.key">
		
		<cfcontent type="text/javascript" />
		
		<cfset renderText(renderPartial(partial="/#params.key#",returnAs="string")) />
	</cffunction>--->
</cfcomponent>



