<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("AssessAnswer")>
        <cfset property(name="id", column="AnswerID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
