<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_FunRC")>
        <cfset property(name="id", column="FunRCID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
