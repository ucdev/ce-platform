<cfcomponent extends="Wheels">
	<cffunction name="subLayout">
		<cfargument name="layoutFile" type="string" required="no" default="" />
		
		<cfset renderText($renderLayout($layout='/layout',$type='template',$content=$renderPage($template="",$controller=params.controller,$action=params.action,$layout="/layout_#arguments.layoutFile#"))) />
	</cffunction>
	
	<cffunction name="pageTitle">
		<cfargument name="titleText" type="string" required="no" default="" />
		
		<cfset contentFor(pageTitle=arguments.titleText) />
	</cffunction>
	
	<cffunction name="pageSubTitle">
		<cfargument name="titleText" type="string" required="no" default="" />
		
		<cfset contentFor(pageSubTitle=arguments.titleText) />
	</cffunction>
</cfcomponent>