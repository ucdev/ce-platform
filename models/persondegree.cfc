<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Person_Degree")>
        <cfset property(name="id", column="PersonDegreeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
