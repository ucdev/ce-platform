<cfcomponent extends="controller">
	<cffunction name="getRandomString" >
		<cfparam name="params.Format" type="string"  default="Numeric">
        <cfparam name="params.Length" type="numeric"  default="3">
        
        <cfset var Status = Application.UDF.getRandomString(Format=params.Format,Length=params.Length)>
		<cfset renderText(Status) />
	</cffunction>
</cfcomponent>