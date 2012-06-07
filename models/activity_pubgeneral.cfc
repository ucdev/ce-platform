<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_PubGeneral")>
        <cfset property(name="id", column="PubGeneralID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
