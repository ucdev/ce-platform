<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Credit")>
        <cfset property(name="id", column="Activity_CreditID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
