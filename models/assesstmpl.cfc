<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("AssessTmpl")>
        <cfset property(name="id", column="AssessTmplID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
