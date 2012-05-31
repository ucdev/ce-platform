<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_Note")>
        <cfset property(name="id", column="NoteID") />
    </cffunction>
</cfcomponent>
