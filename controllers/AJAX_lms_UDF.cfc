<cfcomponent extends="controller">
	<cffunction name="getRandomString" access="Remote" returntype="string">
		<cfargument name="Format" type="string" required="no" default="Numeric">
        <cfargument name="Length" type="numeric" required="no" default="3">
        
        <cfset var Status = Application.UDF.getRandomString(Format=Arguments.Format,Length=Arguments.Length)>
		<cfreturn Status />
	</cffunction>
</cfcomponent>