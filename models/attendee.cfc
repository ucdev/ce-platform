<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Attendee")>
        <cfset property(name="id", column="AttendeeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
