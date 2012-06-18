<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("attendee")>
        <cfset property(name="id", column="AttendeeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
        
        <cfset accessibleProperties('firstName, middleName, lastName, certName, email, statusId, mdFlag, termsFlag, paymentFlag, payAmount, payOrderNo, paymentDate, emailSentFlag, registerDate, completeDate, termDate, deletedFlag') />
    </cffunction>
</cfcomponent>