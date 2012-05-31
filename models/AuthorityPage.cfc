<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AuthorityPage")>
        <cfset property(name="id", column="AuthorityPageID") />
    </cffunction>
</cfcomponent>
