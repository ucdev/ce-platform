<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_FinSupport")>
        <cfset property(name="id", column="SupportID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
