<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Comment")>
        <cfset property(name="id", column="CommentID") />
    </cffunction>
</cfcomponent>
