<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("activity_profile")>
        <cfset property(name="id", column="activity_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
