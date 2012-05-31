<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_Email")>
        <cfset property(name="id", column="email_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
