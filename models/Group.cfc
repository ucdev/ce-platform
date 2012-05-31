<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Group")>
        <cfset property(name="id", column="groupId") />
    </cffunction>
</cfcomponent>
