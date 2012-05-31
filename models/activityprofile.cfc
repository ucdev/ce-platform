<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_activity_profile")>
        <cfset property(name="id", column="activity_id") />
    </cffunction>
</cfcomponent>
