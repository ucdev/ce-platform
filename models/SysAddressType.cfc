<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Sys_AddressType")>
        <cfset property(name="id", column="AddressTypeID") />
    </cffunction>
</cfcomponent>
