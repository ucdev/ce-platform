<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("geoname")>
        <cfset property(name="id", column="geonameid") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>