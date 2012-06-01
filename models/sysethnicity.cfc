<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_Ethnicity")>
        <cfset property(name="id", column="EthnicityID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
