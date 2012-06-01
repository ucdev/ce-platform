<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_AssessQuestionType")>
        <cfset property(name="id", column="QuestionTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
