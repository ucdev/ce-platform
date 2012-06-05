<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity")>
        <cfset property(name="id", column="ActivityID") />
        <!---<cfset setPrimaryKey(property="id") />--->
        
        <cfset belongsTo(name="activityType", modelName="sysActivityType", foreignKey="activityTypeId") />
        <cfset belongsTo(name="createdBy", modelName="person", foreignKey="createdBy")>
        <cfset belongsTo(name="grouping", modelName="sysGrouping", foreignKey="groupingId") />
        <cfset belongsTo(name="status", modelName="sysStatus", foreignKey="statusId")>
        <cfset belongsTo(name="updatedBy", modelName="person", foreignKey="updatedBy")>
    </cffunction>
</cfcomponent>
