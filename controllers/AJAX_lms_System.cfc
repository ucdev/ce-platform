<cfcomponent>
	<cffunction name="hideWelcome" access="remote" returntype="string">
    	<cfset application.sys.hideWelcome()>
		
		<cfreturn "success" />
	</cffunction>
</cfcomponent>