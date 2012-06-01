<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_SubscriptionType")>
        <cfset property(name="id", column="SubscriptionTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
