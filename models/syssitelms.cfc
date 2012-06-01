<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_SiteLMS")>
        <cfset property(name="id", column="SiteID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
