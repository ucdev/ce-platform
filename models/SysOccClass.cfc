<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_OccClass")>
        <cfset property(name="id", column="OccClassID") />
    </cffunction>
</cfcomponent>
