<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("location")>
        <cfset property(name="id", column="id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
