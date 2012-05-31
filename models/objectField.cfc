<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_objectField")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
