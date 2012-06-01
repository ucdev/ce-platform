<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_HistoryType")>
        <cfset property(name="id", column="HistoryTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
