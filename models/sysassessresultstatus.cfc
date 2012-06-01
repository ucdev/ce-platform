<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_AssessResultStatus")>
        <cfset property(name="id", column="ResultStatusID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
