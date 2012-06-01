<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("stat_entry")>
        <cfset property(name="id", column="statEntryId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
