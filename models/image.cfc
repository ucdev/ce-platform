<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_image")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
