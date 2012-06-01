<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("pageLayoutMenu")>
        <cfset property(name="id", column="menu_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
