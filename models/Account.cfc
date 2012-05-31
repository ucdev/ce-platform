<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Account")>
        <cfset property(name="id", column="AccountID") />
    </cffunction>
</cfcomponent>
