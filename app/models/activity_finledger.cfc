<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_FinLedger")>
		<cfset property(name="id", column="EntryID") />
    </cffunction>
</cfcomponent>
