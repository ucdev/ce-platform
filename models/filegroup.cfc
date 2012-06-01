<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("FileGroup")>
        <cfset property(name="id", column="FileGroupID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
