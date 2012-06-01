<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_CategoryLMS")>
        <cfset property(name="id", column="Activity_LMS_CategoryID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
