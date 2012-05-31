<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Status")>
        <cfset property(name="id", column="StatusID") />
    </cffunction>
</cfcomponent>
