<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_activity_step")>
        <cfset property(name="id", column="activityStepId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
