<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("Activity")>
        <cfset property(name="id", column="ActivityID") />
        
        <cfset hasOne(name="activityType",modelName="sysActivityType") />
        <cfset hasOne(name="grouping",modelName="sysGrouping") />
        <cfset hasOne(name="status",modelName="sysStatus")>
    </cffunction>
</cfcomponent>
