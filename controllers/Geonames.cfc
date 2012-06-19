<cfcomponent extends="Controller">
	<cffunction name="findLocation">
    	<cfdump var="#params#"><cfabort>
		<cfset myResult="foo">
		<cfreturn myResult>
	</cffunction>
</cfcomponent>