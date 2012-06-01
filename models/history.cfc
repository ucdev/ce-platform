<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("History")>
        <cfset property(name="id", column="HistoryID") />
        <cfset setPrimaryKey(property="id") />
    </cffunction>
</cfcomponent>
