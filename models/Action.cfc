<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Action")>
        <cfset property(name="id", column="ActionID") />
    </cffunction>
</cfcomponent>
