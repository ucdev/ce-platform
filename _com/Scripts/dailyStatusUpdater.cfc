<cfcomponent displayname="Daily Attendee Status Changes" output="no">
	<cffunction name="Run" output="no" access="remote" returntype="string" returnformat="plain">
		<cfquery name="qUpdater" datasource="#Application.Settings.DSN#">
			UPDATE 
				ce_Attendee
			SET              
				StatusID = 1, 
				CheckOut = GETDATE(),
				CompleteDate = (SELECT EndDate FROM ce_Activity WHERE ActivityID=ce_Attendee.ActivityID),
				Updated=getDate()
			WHERE     
				(AttendeeID IN
					(SELECT
						ce_Attendee.AttendeeID
					FROM          
						ce_Attendee AS Att 
					INNER JOIN
						ce_Activity AS A ON Att.ActivityID = A.ActivityID
					WHERE      
						(A.StatusID IN (1, 2, 3)) AND 
						(A.ActivityTypeID <> 2) AND 
						(A.DeletedFlag = 'N') AND  
						(A.EndDate < GETDATE())))
				AND
				DeletedFlag='N'
				AND StatusID <> 1
		</cfquery>
	</cffunction>
</cfcomponent>