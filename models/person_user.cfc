<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("person_user")>
        <cfset property(name="id", column="person_id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
