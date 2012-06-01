<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_ActivityType")>
        <cfset property(name="id", column="ActivityTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
