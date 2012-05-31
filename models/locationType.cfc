<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_locationType")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
