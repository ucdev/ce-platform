<cfcomponent displayname="Attendee Stat Fixer" output="no">
	<cffunction name="Run" output="no" access="remote" returntype="string" returnformat="plain">
		<cfargument name="ActivityID" type="numeric" required="no" default="0" />
		<cfargument name="mode" type="string" required="no" default="auto">
		
		<cfset var nUpdatedBy = 1 />
		<cfset var qSelector = "" />
		<cfset var qUpdater = "" />
		<cfset var returnData = createobject("component","_com.returnData.buildStruct").init() />
		
		<cfcontent type="text/javascript" />
		
		<cfset returnData.setStatus(false) />
		<cfset returnData.setStatusMsg('failed for unknown reason') />
		
		<cfswitch expression="#arguments.mode#">
			<cfcase value="auto">
				<cfset nUpdatedBy = 1 />
			</cfcase>
			<cfcase value="manual">
				<cfif structKeyExists(session,'personid') AND session.personid GT 0>
					<cfset nUpdatedBy = session.personid />
				</cfif>
			</cfcase>
			<cfdefaultcase>
				<cfset nUpdatedBy = 1 />
			</cfdefaultcase>
		</cfswitch>
		
		<cfquery name="qSelector" datasource="#Application.Settings.DSN#">
			SELECT
				A.ActivityID,
				A.StartDate,
				A.parentActivityId,
				EndDate = DATEADD(n, 1439, A.EndDate),
				StatHrs =
				isNull((CASE isNull(A.SessionType,'S')
					WHEN 'M' THEN 
						isNull((SELECT SUM(AC.Amount) AS TotalHours
								FROM ceschema.ce_Activity_Credit AS AC 
								INNER JOIN ceschema.ce_Activity AS A4 ON AC.ActivityID = A4.ActivityID
								WHERE (AC.CreditID = 1) AND (A4.ParentActivityID = A.ActivityID) AND AC.DeletedFlag='N' AND (A4.StatusID IN (1,2,3))),0)
					WHEN 'S' THEN 
						isNull((SELECT SUM(AC.Amount) AS TotalHours
								FROM ceschema.ce_Activity_Credit AS AC 
								INNER JOIN ceschema.ce_Activity AS A4 ON AC.ActivityID = A4.ActivityID
								WHERE (AC.CreditID = 1) AND (A4.ActivityID = A.ActivityID) AND AC.DeletedFlag='N' AND (A4.StatusID IN (1,2,3))),0)
				END),0),
				StatAttendees = 
					isNull((CASE isNull(A.SessionType,'S')
						WHEN 'M' THEN 
							CASE
								WHEN isNull(A.ParentActivityID,0) = 0 THEN
									(SELECT Count(Att.AttendeeID)
									 FROM ceschema.ce_Attendee AS Att 
									 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
									 WHERE 
										(Att.StatusID = 1) AND (A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
								ELSE
									(SELECT Count(Att.AttendeeID)
									 FROM ceschema.ce_Attendee AS Att 
									 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
									 WHERE 
										(Att.StatusID = 1) AND (A2.ActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
							END
						WHEN 'S' THEN
							(SELECT Count(Att.AttendeeID)
							 FROM ceschema.ce_Attendee AS Att 
							 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
							 WHERE 
								(Att.StatusID = 1) AND (Att.ActivityID = a.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
					END),0),
					StatMD = 
					isNull((CASE isNull(A.SessionType,'S')
						WHEN 'M' THEN 
							CASE
								WHEN isNull(A.ParentActivityID,0) = 0 THEN
									(SELECT Count(Att.AttendeeID)
									 FROM ceschema.ce_Attendee AS Att 
									 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
									 WHERE 
										(Att.StatusID = 1) AND (A2.ParentActivityID = A.ActivityID) AND (Att.MDflag = 'Y') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
								ELSE
									(SELECT Count(Att.AttendeeID)
									 FROM ceschema.ce_Attendee AS Att 
									 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
									 WHERE 
										(Att.StatusID = 1) AND (A2.ActivityID = A.ActivityID) AND (Att.MDflag = 'Y') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
							END
						WHEN 'S' THEN
							(SELECT Count(Att.AttendeeID)
							 FROM ceschema.ce_Attendee AS Att 
							 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
							 WHERE 
								(Att.StatusID = 1) AND (Att.ActivityID = a.ActivityID) AND (Att.MDflag = 'Y') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
					END),0),
					StatNonMD = 
					isNull((CASE isNull(A.SessionType,'S')
						WHEN 'M' THEN 
							CASE
								WHEN isNull(A.ParentActivityID,0) = 0 THEN
									(SELECT Count(Att.AttendeeID)
									 FROM ceschema.ce_Attendee AS Att 
									 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
									 WHERE 
										(Att.StatusID = 1) AND 
										(A2.ParentActivityID = A.ActivityID) AND 
										(Att.MDflag = 'N') AND 
										(A2.StatusID IN (1,2,3)) AND 
										(Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
								ELSE
									(SELECT Count(Att.AttendeeID)
									 FROM ceschema.ce_Attendee AS Att 
									 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
									 WHERE 
										(Att.StatusID = 1) AND 
										(A2.ActivityID = A.ActivityID) AND 
										(Att.MDflag = 'N') AND 
										(A2.StatusID IN (1,2,3)) AND 
										(Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
							END
						WHEN 'S' THEN
							(SELECT Count(Att.AttendeeID)
							 FROM ceschema.ce_Attendee AS Att 
							 INNER JOIN ceschema.ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
							 WHERE 
								(Att.StatusID = 1) AND (Att.ActivityID = a.ActivityID) AND (Att.MDflag = 'N') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
					END),0)+
					isNull((CASE isNull(A.SessionType,'S')
						WHEN 'M' THEN 
							CASE
								WHEN isNull(A.ParentActivityID,0) = 0 THEN
									(
									SELECT isNull(SUM(A2.statAddlAttendees),0)
									 FROM ceschema.ce_Activity AS A2
									 WHERE 
										(A2.ParentActivityID = A.ActivityID) AND
										(A2.StatusID IN (1,2,3))
									)
								ELSE
									(SELECT isNull(A2.statAddlAttendees,0)
									 FROM
									 ceschema.ce_Activity AS A2
									 WHERE  
										(A2.ActivityID = A.ActivityID) AND 
										(A2.StatusID IN (1,2,3)))
							END
						WHEN 'S' THEN
							A.statAddlAttendees
					END),0)
					,
				StatSupporters = 
					isNull((CASE isNull(A.SessionType,'S')
						WHEN 'M' THEN 
							(SELECT     COUNT(FS.Amount)
							FROM         ceschema.ce_Activity_FinSupport AS FS INNER JOIN
												  ceschema.ce_Activity AS A5 ON FS.ActivityID = A5.ActivityID
							WHERE    
									(A5.ParentActivityID = A.ActivityID) AND 
									(A5.DeletedFlag='N') AND 
									(FS.SupportTypeID = 1) AND 
									(FS.DeletedFlag = 'N') AND
									(A5.StatusID IN (1,2,3))
								OR
									(A5.ActivityID = A.ActivityID) AND 
									(FS.DeletedFlag = 'N') AND 
									(A5.DeletedFlag = 'N') AND
									(FS.SupportTypeID = 1) AND 
									(A5.StatusID IN (1,2,3))
								OR
									(A5.ParentActivityID = A.ActivityID) AND 
									(A5.DeletedFlag='N') AND 
									(FS.DeletedFlag = 'N') AND 
									(FS.SupportTypeID = 1) AND 
									(A5.StatusID IN (1,2,3))
							)
						WHEN 'S' THEN
							(SELECT     COUNT(Amount) AS Expr1
							FROM         ceschema.ce_Activity_FinSupport
							WHERE     (SupportTypeID = 1) AND (DeletedFlag = 'N') AND (ActivityID=a.ActivityID))
					END),0)
					,
					(CASE isNull((CASE isNull(A.SessionType,'S')
						WHEN 'M' THEN 
							(SELECT     COUNT(FS.Amount)
							FROM         ceschema.ce_Activity_FinSupport AS FS INNER JOIN
												  ceschema.ce_Activity AS A5 ON FS.ActivityID = A5.ActivityID
							WHERE 
									(A5.ParentActivityID = A.ActivityID) AND 
									(A5.DeletedFlag='N') AND 
									(FS.SupportTypeID = 1) AND 
									(FS.DeletedFlag = 'N') AND
									(A5.StatusID IN (1,2,3))
								OR
									(A5.ActivityID = A.ActivityID) AND 
									(FS.DeletedFlag = 'N') AND 
									(A5.DeletedFlag = 'N') AND
									(FS.SupportTypeID = 1) AND 
									(A5.StatusID IN (1,2,3))
								OR
									(A5.ParentActivityID = A.ActivityID) AND 
									(A5.DeletedFlag='N') AND 
									(FS.DeletedFlag = 'N') AND 
									(FS.SupportTypeID = 1) AND 
									(A5.StatusID IN (1,2,3))
							)
						WHEN 'S' THEN
							(SELECT     COUNT(Amount) AS Expr1
							FROM         ceschema.ce_Activity_FinSupport
							WHERE     (SupportTypeID = 1) AND (DeletedFlag = 'N') AND (ActivityID=a.ActivityID))
					END),0)
						WHEN '0' THEN 'No'
						ELSE 'Yes'
					END) AS SupportReceived,
					StatSuppAmount = 
					isNull((CASE isNull(A.SessionType,'S')
						WHEN 'M' THEN 
							(SELECT     SUM(FS.Amount)
							FROM         ceschema.ce_Activity_FinSupport AS FS INNER JOIN
										 ceschema.ce_Activity AS A5 ON FS.ActivityID = A5.ActivityID
							WHERE     
								(A5.ParentActivityID = A.ActivityID) AND 
								(A5.DeletedFlag='N') AND 
								(FS.SupportTypeID = 1) AND 
								(FS.DeletedFlag = 'N') AND
								(A5.StatusID IN (1,2,3))
							OR
								(A5.ActivityID = A.ActivityID) AND 
								(FS.DeletedFlag = 'N') AND 
								(A5.DeletedFlag = 'N') AND
								(FS.SupportTypeID = 1) AND 
								(A5.StatusID IN (1,2,3))
							OR
								(A5.ParentActivityID = A.ActivityID) AND 
								(A5.DeletedFlag='N') AND 
								(FS.DeletedFlag = 'N') AND 
								(FS.SupportTypeID = 1) AND 
								(A5.StatusID IN (1,2,3))
							)
						WHEN 'S' THEN
							(SELECT     SUM(A6.Amount) AS Expr1
							FROM         ceschema.ce_Activity_FinSupport As A6
							WHERE     (A6.SupportTypeID = 1) AND (A6.DeletedFlag = 'N') AND (A6.ActivityID=A.ActivityID))
					END),0)
			FROM 
				ceschema.ce_Activity A
			WHERE
				0 = 0
				AND (A.DeletedFlag = 'N')
			<cfif Arguments.ActivityID GT 0>
				AND (A.ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />)
			<cfelse>
				AND (A.startDate > '1/1/2007')
				AND (A.refreshFlag=1)
				AND (A.statusid IN (1,2,3))
			</cfif>
		</cfquery>
		
		<cfloop query="qSelector">
			#qSelector.activityId#,
			<cftry>
			<cfquery name="qUpdater" datasource="#Application.Settings.DSN#">
				UPDATE ce_Activity
				SET 
					StatCMEHours=#qSelector.StatHrs#,
					StatAttendees=#qSelector.StatAttendees#,
					StatMD = #qSelector.StatMD#,
					StatNonMD = #qSelector.StatNonMD#,
					StatSupporters = #qSelector.StatSupporters#,
					StatSuppAmount =#qSelector.StatSuppAmount#,
					refreshFlag = 0,
					updated = getDate(),
					updatedBy = <cfqueryparam value="#nUpdatedBy#" cfsqltype="cf_sql_integer" />
				WHERE ActivityID=#qSelector.ActivityID#
			</cfquery>
			<cfcatch>
			<cfdump var="#qSelector.activityId#"><cfabort>
			</cfcatch>
			</cftry>
			<cfif qSelector.parentActivityId GT 0>
				<cfset run(qSelector.parentActivityId) />
			</cfif>
		</cfloop>
		
		<cfset returnData.setStatus(true) />
		<cfset returnData.setStatusMsg('Stats are up to date!') />
		
		<cflog text="Stat Fixer script ran successfully." file="ccpd_script_log">
		
		<cfreturn returnData.getJSON() />
	</cffunction>
</cfcomponent>