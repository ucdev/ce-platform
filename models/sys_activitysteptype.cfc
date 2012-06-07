<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_ActivityStepType")>
        <cfset property(name="id", column="StepTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
