<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Assessment")>
        <cfset property(name="id", column="AssessmentID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
