<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_HistoryType")>
        <cfset property(name="id", column="HistoryTypeID") />
    </cffunction>
</cfcomponent>
