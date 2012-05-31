<cfcomponent displayname="Fixes">
	<cfset OldDSN = "AITL-SQL1C">
	<cfset NewDSN = "AITL-SQL1C">
    <cfinclude template="_UDF/sluggify.cfm" />
	<cffunction name="fixSlugs" access="remote" output="yes" returntype="string">
		<cfquery name="qTitles" datasource="#NewDSN#">
			SELECT     A.ActivityID, A.Title, PG.LinkName
FROM         ce_Activity AS A INNER JOIN
                      ce_Activity_PubGeneral AS PG ON A.ActivityID = PG.ActivityID
WHERE     (PG.LinkName = '') AND (A.DeletedFlag = 'N') OR
                      (PG.LinkName IS NULL) AND (A.DeletedFlag = 'N')
			ORDER BY A.StartDate
		</cfquery>
		
		<cfloop query="qTitles">
			<cfset SlugOutput = LCase(left(sluggify(qTitles.Title,'-'),250))>
			<cfquery name="qCount" datasource="#NewDSN#">
				SELECT Count(ActivityID) As TheCount FROM ce_Activity_PubGeneral
				WHERE LinkName = <cfqueryparam value="#SlugOutput#" cfsqltype="cf_sql_varchar" />
				OR LinkName LIKE <cfqueryparam value="#SlugOutput#_%" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfif qCount.TheCount GT 0>
				<cfset SlugOutput = "#SlugOutput#_#qCount.TheCount+1#">
			</cfif>
			
			<cfquery name="qUpdate" datasource="#NewDSN#">
				UPDATE ce_Activity_PubGeneral
				SET LinkName=<cfqueryparam value="#SlugOutput#" cfsqltype="cf_sql_varchar" />
				WHERE ActivityID=#qTitles.ActivityID#
			</cfquery>
			[#qTitles.ActivityID#] <span style="color:##555;font-weight:bold;">#qTitles.Title#</span> -to- <span style="color:##009900;font-weight:bold;">#SlugOutput#</span><br>
		</cfloop>
	</cffunction>
	
    <cffunction name="fixActionLinks" hint="Updates links on the actions for the directory change" access="remote" output="true" returntype="string">
    	<!--- GET ALL ACTION DATA --->
        <cfquery name="qGetActions" datasource="#Application.Settings.DSN#">
        	SELECT ActionID, LongName
            FROM ce_Action
        </cfquery>
        
        <cfloop query="qGetActions">
        	<!--- UPDATE ALL LONGNAMES FOR ACTIONS --->
        	<cfif Find('/admin/index.cfm/event/',qGetActions.LongName)>
        		<cfset UpdatedLongName = Replace(qGetActions.LongName,'/admin/index.cfm/event/','%RootPath%%URLStruct%','ALL')>
        	<cfelseif Find('/index.cfm/event/',qGetActions.LongName)>
        		<cfset UpdatedLongName = Replace(qGetActions.LongName,'/index.cfm/event/','%RootPath%%URLStruct%','ALL')>
            <cfelse>
            	<cfset UpdatedLongName = qGetActions.LongName>
            </cfif>
            
            <!--- COMMIT UPDATED LONGNAMES FOR ACTIONS --->
            <cfquery name="qUpdateAction" datasource="#Application.Settings.DSN#">
            	UPDATE ce_Action
                SET LongName = <cfqueryparam value="#UpdatedLongName#" cfsqltype="cf_sql_varchar" />
                WHERE ActionID = <cfqueryparam value="#qGetActions.ActionID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        </cfloop>
    </cffunction>
    
	<cffunction name="FixSTDLive" access="remote" output="yes">
		<cfquery name="qSTD" cachedwithin="#CreateTime(1,0,0)#" datasource="#OldDSN#">
			SELECT     CI.CourseID, C.Name, C.CourseTypeID
			FROM         dbo.cm_CourseInfo AS CI INNER JOIN
					  dbo.tt_Course AS C ON CI.CourseID = C.CourseID
			WHERE     (CI.IsGrandRounds = 0) AND C.Name <> ''
		</cfquery>
		
		<cfloop query="qSTD">
			<!--- GET PARENT ACTIVITY --->
			<cfquery name="qParentActivity" datasource="#NewDSN#">
				SELECT     A.ActivityID, A.ActivityTypeID, A.Title, AT.Name AS ActivityType, A.GroupingID, G.Name AS Grouping
				FROM         ce_Activity AS A INNER JOIN
				ce_Sys_ActivityType AS AT ON A.ActivityTypeID = AT.ActivityTypeID INNER JOIN
				ce_Sys_Grouping AS G ON A.GroupingID = G.GroupingID
				WHERE A.Title = '#qSTD.Name#' AND A.ParentActivityID IS NULL
			</cfquery>
			
			<cfquery name="qEvents" datasource="#OldDSN#">
				SELECT     ET.EventType, CS.CourseSectionId, CS.CourseId
				FROM         dbo.cm_CourseSectionInfo AS CSI INNER JOIN
				  dbo.tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
				  dbo.cm_EventType AS ET ON CSI.EventTypeId = ET.EventTypeID
				WHERE CS.CourseID=#qSTD.CourseID# AND CSI.EventTypeID = 31
			</cfquery>
			
			<cfif qEvents.RecordCount GT 0>
				[#qParentActivity.ActivityID#] <strong>#qSTD.Name#</strong> (#qParentActivity.ActivityType# > #qParentActivity.Grouping#)<br>
				<cfflush>
				<cfloop query="qEvents">
				
					<cfquery name="qChildActivity" datasource="#NewDSN#">
						SELECT     A.ActivityID, A.ActivityTypeID, A.ParentActivityID, A.Title, AT.Name AS ActivityType, A.GroupingID, G.Name AS Grouping
						FROM         ce_Activity AS A INNER JOIN
						ce_Sys_ActivityType AS AT ON A.ActivityTypeID = AT.ActivityTypeID INNER JOIN
						ce_Sys_Grouping AS G ON A.GroupingID = G.GroupingID
						WHERE A.ExternalID = #qEvents.CourseSectionID#
					</cfquery>
					<cfif qChildActivity.GroupingID NEQ 1>
						<!--- Live Internet --->
						<cfif qSTD.CourseTypeID EQ 9>
							<cfquery name="qFix" datasource="#NewDSN#">
								UPDATE ce_Activity
								SET GroupingID=3
								WHERE ActivityID=#qChildActivity.ParentActivityID#
							</cfquery>
							<cfquery name="qFix" datasource="#NewDSN#">
								UPDATE ce_Activity
								SET GroupingID=3
								WHERE ActivityID=#qChildActivity.ActivityID#
							</cfquery>
							[Live Internet]
						<!--- Live Course --->
						<cfelse>
							[Live Course]
							<cfquery name="qFix" datasource="#NewDSN#">
								UPDATE ce_Activity
								SET GroupingID=1
								WHERE ActivityID=#qChildActivity.ActivityID#
							</cfquery>
						</cfif>
					
					- [#qChildActivity.ActivityID#] #qSTD.Name#(#qEvents.CourseSectionID#) (#qChildActivity.ActivityType# > #qChildActivity.Grouping#)
						<!---
						<font color="green">Fixed!</font>--->
						<br><br>
					</cfif>
					<cfflush>
				</cfloop>
			</cfif>
		</cfloop>
	</cffunction>
	
	<cffunction name="FixLiveEvents" access="remote" output="yes">
		<cfquery name="qNONgrandRounds" cachedwithin="#CreateTime(1,0,0)#" datasource="#OldDSN#">
			SELECT     CI.CourseID, C.Name
			FROM         dbo.cm_CourseInfo AS CI INNER JOIN
					  dbo.tt_Course AS C ON CI.CourseID = C.CourseID
			WHERE     (CI.IsGrandRounds = 0) AND C.CourseTypeID <> 9 AND C.Name <> ''
		</cfquery>
		
		<cfloop query="qNONgrandRounds">
			<!--- GET PARENT ACTIVITY --->
			<cfquery name="qParentActivity" datasource="#NewDSN#">
				SELECT     A.ActivityID, A.ActivityTypeID, A.Title, AT.Name AS ActivityType, A.GroupingID, G.Name AS Grouping
				FROM         ce_Activity AS A INNER JOIN
				ce_Sys_ActivityType AS AT ON A.ActivityTypeID = AT.ActivityTypeID INNER JOIN
				ce_Sys_Grouping AS G ON A.GroupingID = G.GroupingID
				WHERE A.Title = '#qNONgrandRounds.Name#' AND A.ParentActivityID IS NULL
			</cfquery>
			
			<cfquery name="qLiveEvents" datasource="#OldDSN#">
				SELECT     ET.EventType, CS.CourseSectionId, CS.CourseId
				FROM         dbo.cm_CourseSectionInfo AS CSI INNER JOIN
				  dbo.tt_CourseSection AS CS ON CSI.CourseSectionID = CS.CourseSectionId INNER JOIN
				  dbo.cm_EventType AS ET ON CSI.EventTypeId = ET.EventTypeID
				WHERE CS.CourseID=#qNONgrandRounds.CourseID# AND CSI.EventTypeID <> 31
			</cfquery>
			
			<cfif qLiveEvents.RecordCount GT 0>
				[#qParentActivity.ActivityID#] <strong>#qNONgrandRounds.Name#</strong> (#qParentActivity.ActivityType# > #qParentActivity.Grouping#)<br>
				<cfflush>
				<cfloop query="qLiveEvents">
					<cfquery name="qChildActivity" datasource="#NewDSN#">
						SELECT     A.ActivityID, A.ActivityTypeID, A.Title, AT.Name AS ActivityType, A.GroupingID, G.Name AS Grouping
						FROM         ce_Activity AS A INNER JOIN
						ce_Sys_ActivityType AS AT ON A.ActivityTypeID = AT.ActivityTypeID INNER JOIN
						ce_Sys_Grouping AS G ON A.GroupingID = G.GroupingID
						WHERE A.ExternalID = #qLiveEvents.CourseSectionID#
					</cfquery>
					<cfif qChildActivity.GroupingID NEQ 1>
						- [#qChildActivity.ActivityID#] #qNONgrandRounds.Name#(#qLiveEvents.CourseSectionID#) (#qChildActivity.ActivityType# > #qChildActivity.Grouping#)
						<cfquery name="qFix" datasource="#NewDSN#">
							UPDATE ce_Activity
							SET GroupingID=1
							WHERE ActivityID=#qChildActivity.ActivityID#
						</cfquery>
						<font color="green">Fixed!</font>
						<br><br>
					</cfif>
					<cfflush>
				</cfloop>
			</cfif>
		</cfloop>
	</cffunction>
	
	<cffunction name="RemoveSessionTxt" access="remote" output="yes">
		<cfquery name="qList" datasource="#NewDSN#">
			SELECT 
				ActivityID, Title
			FROM ce_Activity
			WHERE Title LIKE '%// Session%'
		</cfquery>
		
		<cfloop query="qList">
			<strong>Old:</strong> #qList.Title#<br>
			-><br>
			<strong>New:</strong> #REReplace(qList.Title," // Session [0-9]*","")#<br>
			------------------------------<br>
			<cfquery name="qUpdate" datasource="#NewDSN#">
				UPDATE ce_Activity
				SET Title=<cfqueryparam value="#REReplace(qList.Title," // Session [0-9]*","")#" cfsqltype="cf_sql_varchar" />
				WHERE ActivityID=#qList.ActivityID#
			</cfquery>
		</cfloop>
	</cffunction>
	
	<cffunction name="UpdateStats" access="remote" output="yes">
		<cfargument name="Month" required="yes" type="string">
		<cfargument name="Year" required="yes" type="string">
		<cfargument name="Wipe" required="no" type="string" default="N">
		
		<cfset TheMonth = Arguments.Month>
		<cfset TheYear = Arguments.Year>
		
		<cfif Arguments.Wipe EQ "Y">
		<cfquery name="qWipe" datasource="#NewDSN#">
		UPDATE ce_Activity
		SET StatAttendees=0,StatMD=0,StatNonMD=0
		WHERE StartDate BETWEEN '#TheMonth#/1/#TheYear# 00:00:00' AND '#DateFormat(LastDayOfMonth(TheMonth,TheYear),'mm/dd/yyyy')# 23:59:59'
		</cfquery>
		</cfif>
		
		<cfquery name="qCourses" datasource="#NewDSN#">
			SELECT ActivityID,ParentActivityID FROM ce_Activity
			WHERE StartDate BETWEEN '#TheMonth#/1/#TheYear# 00:00:00' AND '#DateFormat(LastDayOfMonth(TheMonth,TheYear),'mm/dd/yyyy')# 23:59:59'
			ORDER BY ActivityID
		</cfquery>
		
		<cfloop query="qCourses">
			<cfif qCourses.ParentActivityID NEQ "">
				<cfset ParentActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=qCourses.ParentActivityID)>
				<cfset ParentActivity = Application.Com.ActivityDAO.Read(ParentActivity)>
			</cfif>
			<cfset SessionBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=qCourses.ActivityID)>
			<cfset SessionBean = Application.Com.ActivityDAO.Read(SessionBean)>
			
			<!--- Total --->
			<cfquery name="qTotal" datasource="#NewDSN#">
				SELECT Count(AttendeeID) As Total FROM ce_Attendee WHERE ActivityID=#qCourses.ActivityID# AND DeletedFlag='N'
			</cfquery>
			
			<cfif qCourses.ParentActivityID NEQ "">
				<cfset ParentActivity.setStatAttendees(ParentActivity.getStatAttendees()+qTotal.Total)>
			</cfif>
			<cfset SessionBean.setStatAttendees(SessionBean.getStatAttendees()+qTotal.Total)>
			
			<!--- MDs --->
			<cfquery name="qMDs" datasource="#NewDSN#">
				SELECT Count(AttendeeID) As MDCount FROM ce_Attendee WHERE MDFlag='Y' AND ActivityID=#qCourses.ActivityID# AND DeletedFlag='N'
			</cfquery>
			
			<cfif qCourses.ParentActivityID NEQ "">
				<cfset ParentActivity.setStatMD(ParentActivity.getStatMD()+qMDs.MDCount)>
			</cfif>
			<cfset SessionBean.setStatMD(SessionBean.getStatMD()+qMDs.MDCount)>
			
			<!--- Non MDs --->
			<cfquery name="qNonMDs" datasource="#NewDSN#">
				SELECT Count(AttendeeID) As NonMDCount FROM ce_Attendee WHERE MDFlag='N' AND ActivityID=#qCourses.ActivityID# AND DeletedFlag='N'
			</cfquery>
			
			<cfif qCourses.ParentActivityID NEQ "">
				<cfset ParentActivity.setStatNonMD(ParentActivity.getStatNonMD()+qNonMDs.NonMDCount)>
			</cfif>
			<cfset SessionBean.setStatNonMD(SessionBean.getStatNonMD()+qNonMDs.NonMDCount)>

			<cfif qCourses.ParentActivityID NEQ "">
				<cfset Application.Com.ActivityDAO.Update(ParentActivity)>
			</cfif>
			<cfset Application.Com.ActivityDAO.Update(SessionBean)>
		</cfloop>
		
		
		<cfif TheMonth LT 12>
			<cfoutput><script>window.location='#Application.Settings.ComPath#/Fixes.cfc?method=UpdateStats&Month=#TheMonth+1#&Year=#TheYear#&Wipe=#Arguments.Wipe#';</script></cfoutput>
		<cfelse>
			<cfif TheYear LTE 2009>
				<cfoutput><script>window.location='#Application.Settings.ComPath#/Fixes.cfc?method=UpdateStats&Month=1&Year=#TheYear+1#&Wipe=#Arguments.Wipe#';</script></cfoutput>
			<cfelse>
				Complete!
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="isMD" access="public" displayname="Is MD" output="false" returntype="boolean">
		<cfargument name="PersonID" type="numeric" required="yes">
	
		<cfset var PersonMD = false>
        
        <cfquery name="qPersonDegree" datasource="#Application.Settings.DSN#">
            SELECT PersonDegreeID 
            FROM ce_Person_Degree pd
            INNER JOIN ce_Sys_Degree sd ON sd.DegreeID = pd.DegreeID
            WHERE 	PersonID=<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND
                    sd.Name='MD'
        </cfquery>
        
        <cfif qPersonDegree.RecordCount GT 0>
            <cfset PersonMD = true>
        <cfelse>
            <cfquery name="qEducation" datasource="#Application.Settings.DSN#">
                SELECT DegreeID 
                FROM ce_Person_Degree
                WHERE PersonID=<cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        
            <cfloop query="qEducation">
                <cfif ListFind(Application.Settings.MDlist,qEducation.DegreeID,",")>
                    <cfset PersonMD = true>
                </cfif>
            </cfloop>
        </cfif>
        
        <cfreturn PersonMD />
	</cffunction>
    
    <cffunction name="updateStates" access="remote" output="true">
    	<cfset qStates = Application.List.States>
        
        <!--- ACTIVITIES --->
        <cfquery name="qGetActivities" datasource="#Application.Settings.DSN#">
        	SELECT ActivityID, State
            FROM ce_Activity
            WHERE State = '' OR isNumeric(State) = 1
        </cfquery>
        
        <cfloop query="qGetActivities">
        	<cfif qGetActivities.State NEQ "" AND qGetActivities.State NEQ 0>
                <cfquery name="qGetStateName" dbtype="query">
                    SELECT Code
                    FROM qStates
                    WHERE StateID = <cfqueryparam value="#qGetActivities.State#" cfsqltype="cf_sql_integer" />
                </cfquery>
            </cfif>
            
            <cfquery name="qUpdateActivities" datasource="#Application.Settings.DSN#">
            	UPDATE ce_Activity
                SET 
                	<cfif qGetActivities.State EQ "" OR qGetActivities.State EQ 0>
                    	State = <cfqueryparam null="yes" />
                    <cfelse>
                    	State = <cfqueryparam value="#qGetStateName.Code#" cfsqltype="cf_sql_varchar" />
                    </cfif>
                WHERE ActivityID = <cfqueryparam value="#qGetActivities.ActivityID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        </cfloop>
        
        <cfoutput>
        #qGetActivities.RecordCount# Activit<cfif qGetActivities.RecordCount EQ 1>y has<cfelse>ies have</cfif> been updated.
        </cfoutput>
        
        <!--- ADDRESSES --->
        <cfquery name="qGetAddresses" datasource="#Application.Settings.DSN#">
        	SELECT AddressID, State
            FROM ce_Person_Address
            WHERE State = '' OR isNumeric(State) = 1
        </cfquery>
        
        <cfloop query="qGetActivities">
        	<cfif qGetAddresses.State NEQ "" AND qGetAddresses.State NEQ 0>
                <cfquery name="qGetStateName" dbtype="query">
                    SELECT Code
                    FROM qStates
                    WHERE StateID = <cfqueryparam value="#qGetAddresses.State#" cfsqltype="cf_sql_integer" />
                </cfquery>
            </cfif>
            
            <cfquery name="qUpdateAddresses" datasource="#Application.Settings.DSN#">
            	UPDATE ce_Person_Address
                SET 
                	<cfif qGetAddresses.State EQ "" OR qGetAddresses.State EQ 0>
                    	State = <cfqueryparam null="yes" />
                    <cfelse>
                    	State = <cfqueryparam value="#qGetStateName.Code#" cfsqltype="cf_sql_varchar" />
                    </cfif>
                WHERE ActivityID = <cfqueryparam value="#qGetAddresses.AddressID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        </cfloop>
        
        <cfoutput>
        #qGetAddresses.RecordCount# Address<cfif qGetAddresses.RecordCount NEQ 1>es have<cfelse> has</cfif> been updated.
        </cfoutput>
        
        <!--- CDC ATTENDEE RECORDS --->
        <cfquery name="qGetAttendees" datasource="#Application.Settings.DSN#">
        	SELECT AttendeeCDCID, WorkState
            FROM ce_AttendeeCDC
            WHERE WorkState = '' OR isNumeric(WorkState) = 1
        </cfquery>
        
        <cfloop query="qGetAttendees">
        	<cfif qGetAttendees.WorkState NEQ "" AND qGetAttendees.WorkState NEQ 0>
                <cfquery name="qGetStateName" dbtype="query">
                    SELECT Code
                    FROM qStates
                    WHERE StateID = <cfqueryparam value="#qGetAttendees.WorkState#" cfsqltype="cf_sql_integer" />
                </cfquery>
            </cfif>
            
            <cfquery name="qUpdateAttendees" datasource="#Application.Settings.DSN#">
            	UPDATE ce_AttendeeCDC
                SET 
                	<cfif qGetAttendees.WorkState EQ "" OR qGetAttendees.WorkState EQ 0>
                    	WorkState = <cfqueryparam null="yes" />
                    <cfelse>
                    	WorkState = <cfqueryparam value="#qGetStateName.Code#" cfsqltype="cf_sql_varchar" />
                    </cfif>
                WHERE AttendeeCDCID = <cfqueryparam value="#qGetAttendees.AttendeeCDCID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        </cfloop>
        
        <cfoutput>
        #qGetAttendees.RecordCount# Attendee<cfif qGetAttendees.RecordCount NEQ 1>s have<cfelse> has</cfif> been updated.
        </cfoutput>
    </cffunction>
	
	<cfscript>
	/* LAST DAY OF MONTH */
	function LastDayOfMonth(strMonth) {
	  var strYear=Year(Now());
	  if (ArrayLen(Arguments) gt 1)
		strYear=Arguments[2];
	  return DateAdd("d", -1, DateAdd("m", 1, CreateDate(strYear, strMonth, 1)));
	}
	
	/* CONVERTS -1 to YES and 0 to NO */
	function convertToYesNo(strVar) {
		var sReturn = "N";
		
		if (strVar EQ -1) {
			sReturn = "Y";
		}
		
		return sReturn;
	}
	
	/* FIXES CSV ISSUES */
	function listFix(list) {
	var delim = ",";
	  var null = "NULL";
	  var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
	  var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";
	  var i = "";
		   
	  if(arrayLen(arguments) gt 1) delim = arguments[2];
	  if(arrayLen(arguments) gt 2) null = arguments[3];
	
	  if(findnocase(left(list, 1),delim)) list = null & list;
	  if(findnocase(right(list,1),delim)) list = list & null;
	
	  i = len(delim) - 1;
	  while(i GTE 1){
		delim = mid(delim,1,i) & "_Separator_" & mid(delim,i+1,len(delim) - (i));
		i = i - 1;
	  }
	
	  delim = ReplaceList(delim, special_char_list, esc_special_char_list);
	  delim = Replace(delim, "_Separator_", "|", "ALL");
	
	  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
	  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
		  
	  return list;
	}
	</cfscript>
</cfcomponent>