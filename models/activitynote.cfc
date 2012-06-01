<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Note")>
        <cfset property(name="id", column="NoteID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
