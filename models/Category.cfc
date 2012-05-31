<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Category")>
        <cfset property(name="id", column="CategoryID") />
    </cffunction>
</cfcomponent>
