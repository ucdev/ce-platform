<cfcomponent extends="Wheels">
	<cffunction name="subLayout">
		<cfargument name="layoutFile" type="string" required="no" default="" />
		

		<cfset renderText($renderLayout($layout='/layout',$type='template',$content=$renderPage($template="",$controller=params.controller,$action=params.action,$layout="/layout_#arguments.layoutFile#"))) />
	</cffunction>
</cfcomponent>