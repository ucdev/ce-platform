<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Authority")>
        <cfset property(name="id", column="AuthorityID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
