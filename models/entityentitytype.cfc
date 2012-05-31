<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_entity_entitytype")>
        <cfset property(name="id", column="entity_id") />
    </cffunction>
</cfcomponent>
