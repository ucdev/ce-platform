<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Assessment")>
        <cfset property(name="id", column="AssessmentID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
