<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_State")>
        <cfset property(name="id", column="stateid") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
