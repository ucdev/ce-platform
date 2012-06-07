<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("sys_stat_type")>
        <cfset property(name="id", column="statTypeId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
