<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_FinFee")>
        <cfset property(name="id", column="FeeID") />
    </cffunction>
</cfcomponent>
