<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Attendee")>
        <cfset property(name="id", column="AttendeeID") />
    </cffunction>
</cfcomponent>
