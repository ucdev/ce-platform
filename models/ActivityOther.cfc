<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Other")>
        <cfset property(name="id", column="OtherID") />
    </cffunction>
</cfcomponent>
