<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Cert")>
        <cfset property(name="id", column="certId") />
    </cffunction>
</cfcomponent>
