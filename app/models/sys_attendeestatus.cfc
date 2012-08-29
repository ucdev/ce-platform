<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_AttendeeStatus")>
        <cfset property(name="id", column="AttendeeStatusID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
