<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_OrgType")>
        <cfset property(name="id", column="OrgTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
