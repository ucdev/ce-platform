<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ProcessStep_Activity")>
        <cfset property(name="id", column="Step_ActivityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
