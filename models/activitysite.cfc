<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Site")>
        <cfset property(name="id", column="ActivitySiteID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
