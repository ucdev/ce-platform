<cfcomponent extends="controller">
	<cffunction name="hideWelcome" >
    	<cfset application.sys.hideWelcome()>
		
		<cfreturn "success" />
	</cffunction>
</cfcomponent>