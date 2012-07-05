<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("credit_requests")>
		<cfset validatesUniquenessOf(property="recordHash",message="Already imported.") />
		<!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
