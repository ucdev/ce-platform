<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Category")>
        <cfset property(name="id", column="Activity_CategoryID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
