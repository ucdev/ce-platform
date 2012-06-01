<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Comment")>
        <cfset property(name="id", column="ActivityCommentID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
