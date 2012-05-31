<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_Pref")>
        <cfset property(name="id", column="PersonPrefID") />
    </cffunction>
</cfcomponent>
