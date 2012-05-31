<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_ProcessManager")>
        <cfset property(name="id", column="ProcessManagerID") />
    </cffunction>
</cfcomponent>
