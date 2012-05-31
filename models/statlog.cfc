<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_stat_log")>
        <cfset property(name="id", column="logId") />
    </cffunction>
</cfcomponent>
