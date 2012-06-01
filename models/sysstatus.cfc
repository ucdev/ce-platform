<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Status")>
        <cfset property(name="id", column="StatusID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
