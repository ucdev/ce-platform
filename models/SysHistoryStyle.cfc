<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_HistoryStyle")>
        <cfset property(name="id", column="HistoryStyleID") />
    </cffunction>
</cfcomponent>
