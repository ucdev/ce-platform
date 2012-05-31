<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Application")>
        <cfset property(name="id", column="ApplicationID") />
    </cffunction>
</cfcomponent>
