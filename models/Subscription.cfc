<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Subscription")>
        <cfset property(name="id", column="SubscriptionID") />
    </cffunction>
</cfcomponent>
