<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Degree")>
        <cfset property(name="id", column="DegreeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
