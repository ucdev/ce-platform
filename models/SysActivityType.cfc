<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_ActivityType")>
        <cfset property(name="id", column="ActivityTypeID") />
    </cffunction>
</cfcomponent>
