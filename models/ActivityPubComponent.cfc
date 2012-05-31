<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_PubComponent")>
        <cfset property(name="id", column="PubComponentID") />
    </cffunction>
</cfcomponent>
