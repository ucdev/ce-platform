<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Subscription")>
        <cfset property(name="id", column="SubscriptionID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
