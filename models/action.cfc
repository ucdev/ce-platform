<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Action")>
        <cfset property(name="id", column="ActionID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
