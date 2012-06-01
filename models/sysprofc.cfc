<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_ProfC")>
        <cfset property(name="id", column="ProfCID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
