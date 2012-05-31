<cfcomponent displayname="Translate Modern English to Middle English">
	<cffunction name="translate" access="remote" output="yes">
		<cfargument name="text" type="string" required="yes">
		
		<cfset var sentences = REMatch(".",arguments.text) />
		
		<cfdump var="#sentences#"><cfabort>
	</cffunction>
</cfcomponent>