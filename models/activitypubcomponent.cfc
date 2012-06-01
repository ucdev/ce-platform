<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_PubComponent")>
        <cfset property(name="id", column="PubComponentID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
