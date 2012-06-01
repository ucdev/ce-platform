<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("AttendeeCredit")>
        <cfset property(name="id", column="AttendeeCreditID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
