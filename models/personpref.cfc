<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Person_Pref")>
        <cfset property(name="id", column="PersonPrefID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
