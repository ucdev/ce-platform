<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_EmailStyle")>
        <cfset property(name="id", column="EmailStyleID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
