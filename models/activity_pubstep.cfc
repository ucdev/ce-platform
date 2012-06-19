<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_PubStep")>
        <cfset property(name="id", column="ActivityStepID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
