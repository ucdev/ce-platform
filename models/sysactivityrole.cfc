<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("sys_activityRole")>
        <cfset property(name="id", column="id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
