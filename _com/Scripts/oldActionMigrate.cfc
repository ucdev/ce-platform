<cfcomponent displayname="Migrate old actions to new history" output="yes">
	<cfset PathToFile = ExpandPath('/_com/Scripts/ActionMigration.csv')>
	<cffunction name="Run" output="yes" access="remote" returntype="string" returnformat="plain">
		
		<cfset var Records = 0>
		<cfset var Dividend = 0>
		<cfset var CurrentPercent = 0>
		
		<!---<cffile action="read" file="#PathToFile#" variable="csvcontent" />
		
<!---	<cfset aRecords = QuotedListToArray(csvcontent)>
		<cfset Records = ArrayLen(aRecords)>
		<cfset Dividend = Round((Records / 100))>
		<cfset CurrentPercent = 0>--->--->
		
		<cfquery name="qActions" datasource="#Application.Settings.DSN#">
		/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	ActionID,	
	ShortName = CASE 
		WHEN RTrim(LTrim(ShortName)) = 'Changed activity status.' THEN 
			CASE 
				WHEN LongName LIKE '%Active%' THEN 'Set to active.'
				WHEN LongName LIKE '%Ended%' THEN 'Set to ended.'
				WHEN LongName LIKE '%Cancelled%' THEN 'Set to cancelled.'
				WHEN LongName LIKE '%Pending%' THEN 'Set to pending.'
			END
		WHEN RTrim(LTrim(ShortName)) = 'Added note.' THEN 
			CASE 
				WHEN PersonID IS NOT NULL THEN 'Added person note.'
				WHEN ActivityID IS NOT NULL THEN 'Added activity note.'
			ELSE
				'Added unknown note.'
			END
		WHEN RTrim(LTrim(ShortName)) = 'Deleted note.' THEN 
			CASE 
				WHEN PersonID IS NOT NULL THEN 'Deleted person note.'
				WHEN ActivityID IS NOT NULL THEN 'Deleted activity note.'
			ELSE
				'Deleted unknown note.'
			END
		WHEN ShortName LIKE 'Changed 1 status.' THEN 'Changed registrant statuses'
		WHEN ShortName LIKE '%registrants'' statuses.' THEN 'Changed registrant statuses'
		ELSE
			ShortName
		END,
		
	
	ToPersonID = PersonID, ToActivityID = ActivityID, FromPersonID = CreatedBy,ToContent = LongName,PostDate = Created
FROM ce_Action
WHERE ShortName IS NOT NULL AND ShortName <> '' AND MovedFlag='N'
ORDER BY ShortName
		</cfquery>
		
		<cfloop query="qActions">
			<!---<cfset row = replace(row,'"','','ALL')>
			<cfset qActions.ActionID = ListGetAtIncNulls(row,1)>
			<cfset qActions.ShortName = ListGetAtIncNulls(row,4)>
			<cfset qActions.ToPersonID = ListGetAtIncNulls(row,7)>
			<cfset qActions.ToActivityID = ListGetAtIncNulls(row,5)>
			<cfset qActions.FromPersonID = ListGetAtIncNulls(row,3)>
			<cfset qActions.ToContent = ListGetAtIncNulls(row,6)>
			<cfset qActions.PostDate = ListGetAtIncNulls(row,2)>--->
			
			<cfquery name="qNewStyle" dbtype="query" timeout="#CreateTimeSpan(1,0,0,0)#">
				SELECT HistoryStyleID,Title,OldTitles
				FROM Application.List.HistoryStyles
				WHERE OldTitles LIKE <cfqueryparam value="%#qActions.ShortName#%" cfsqltype="cf_sql_varchar" />
			</cfquery>
			
			<cfif qNewStyle.RecordCount GT 0>
				<cfset Application.History.Add(
					HistoryStyleID=qNewStyle.HistoryStyleID,
					FromPersonID=qActions.FromPersonID,
					ToActivityID=qActions.ToActivityID,
					ToPersonID=qActions.ToPersonID,
					ToContent=qActions.ToContent,
					OldActionID=qActions.ActionID,
					PostDate=qActions.PostDate
				)>
				
				<cfquery name="qUpdate" datasource="#Application.Settings.DSN#">
					UPDATE ce_Action
					SET MovedFlag='Y'
					WHERE ActionID=<cfqueryparam value="#qActions.ActionID#" cfsqltype="cf_sql_integer" />
				</cfquery>
				|<cfflush>
			<cfelse>
				X #qActions.ShortName#
			</cfif>
		</cfloop>
	</cffunction>
	
	<cffunction name="dumpToFile" access="remote" output="yes">
		<cfquery name="Session.qActions" datasource="#Application.Settings.DSN#">
			/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	ActionID,	
	ShortName = CASE 
		WHEN RTrim(LTrim(ShortName)) = 'Changed activity status.' THEN 
			CASE 
				WHEN LongName LIKE '%Active%' THEN 'Set to active.'
				WHEN LongName LIKE '%Ended%' THEN 'Set to ended.'
				WHEN LongName LIKE '%Cancelled%' THEN 'Set to cancelled.'
				WHEN LongName LIKE '%Pending%' THEN 'Set to pending.'
			END
		WHEN RTrim(LTrim(ShortName)) = 'Added note.' THEN 
			CASE 
				WHEN PersonID IS NOT NULL THEN 'Added person note.'
				WHEN ActivityID IS NOT NULL THEN 'Added activity note.'
			ELSE
				'Added unknown note.'
			END
		WHEN ShortName LIKE 'Changed 1 status.' THEN 'Changed registrant statuses'
		WHEN ShortName LIKE '%registrants'' statuses.' THEN 'Changed registrant statuses'
		ELSE
			ShortName
		END,
		
	
	ToPersonID = PersonID, ToActivityID = ActivityID, FromPersonID = CreatedBy,ToContent = LongName,Created
FROM ce_Action
WHERE ShortName IS NOT NULL AND ShortName <> '' AND MovedFlag='N'
ORDER BY ShortName
		</cfquery>
		
		<cfset csvString = Application.UDF.QueryToCSV2(Session.qActions)>
		
		<cffile action="write" file="#PathToFile#" nameconflict="overwrite" output="#csvString#">
	</cffunction>
	<cfinclude template="#Application.Settings.ComPath#/_UDF/CSVtoQuery.cfm">
	<cfinclude template="#Application.Settings.ComPath#/_UDF/QuotedListToArray.cfm">
	<cfinclude template="#Application.Settings.ComPath#/_UDF/QueryToCSV.cfm">
	<cfinclude template="#Application.Settings.ComPath#/_UDF/ListGetAtIncNulls.cfm">
</cfcomponent>