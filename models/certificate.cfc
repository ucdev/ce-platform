<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Certificate")>
        <cfset property(name="id", column="certificateId") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
