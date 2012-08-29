<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_AssessQuestionType")>
        <cfset property(name="id", column="QuestionTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
