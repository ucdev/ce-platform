<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_sys_activityRole")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
