<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ProcessManager")>
        <cfset property(name="id", column="ProcessManagerID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
