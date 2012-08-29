<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_attendee")>
        <cfset property(name="id", column="AttendeeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
        
        <cfset accessibleProperties('address1, address2, geoNameId, postalCode, city, stateProvince, stateId, countryId') />
    </cffunction>
</cfcomponent>