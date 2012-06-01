<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Report")>
        <cfset property(name="id", column="ReportID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
