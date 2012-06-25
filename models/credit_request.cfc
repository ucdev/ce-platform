<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("credit_requests")>
		<cfset validatesUniquenessOf(property="recordHash",message="Invalid request. We already have your attendance logged for this event.") />
		<!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
