<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_AssessType")>
        <cfset property(name="id", column="AssessTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
