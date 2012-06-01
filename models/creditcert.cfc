<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Credit_Cert")>
        <cfset property(name="id", column="creditCertId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
