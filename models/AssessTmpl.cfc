<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_AssessTmpl")>
        <cfset property(name="id", column="AssessTmplID") />
    </cffunction>
</cfcomponent>
