<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Attendee_Step")>
        <cfset property(name="id", column="AttendeeStepID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
