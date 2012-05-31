<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_ProfC")>
        <cfset property(name="id", column="ProfCID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
