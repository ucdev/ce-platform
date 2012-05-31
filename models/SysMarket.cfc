<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Market")>
        <cfset property(name="id", column="MarketID") />
    </cffunction>
</cfcomponent>
