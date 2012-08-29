<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Other")>
        <cfset property(name="id", column="Activity_OtherID") />
		<cfset accessibleProperties(properties="activityId,competenceDesign,performanceDesign,outcomesDesign,competenceEval,performanceEval,outcomesEval") />
        
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>