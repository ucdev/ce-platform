<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Market")>
        <cfset property(name="id", column="MarketID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
