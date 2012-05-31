<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_degree")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
