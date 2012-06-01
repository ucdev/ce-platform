<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_CBAFund")>
        <cfset property(name="id", column="CBAFundID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
