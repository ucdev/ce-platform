<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_pageLayout")>
        <cfset property(name="id", column="layout_id") />
    </cffunction>
</cfcomponent>
