<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_CategoryLMS")>
        <cfset property(name="id", column="CategoryID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
