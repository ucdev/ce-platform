<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("File")>
        <cfset property(name="id", column="FileID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
