<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_stat_entry")>
        <cfset property(name="id", column="statEntryId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
