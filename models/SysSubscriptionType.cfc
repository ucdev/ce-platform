<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_SubscriptionType")>
        <cfset property(name="id", column="SubscriptionTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
