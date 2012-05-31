<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AssessQuestion")>
        <cfset property(name="id", column="QuestionID") />
    </cffunction>
</cfcomponent>
