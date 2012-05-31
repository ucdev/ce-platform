<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Account")>
        <cfset property(name="id", column="AccountID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
