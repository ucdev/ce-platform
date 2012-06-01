<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity")>
        <cfset property(name="id", column="ActivityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
        
        <cfset belongsTo(name="activityType", modelName="sysActivityType", foreignKey="activityTypeId") />
        <cfset belongsTo(name="grouping", modelName="sysGrouping", foreignKey="groupingId") />
        <cfset belongsTo(name="status", modelName="sysStatus", foreignKey="statusId")>
    </cffunction>
</cfcomponent>
