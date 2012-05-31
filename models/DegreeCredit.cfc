<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Degree_Credit")>
        <cfset property(name="id", column="degreeCreditId") />
    </cffunction>
</cfcomponent>
