<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AssessResult")>
        <cfset property(name="id", column="ResultID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
