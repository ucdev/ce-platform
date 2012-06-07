<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("entity_person")>
        <cfset property(name="id", column="entity_person_id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
