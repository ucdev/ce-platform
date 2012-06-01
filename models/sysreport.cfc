<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Report")>
        <cfset property(name="id", column="ReportID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
