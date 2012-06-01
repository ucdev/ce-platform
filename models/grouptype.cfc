<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("GroupType")>
        <cfset property(name="id", column="group_TypeId") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
