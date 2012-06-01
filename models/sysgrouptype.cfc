<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_GroupType")>
        <cfset property(name="id", column="partnerTypeId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
