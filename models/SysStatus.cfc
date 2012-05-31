<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Status")>
        <cfset property(name="id", column="StatusID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
