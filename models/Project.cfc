<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Project")>
        <cfset property(name="id", column="ProjectID") />
    </cffunction>
</cfcomponent>
