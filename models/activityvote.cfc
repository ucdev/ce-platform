<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Vote")>
        <cfset property(name="id", column="ActivityVoteID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
