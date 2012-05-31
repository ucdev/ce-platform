<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person")>
        <cfset property(name="id", column="PersonID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
