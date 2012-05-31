<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_SpecialtyLMS")>
        <cfset property(name="id", column="PersonSpecialtyID") />
    </cffunction>
</cfcomponent>
