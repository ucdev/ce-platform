<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Vote")>
        <cfset property(name="id", column="ActivityVoteID") />
    </cffunction>
</cfcomponent>
