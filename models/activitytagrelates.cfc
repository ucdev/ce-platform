<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("activity_tag_relates")>
        <cfset property(name="id", column="id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
