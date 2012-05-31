<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Agenda")>
        <cfset property(name="id", column="AgendaID") />
    </cffunction>
</cfcomponent>
