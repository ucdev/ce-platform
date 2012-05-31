<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Note")>
        <cfset property(name="id", column="NoteID") />
    </cffunction>
</cfcomponent>
