<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Credit")>
        <cfset property(name="id", column="CreditID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
