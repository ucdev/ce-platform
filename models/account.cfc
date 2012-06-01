<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Account")>
        <cfset property(name="id", column="AccountID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
