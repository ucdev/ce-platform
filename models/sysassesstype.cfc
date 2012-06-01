<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_AssessType")>
        <cfset property(name="id", column="AssessTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
