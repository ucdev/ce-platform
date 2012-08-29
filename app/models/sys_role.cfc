<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Role")>
        <cfset property(name="id", column="RoleID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
