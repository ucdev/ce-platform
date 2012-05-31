<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AttendeeCredit")>
        <cfset property(name="id", column="AttendeeCreditID") />
    </cffunction>
</cfcomponent>
