<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity")>
        <cfset property(name="id", column="ActivityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
