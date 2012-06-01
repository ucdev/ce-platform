<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Grouping")>
        <cfset property(name="id", column="GroupingID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
