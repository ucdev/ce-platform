<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_PubGeneral")>
        <cfset property(name="id", column="PubGeneralID") />
    </cffunction>
</cfcomponent>
