<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_object")>
        <cfset property(name="id", column="object_id") />
    </cffunction>
</cfcomponent>
