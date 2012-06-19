<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Agenda")>
        <cfset property(name="id", column="AgendaID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
