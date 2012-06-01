<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("page_section")>
        <cfset property(name="id", column="page_section_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
