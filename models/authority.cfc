<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Authority")>
        <cfset property(name="id", column="AuthorityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
