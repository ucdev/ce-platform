<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("object")>
        <cfset property(name="id", column="object_id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
