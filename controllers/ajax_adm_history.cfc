<cfcomponent displayname="history ajax">
	<cffunction name="list" access="remote" output="no" returnformat="plain" returntype="string">
		<cfargument name="personFrom" type="string" required="no" default="0" />
		<cfargument name="personTo" type="string" required="no" default="0" />
		<cfargument name="activityTo" type="string" required="no" default="0" />
		<cfargument name="NotPersonFrom" type="string" required="no" default="0" />
		<cfargument name="HistoryType" type="string" required="no" default="0" />
		<cfargument name="maxrows" type="string" required="no" default="0" />
		<cfargument name="startrow" type="string" required="no" default="0" />
		<cfargument name="starttime" type="string" required="no" default="0" />
		
		<cfset var returnVar = CreateObject("component","_com.returnData.buildStruct").init()>
		<cfset var history = "">
		<cfset var startTimeEpoch = arguments.startTime />
		<cfset currStartTime = DateAdd("s",startTimeEpoch,DateConvert("utc2Local", "January 1 1970 00:00"))>
		
		<cfset history =APPLICATION.UDF.QUERYTOSTRUCT(
						APPLICATION.HISTORY.LIST(
							frompersonid=arguments.personFrom,
							topersonid=arguments.personTo,
							toactivityid=arguments.activityTo,
							notfrompersonid=arguments.NotPersonFrom,
							startrow=arguments.startrow,
							maxrows=arguments.maxrows,
							startFromTime=currStartTime
						))>
		<cfcontent type="text/javascript">
		<cfset returnVar.setData(history)>
		<cfset returnVar.setStatus(true)>
		<cfset returnVar.setStatusMsg("list prepared successfully.")>
		
		<cfreturn returnVar.getJSON()>
	</cffunction>
</cfcomponent>