<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Project")>
        <cfset property(name="id", column="ProjectID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
