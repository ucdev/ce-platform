<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_GroupType")>
        <cfset property(name="id", column="partnerTypeId") />
    </cffunction>
</cfcomponent>
