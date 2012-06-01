<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_SupportType")>
        <cfset property(name="id", column="ContribTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
