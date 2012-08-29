<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_ActivityStepType")>
        <cfset property(name="id", column="StepTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
