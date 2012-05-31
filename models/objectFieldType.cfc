<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_objectFieldType")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
