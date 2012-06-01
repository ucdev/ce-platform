<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_ProjectType")>
        <cfset property(name="id", column="ProjectTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
