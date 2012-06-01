<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Process_Person")>
        <cfset property(name="id", column="Process_PersonID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
