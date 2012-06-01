<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Subscription")>
        <cfset property(name="id", column="SubscriptionID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
