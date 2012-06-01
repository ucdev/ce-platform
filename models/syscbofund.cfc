<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_CBOFund")>
        <cfset property(name="id", column="CBOFundID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
