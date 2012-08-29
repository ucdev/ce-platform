<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_FinSupport")>
        <cfset property(name="id", column="SupportID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
