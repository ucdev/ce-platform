<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("activity_pubgeneral")>
        <cfset property(name="id", column="pubgeneralid") />
    </cffunction>
</cfcomponent>
