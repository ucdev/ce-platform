<cfcomponent displayname="history ajax">
	<cffunction name="list"  output="no" returnformat="plain" returntype="string">
		<cfparam name="params.personFrom" type="string" required="no" default="0" />
		<cfparam name="params.personTo" type="string" required="no" default="0" />
		<cfparam name="params.activityTo" type="string" required="no" default="0" />
		<cfparam name="params.NotPersonFrom" type="string" required="no" default="0" />
		<cfparam name="params.HistoryType" type="string" required="no" default="0" />
		<cfparam name="params.maxrows" type="string" required="no" default="0" />
		<cfparam name="params.startrow" type="string" required="no" default="0" />
		<cfparam name="params.starttime" type="string" required="no" default="0" />
		
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