<cfcomponent extends="controller">
	<cffunction name="getRandomString"  returntype="string">
		<cfparam name="params.Format" type="string" required="no" default="Numeric">
        <cfparam name="params.Length" type="numeric" required="no" default="3">
        
        <cfset var Status = Application.UDF.getRandomString(Format=Arguments.Format,Length=Arguments.Length)>
		<cfreturn Status />
	</cffunction>
</cfcomponent>