<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Process")>
        <cfset property(name="id", column="ProcessID") />
    </cffunction>
</cfcomponent>
