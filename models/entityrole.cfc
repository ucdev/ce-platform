<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_entityrole")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
