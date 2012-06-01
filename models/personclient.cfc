<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_Client")>
        <cfset property(name="id", column="personConnectId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
