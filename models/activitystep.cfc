<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("activity_step")>
        <cfset property(name="id", column="activityStepId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
