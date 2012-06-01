<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("entity_relate")>
        <cfset property(name="id", column="entity_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
