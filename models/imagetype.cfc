<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_imagetype")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
