<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ProcessStep")>
        <cfset property(name="id", column="StepID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
