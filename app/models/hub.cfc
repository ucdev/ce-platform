<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_hub")>
        <cfset property(name="id", column="id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
