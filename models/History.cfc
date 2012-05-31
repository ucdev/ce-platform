<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_History")>
        <cfset property(name="id", column="HistoryID") />
    </cffunction>
</cfcomponent>
