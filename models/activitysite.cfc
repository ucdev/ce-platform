<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Site")>
        <cfset property(name="id", column="ActivitySiteID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
