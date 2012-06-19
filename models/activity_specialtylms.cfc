<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_SpecialtyLMS")>
        <cfset property(name="id", column="Activity_LMS_SpecialtyID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
