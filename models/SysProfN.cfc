<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_ProfN")>
        <cfset property(name="id", column="ProfNID") />
    </cffunction>
</cfcomponent>
