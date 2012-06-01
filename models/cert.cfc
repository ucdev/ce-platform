<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Cert")>
        <cfset property(name="id", column="certId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
