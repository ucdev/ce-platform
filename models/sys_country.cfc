<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Country")>
        <cfset property(name="id", column="id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
