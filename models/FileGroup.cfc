<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_FileGroup")>
        <cfset property(name="id", column="FileGroupID") />
    </cffunction>
</cfcomponent>
