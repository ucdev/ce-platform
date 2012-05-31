<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_Address")>
        <cfset property(name="id", column="AddressID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
