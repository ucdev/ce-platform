<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Person")>
        <cfset property(name="id", column="PersonID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
