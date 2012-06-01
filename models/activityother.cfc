<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Other")>
        <cfset property(name="id", column="OtherID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
