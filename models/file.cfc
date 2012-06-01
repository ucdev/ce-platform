<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_File")>
        <cfset property(name="id", column="FileID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
