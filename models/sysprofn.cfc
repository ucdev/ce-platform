<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_ProfN")>
        <cfset property(name="id", column="ProfNID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
