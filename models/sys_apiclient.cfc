<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_apiClient")>
        <cfset property(name="id", column="clientid") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
