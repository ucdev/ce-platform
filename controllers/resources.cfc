<cfcomponent extends="Controller">

	<cffunction name="sprites">
		<cfparam name="params.images" default="" />
		
		<cfset spriteHash = "" />
		<cfset imageFileList = "" />
		
		<cfif listLen(params.images,',') GT 0>
			<cfset spriteHash = lcase(HASH(params.images,'MD5')) />
		</cfif>
		
		<cfloop list="#params.images#" index="i" delimiters=",">
			<cfset imgFile = replace(i,'icon16-','') & ".png" />
			<cfset imageFileList = listAppend(imageFileList,imgFile,',') />
		</cfloop>
		
		<cfset spritr = createObject("component","lib.sprite-generator.SpriteGenerator").generateFromList(
			sImageList=imageFileList,
			sImagePath=expandPath("/images/fugue/"),
			sImageStorageLocation=expandPath("/images/sprites/"),
			sStylesheetStorageLocation=expandPath("/stylesheets/sprites/"),
			sName=spriteHash) />
		
		<cfset renderText(spriteHash) />
	</cffunction>
</cfcomponent>



