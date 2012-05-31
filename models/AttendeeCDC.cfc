<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AttendeeCDC")>
        <cfset property(name="id", column="AttendeeCDCID") />
    </cffunction>
</cfcomponent>
