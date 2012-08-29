<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_PersonStatus")>
        <cfset property(name="id", column="PersonStatusID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
