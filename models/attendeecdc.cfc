<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AttendeeCDC")>
        <cfset property(name="id", column="AttendeeCDCID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
