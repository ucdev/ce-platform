<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_File")>
        <cfset property(name="id", column="PersonFileID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
