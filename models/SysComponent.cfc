<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Component")>
        <cfset property(name="id", column="ComponentID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
