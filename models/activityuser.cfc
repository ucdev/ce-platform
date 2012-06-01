<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("activity_user")>
        <cfset property(name="id", column="activityUser_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
