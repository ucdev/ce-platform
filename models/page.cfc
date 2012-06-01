<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("page")>
        <cfset property(name="id", column="page_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
