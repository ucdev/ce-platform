<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Attendee_Step")>
        <cfset property(name="id", column="AttendeeStepID") />
    </cffunction>
</cfcomponent>
