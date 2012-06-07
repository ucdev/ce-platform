<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Supporter")>
        <cfset property(name="id", column="ContributorID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
