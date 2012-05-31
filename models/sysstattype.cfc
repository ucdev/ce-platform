<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_sys_stat_type")>
        <cfset property(name="id", column="statTypeId") />
    </cffunction>
</cfcomponent>
