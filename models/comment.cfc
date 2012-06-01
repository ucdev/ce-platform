<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Comment")>
        <cfset property(name="id", column="CommentID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
