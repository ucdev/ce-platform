<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person")>
        <cfset property(name="id", column="PersonID") />
    </cffunction>
</cfcomponent>
