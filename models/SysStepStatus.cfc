<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_StepStatus")>
        <cfset property(name="id", column="StepStatusID") />
    </cffunction>
</cfcomponent>
