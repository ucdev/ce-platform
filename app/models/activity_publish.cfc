<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_activity_pubgeneral")>
        <cfset property(name="id", column="pubgeneralid") />
    </cffunction>
</cfcomponent>
