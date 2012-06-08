<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("activity_category")>
        <cfset property(name="id", column="activity_categoryId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
