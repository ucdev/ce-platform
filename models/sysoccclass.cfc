<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_OccClass")>
        <cfset property(name="id", column="OccClassID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
