<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_HistoryStyle")>
        <cfset property(name="id", column="HistoryStyleID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
