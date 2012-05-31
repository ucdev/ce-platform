<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_objectType")>
        <cfset property(name="id", column="objectTypeId") />
    </cffunction>
</cfcomponent>
