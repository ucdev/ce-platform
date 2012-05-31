<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_FunRN")>
        <cfset property(name="id", column="FunRNID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
