<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Comment")>
        <cfset property(name="id", column="ActivityCommentID") />
    </cffunction>
</cfcomponent>
