<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("AssessSection")>
        <cfset property(name="id", column="SectionID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
