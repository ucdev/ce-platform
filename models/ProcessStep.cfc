<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_ProcessStep")>
        <cfset property(name="id", column="StepID") />
    </cffunction>
</cfcomponent>
