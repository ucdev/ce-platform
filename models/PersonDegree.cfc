<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Person_Degree")>
        <cfset property(name="id", column="PersonDegreeID") />
    </cffunction>
</cfcomponent>
