<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("objectFieldType")>
        <cfset property(name="id", column="id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
