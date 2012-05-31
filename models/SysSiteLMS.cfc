<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_SiteLMS")>
        <cfset property(name="id", column="SiteID") />
    </cffunction>
</cfcomponent>
