<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_apiClient")>
        <cfset property(name="id", column="clientid") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
