<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("AssessQuestion")>
        <cfset property(name="id", column="QuestionID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
