<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_activity_tag_relates")>
        <cfset property(name="id", column="id") />
    </cffunction>
</cfcomponent>
