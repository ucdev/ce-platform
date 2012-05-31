<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_entity")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
