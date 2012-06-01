<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Person_File")>
        <cfset property(name="id", column="PersonFileID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
