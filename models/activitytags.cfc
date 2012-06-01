<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("activity_tags")>
        <cfset property(name="id", column="id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
