<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_HistoryStyle")>
        <cfset property(name="id", column="HistoryStyleID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
