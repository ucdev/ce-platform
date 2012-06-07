<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("page_element")>
        <cfset property(name="id", column="page_info_id") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
