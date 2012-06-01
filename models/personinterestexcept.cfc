<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Person_Interest_Except")>
        <cfset property(name="id", column="PersonIntExceptID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
