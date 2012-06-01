<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("pageLayoutMenu_page")>
        <cfset property(name="id", column="menu_id") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
