<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_FileType")>
        <cfset property(name="id", column="FileTypeID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
