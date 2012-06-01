<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_Ethnicity")>
        <cfset property(name="id", column="EthnicityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
