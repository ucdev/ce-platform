<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AssessSection")>
        <cfset property(name="id", column="SectionID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
