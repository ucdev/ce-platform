<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("entitytype")>
        <cfset property(name="id", column="id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
