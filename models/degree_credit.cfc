<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Degree_Credit")>
        <cfset property(name="id", column="degreeCreditId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
