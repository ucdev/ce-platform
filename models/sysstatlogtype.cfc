<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("sys_stat_log_type")>
        <cfset property(name="id", column="statLogId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
