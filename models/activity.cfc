<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity")>
        <cfset property(name="id", column="ActivityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
