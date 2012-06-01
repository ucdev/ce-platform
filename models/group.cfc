<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Group")>
        <cfset property(name="id", column="groupId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
