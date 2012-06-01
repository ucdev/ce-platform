<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Agenda")>
        <cfset property(name="id", column="AgendaID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
