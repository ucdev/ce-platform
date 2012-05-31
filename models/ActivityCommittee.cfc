<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Committee")>
        <cfset property(name="id", column="CommitteeID") />
    </cffunction>
</cfcomponent>
