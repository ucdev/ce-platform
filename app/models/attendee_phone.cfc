<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_attendee")>
        <cfset property(name="id", column="AttendeeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
        
        <cfset accessibleProperties('phone1, phone1ext, phone2, phone2ext, fax, faxext') />
    </cffunction>
</cfcomponent>