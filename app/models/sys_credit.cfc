<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Credit")>
        <cfset property(name="id", column="CreditID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
