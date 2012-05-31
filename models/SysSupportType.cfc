<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_SupportType")>
        <cfset property(name="id", column="ContribTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
