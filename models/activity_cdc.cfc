<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity_Other")>
        <cfset property(name="id", column="Activity_OtherID") />
		<cfset accessibleProperties(properties="ActivityID,DidacticHrs,ExperimentalHrs,SecClinSiteFlag,CollabPTCFlag,CollabPTCSpecify,CollabAgencyFlag,CollabAgencySpecify") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
