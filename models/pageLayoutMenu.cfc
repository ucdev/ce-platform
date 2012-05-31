<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_pageLayoutMenu")>
        <cfset property(name="id", column="menu_id") />
    </cffunction>
</cfcomponent>
