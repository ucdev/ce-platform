<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Certificate")>
        <cfset property(name="id", column="certificateId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
