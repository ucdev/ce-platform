<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_TestType")>
        <cfset property(name="id", column="TestTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
