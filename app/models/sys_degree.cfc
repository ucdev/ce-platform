<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Degree")>
        <cfset property(name="id", column="DegreeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
