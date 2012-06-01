<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_EmailStyle")>
        <cfset property(name="id", column="EmailStyleID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
