<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_ProjectType")>
        <cfset property(name="id", column="ProjectTypeID") />
    </cffunction>
</cfcomponent>
