<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Supporter")>
        <cfset property(name="id", column="ContributorID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
