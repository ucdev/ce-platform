<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_page_element")>
        <cfset property(name="id", column="page_info_id") />
    </cffunction>
</cfcomponent>
