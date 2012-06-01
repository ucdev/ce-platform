<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Role")>
        <cfset property(name="id", column="RoleID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
