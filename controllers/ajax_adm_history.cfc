<cfcomponent displayname="history ajax">
<cffunction name="init">
		<cfset filters(through="ajaxLoginRequired")>
		<cfset filters(through="ajaxAdminRequired")>
	</cffunction>
	<cffunction name="list"  output="no" returnformat="plain">
		<cfparam name="params.personFrom" type="string"  default="0" />
		<cfparam name="params.personTo" type="string"  default="0" />
		<cfparam name="params.activityTo" type="string"  default="0" />
		<cfparam name="params.NotPersonFrom" type="string"  default="0" />
		<cfparam name="params.HistoryType" type="string"  default="0" />
		<cfparam name="params.maxrows" type="string"  default="0" />
		<cfparam name="params.startrow" type="string"  default="0" />
		<cfparam name="params.starttime" type="string"  default="0" />
		
		<cfset var returnVar = CreateObject("component","_com.returnData.buildStruct").init()>
		<cfset var history = "">
		<cfset var startTimeEpoch = params.startTime />
		<cfset currStartTime = DateAdd("s",startTimeEpoch,DateConvert("utc2Local", "January 1 1970 00:00"))>
		
		<cfset history =APPLICATION.UDF.QUERYTOSTRUCT(
						APPLICATION.HISTORY.LIST(
							frompersonid=params.personFrom,
							topersonid=params.personTo,
							toactivityid=params.activityTo,
							notfrompersonid=params.NotPersonFrom,
							startrow=params.startrow,
							maxrows=params.maxrows,
							startFromTime=currStartTime
						))>
		<cfcontent type="text/javascript">
		<cfset returnVar.setData(history)>
		<cfset returnVar.setStatus(true)>
		<cfset returnVar.setStatusMsg("list prepared successfully.")>
		
		<cfreturn returnVar.getJSON()>
	</cffunction>
</cfcomponent>