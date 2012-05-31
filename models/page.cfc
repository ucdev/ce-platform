<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_page")>
        <cfset property(name="id", column="page_id") />
    </cffunction>
</cfcomponent>
