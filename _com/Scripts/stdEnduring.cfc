<cfcomponent displayname="Non-RSS Multisession to Single Session" output="no">
	<cffunction name="Run" output="yes" access="remote" returntype="string" returnformat="plain">
		
		
		<cfquery name="qParents" datasource="#Application.Settings.DSN#">
			SELECT     TOP (200) ActivityID, ParentActivityID, ActivityTypeID, GroupingID, Title, Description, ReleaseDate, StartDate, EndDate, LocationID, Location, Address1, Address2, City, 
			State, PostalCode, SessionType, StatusID, StatMaxRegistrants, StatAttendees, StatAddlAttendees, StatCMEHours, StatMD, StatNonMD, StatSupporters, 
			StatSuppAmount, Sponsorship, Sponsor, ExternalID, Created, CreatedBy, Updated, UpdatedBy, Deleted, DeletedFlag
			FROM         ce_Activity AS A
			WHERE     (ExternalID = 'CDC-399') AND (DeletedFlag = 'N') AND (GroupingID = 3) AND (StartDate < '2/15/2010') AND
			((SELECT     COUNT(ActivityID) AS Expr1
			FROM         ce_Activity AS A2
			WHERE     (A.ActivityID = Description) AND (ExternalID = 'CDC-399') AND (DeletedFlag = 'N') AND (GroupingID = 6) AND (StartDate < '2/15/2010')) = 0)
		</cfquery>
		
		<cfloop query="qParents">
			<!--- GET Enduring Attendees List --->
			<cfquery name="qEnduring" datasource="#Application.Settings.DSN#">
				SELECT     AttendeeID, ActivityID, PersonID, StatusID, CheckedInFlag, CheckIn, CheckedOutFlag, CheckOut, MDflag, TermsFlag, PaymentFlag, PayAmount, PayOrderNo, 
				  PaymentDate, RegisterDate, CompleteDate, TermDate, Created, CreatedBy, Updated, UpdatedBy, Deleted, DeletedFlag
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N'
			</cfquery>
			
			<cfquery name="qEnduringCount" datasource="#Application.Settings.DSN#">
				SELECT    Count(AttendeeID) As AttCount
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N'
			</cfquery>
			
			<cfquery name="qEnduringCountMD" datasource="#Application.Settings.DSN#">
				SELECT    Count(AttendeeID) As AttCount
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N' AND MDFlag='Y'
			</cfquery>
			
			<cfquery name="qEnduringCountNonMD" datasource="#Application.Settings.DSN#">
				SELECT    Count(AttendeeID) As AttCount
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N' AND MDFlag='N'
			</cfquery>
			
			<cfset Activity = CreateObject("component","_com.Activity.Activity").init(ActivityID=qParents.ActivityID)>
			<cfset Activity = Application.Com.ActivityDAO.Read(Activity)>
			<cfset Activity.setActivityID(0)>
			<cfset Activity.setDescription('#qParents.ActivityID#')>
			<cfset Activity.setActivityTypeID(2)>
			<cfset Activity.setGroupingID(6)>
			<cfset Activity.setStatAttendees(qEnduringCount.AttCount)>
			<cfset Activity.setStatMD(qEnduringCountMD.AttCount)>
			<cfset Activity.setStatNonMD(qEnduringCountNonMD.AttCount)>
			<cfset Activity.setExternalID('CDC-399')>
			
			<cfset NewActivityID = Application.Com.ActivityDAO.Create(Activity)>
			<cfdump var="#NewActivityID#">
			=================================================<br>
			CREATED ENDURING: #UCase(qParents.Title)#<br>
			=================================================<br><cfflush>
			
			<!--- MOVE ATTENDEES --->
			<cfquery name="qMoveAtt" datasource="#Application.SEttings.DSN#">
				UPDATE ce_Attendee
					SET ActivityID=#NewActivityID#
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N'
			</cfquery>
			
			<cfquery name="qLive" datasource="#Application.Settings.DSN#">
				SELECT     AttendeeID, ActivityID, PersonID, StatusID, CheckedInFlag, CheckIn, CheckedOutFlag, CheckOut, MDflag, TermsFlag, PaymentFlag, PayAmount, PayOrderNo, 
				  PaymentDate, RegisterDate, CompleteDate, TermDate, Created, CreatedBy, Updated, UpdatedBy, Deleted, DeletedFlag
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N'
			</cfquery>
			
			<cfquery name="qLiveCount" datasource="#Application.Settings.DSN#">
				SELECT    Count(AttendeeID) As AttCount
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N'
			</cfquery>
			
			<cfquery name="qLiveCountMD" datasource="#Application.Settings.DSN#">
				SELECT    Count(AttendeeID) As AttCount
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N' AND MDFlag='Y'
			</cfquery>
			
			<cfquery name="qLiveCountNonMD" datasource="#Application.Settings.DSN#">
				SELECT    Count(AttendeeID) As AttCount
				FROM         ce_Attendee
				WHERE     (ActivityID = #qParents.ActivityID#) AND (CheckIn > DATEADD(d, 10, '#DateFormat(qParents.EndDate,'mm/dd/yyyy')#')) AND DeletedFlag='N' AND MDFlag='N'
			</cfquery>
			
			<!--- UPDATE Live Internet Stats = Subtract the count from the stats... --->
			<cfquery name="qUpdateStat" datasource="#Application.Settings.DSN#">
				UPDATE ce_Activity
				SET 
					StatAttendees=#qLiveCount.AttCount#,
					StatMD=#qLiveCountMD.AttCount#,
					StatNonMD=#qLiveCountNonMD.AttCount#
				WHERE 
					ActivityID=#qParents.ActivityID#
			</cfquery>
		</cfloop>
	</cffunction>
	
	<cffunction name="MoveEvals" access="remote" output="yes">
		<cfquery name="qActivities" datasource="#Application.SEttings.DSN#">
			SELECT     TOP (200) ActivityID, ParentActivityID, ActivityTypeID, GroupingID, Title, Description, ReleaseDate, StartDate, EndDate, LocationID, Location, Address1, Address2, City, 
				  State, PostalCode, SessionType, StatusID, StatMaxRegistrants, StatAttendees, StatAddlAttendees, StatCMEHours, StatMD, StatNonMD, StatSupporters, 
				  StatSuppAmount, Sponsorship, Sponsor, ExternalID, Created, CreatedBy, Updated, UpdatedBy, Deleted, DeletedFlag
			FROM         ce_Activity AS A
			WHERE     (ExternalID = 'CDC-399') AND (DeletedFlag = 'N') AND (GroupingID = 6) AND (StartDate < '2/15/2010') AND (ActivityID > 7676)
		</cfquery>
	</cffunction>
</cfcomponent>