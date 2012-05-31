<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_SpecialtyLMS")>
        <cfset property(name="id", column="SpecialtyID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
