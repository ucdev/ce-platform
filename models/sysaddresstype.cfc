<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Sys_AddressType")>
        <cfset property(name="id", column="AddressTypeID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
