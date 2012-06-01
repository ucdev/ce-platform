<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("AuthorityPage")>
        <cfset property(name="id", column="AuthorityPageID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
