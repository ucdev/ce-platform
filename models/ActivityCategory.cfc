<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Category")>
        <cfset property(name="id", column="Activity_CategoryID") />
    </cffunction>
</cfcomponent>
