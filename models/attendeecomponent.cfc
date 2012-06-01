<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Attendee_Component")>
        <cfset property(name="id", column="CompStatusID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
