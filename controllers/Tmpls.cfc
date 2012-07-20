<cfcomponent extends="Controller">
	<cffunction name="loader">
		<cfset controllerKey = ListFirst(params.key,"-") />
		<cfset tmplKey = ListLast(params.key,"-") />
		
		<cfif fileExists(expandPath("/views/#controllerKey#/templates/_#tmplKey#.cfm"))>
			<cfset renderText(renderPartial(partial="/#controllerKey#/templates/#tmplKey#",returnAs="string")) />
		</cfif>
	</cffunction>
</cfcomponent>