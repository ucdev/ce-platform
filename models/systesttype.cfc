<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_TestType")>
        <cfset property(name="id", column="TestTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
