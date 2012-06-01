<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("hub")>
        <cfset property(name="id", column="id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
