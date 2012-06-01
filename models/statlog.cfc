<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("stat_log")>
        <cfset property(name="id", column="logId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
