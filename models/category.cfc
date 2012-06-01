<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Category")>
        <cfset property(name="id", column="CategoryID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
