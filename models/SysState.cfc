<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_State")>
        <cfset property(name="id", column="stateid") />
    </cffunction>
</cfcomponent>
