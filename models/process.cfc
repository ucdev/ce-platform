<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Process")>
        <cfset property(name="id", column="ProcessID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
