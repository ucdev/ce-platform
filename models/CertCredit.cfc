<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Cert_Credit")>
        <cfset property(name="id", column="certCreditId") />
    </cffunction>
</cfcomponent>
