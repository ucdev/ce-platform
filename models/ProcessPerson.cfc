<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Process_Person")>
        <cfset property(name="id", column="Process_PersonID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
