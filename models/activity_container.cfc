<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_activity_category")>
        <cfset property(name="id", column="activity_categoryId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
