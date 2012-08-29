<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_PrinEmp")>
        <cfset property(name="id", column="PrinEmpID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
