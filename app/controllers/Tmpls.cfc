<cfcomponent extends="Controller">
	<cffunction name="init">

	</cffunction>
	<cffunction name="loader">
		<cfset controllerKey = ListFirst(params.key,"-") />
		<cfset tmplKey = ListLast(params.key,"-") />
		
		<cfif fileExists(expandPath("/views/#controllerKey#/templates/_#tmplKey#.cfm"))>
			<cfset renderText(renderPartial(partial="/#controllerKey#/templates/#tmplKey#",returnAs="string")) />
		<cfelse>
			<cfset renderText("template_failed_to_load") />
		</cfif>
	</cffunction>
</cfcomponent>