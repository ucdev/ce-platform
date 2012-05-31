<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_activity_user")>
        <cfset property(name="id", column="activityUser_id") />
    </cffunction>
</cfcomponent>
