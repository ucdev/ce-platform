<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Cert_Credit")>
        <cfset property(name="id", column="certCreditId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
