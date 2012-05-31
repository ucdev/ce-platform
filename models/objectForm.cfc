<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_objectForm")>
        <cfset property(name="id", column="id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
