<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Credit")>
        <cfset property(name="id", column="Activity_CreditID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
