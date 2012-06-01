<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Person_SpecialtyLMS")>
        <cfset property(name="id", column="PersonSpecialtyID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
