<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_FinBudget")>
        <cfset property(name="id", column="BudgetID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
</cfcomponent>
