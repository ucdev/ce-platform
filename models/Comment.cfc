<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Comment")>
        <cfset property(name="id", column="CommentID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
