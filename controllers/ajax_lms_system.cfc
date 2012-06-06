<cfcomponent extends="controller">
	<cffunction name="hideWelcome"  returntype="string">
    	<cfset application.sys.hideWelcome()>
		
		<cfreturn "success" />
	</cffunction>
</cfcomponent>