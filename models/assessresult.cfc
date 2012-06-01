<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("AssessResult")>
        <cfset property(name="id", column="ResultID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
