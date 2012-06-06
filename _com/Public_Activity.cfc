<cfcomponent>
	<!--- INCLUDE isMD UDF FUNCTION --->
    <cfinclude template="/_com/_UDF/isMD.cfm" />
    
	<cffunction name="init" access="public" output="no" returntype="_com.Public_Activity">
		<cfreturn this />
	</cffunction>
    
	<cffunction name="refresh" access="public" output="no" returntype="void">
		<cfargument name="activityId" type="numeric" required="yes" />
		
		<cfquery name="qRefresh" datasource="#application.settings.dsn#">
			UPDATE ce_Activity
			SET refreshFlag=1
			WHERE activityId=<cfqueryparam value="#arguments.activityId#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cffunction>
	
	<cffunction name="AutoComplete" access="Public" output="no" returntype="string">
		<cfargument name="q" type="string" required="yes">
		<cfargument name="limit" type="string" required="yes">
		
		<cfset var ResultArray = "">
		
		<cfquery name="qList" datasource="#Application.Settings.DSN#">
        	SELECT DISTINCT TOP #Arguments.Limit# Title 
            FROM ce_Activity 
            WHERE Title LIKE <cfqueryparam value="#Arguments.q#%" cfsqltype="cf_sql_varchar" /> AND DeletedFlag='N'
		</cfquery>
		<cfsavecontent variable="ResultArray"><cfoutput><cfloop query="qList">#qList.Title#<cfif qList.RecordCount NEQ qList.CurrentRow>#Chr(10)#</cfif></cfloop></cfoutput></cfsavecontent>
		
		<cfreturn ResultArray />
	</cffunction>
    
	<cffunction name="AutoCompleteLMS" access="Public" output="no" returntype="string">
		<cfargument name="q" type="string" required="yes">
		<cfargument name="limit" type="string" required="yes">
		
		<cfset var ResultArray = "">
		
		<cfquery name="qList" datasource="#Application.Settings.DSN#">
			SELECT DISTINCT TOP #Arguments.Limit# C.Title 
			FROM ce_Sys_Status AS S 
            RIGHT OUTER JOIN ce_Activity AS C ON S.StatusID = C.StatusID 
            LEFT OUTER JOIN ce_Sys_ActivityType AS CT ON C.ActivityTypeID = CT.ActivityTypeID 
            LEFT OUTER JOIN ce_Sys_Grouping AS G ON C.GroupingID = G.GroupingID
            INNER JOIN ce_Activity_PubGeneral AS ACP ON ACP.ActivityID = C.ActivityID
			WHERE 
            	(
                C.Title LIKE <cfqueryparam value="%#Arguments.q#%" cfsqltype="cf_sql_varchar" /> AND 
                C.DeletedFlag='N' AND
                C.StatusID = 1 AND
                C.DeletedFlag = 'N' AND
                ACP.PublishDate <= GetDate() AND
                ACP.RemoveDate IS NULL
                )
            OR
            	(
                C.Title LIKE <cfqueryparam value="%#Arguments.q#%" cfsqltype="cf_sql_varchar" /> AND 
                C.DeletedFlag='N' AND
                C.StatusID = 1 AND
                C.DeletedFlag = 'N' AND
                ACP.PublishDate <= GetDate() AND
                ACP.RemoveDate > GetDate()
                )
		</cfquery>
		<cfsavecontent variable="ResultArray"><cfoutput><cfloop query="qList">#qList.Title#<cfif qList.RecordCount NEQ qList.CurrentRow>#Chr(10)#</cfif></cfloop></cfoutput></cfsavecontent>
		
		<cfreturn ResultArray />
	</cffunction>
    
    <cffunction name="cancelActivity" hint="Removes Attendee Record from Activity" access="Public" output="true" returntype="string">
    	<cfargument name="ActivityID" required="true" type="string" />
    	<cfargument name="PersonID" required="true" type="string" />
        
        <cfset var Status = "">
        
        <cfset AttendeeBean = CreateObject("component","#Application.Settings.Com#Attendee.Attendee").Init(ActivityID=Arguments.ActivityID,PersonID=Arguments.PersonID)>
        <cfset AttendeeDelete = Application.Com.AttendeeDAO.Delete(AttendeeBean)>
        
        <cfif AttendeeDelete>
        	<cfset Status = "Success|Registration information has been deleted.">
        <cfelse>
        	<cfset Status = "Fail|There was an error while performing this task.">
        </cfif>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="CopyPaste" displayname="Copy and Paste Activity" access="Public" output="no" returntype="struct">
		<cfargument name="Mode" type="numeric" required="yes">
		<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="NewActivityTitle" type="string" required="yes">
        <cfargument name="NewActivityTypeID" type="numeric" required="yes">
        <cfargument name="NewGroupingID" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot copy activity for unknown reasons.")>
		
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<cfset qSessions = Application.Com.ActivityGateway.getByAttributes(ParentActivityID=ActivityBean.getActivityID())>
		<cfset qFaculty = Application.Com.ActivityFacultyGateway.getByAttributes(ActivityID=ActivityBean.getActivityID(),deletedFlag='N')>
		<cfset qCommittee = Application.Com.ActivityCommitteeGateway.getByAttributes(ActivityID=ActivityBean.getActivityID(),deletedFlag='N')>
		<cfset qCredits = Application.Com.ActivityCreditGateway.getByAttributes(ActivityID=ActivityBean.getActivityID(),deletedFlag='N')>
		<cfset qFiles = Application.Com.FileGateway.getByAttributes(ActivityID=ActivityBean.getActivityID(),deletedFlag='N')>
		<cfset qOther = Application.Com.ActivityOtherGateway.getByAttributes(ActivityID=ActivityBean.getActivityID())>
		<cfset qCats = Application.Com.ActivityCategoryGateway.getByAttributes(ActivityID=ActivityBean.getActivityID(),deletedFlag='N')>
        <cfset qAgenda = Application.Com.AgendaGateway.getByAttributes(ActivityID=ActivityBean.getActivityID(),deletedFlag='N')>
        
		<cfset NewActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=ActivityBean.getActivityID())>
		<cfset NewActivity = Application.Com.ActivityDAO.Read(NewActivity)>
		<cfswitch expression="#Arguments.Mode#">
			<cfcase value="1">
				<cfset NewActivity.setTitle(Arguments.NewActivityTitle)>
				<cfset NewActivity.setActivityID(0)>
				<cfset NewActivity.setParentActivityID("")>
				<cfset NewActivity.setCreatedBy(session.currentuser.id)>
                <cfset NewActivity.setStatAddlAttendees(0)>
                <cfset NewActivity.setStatMaxRegistrants(0)>
				<cfset NewActivity.setStatAttendees(0)>
				<cfset NewActivity.setStatMD(0)>
				<cfset NewActivity.setStatNonMD(0)>
				<cfset NewActivity.setStatSupporters(0)>
				<cfset NewActivity.setStatSuppAmount(0)>
				<cfset NewActivity.setActivityTypeID(NewActivityTypeID)>
                <cfif NewGroupingID NEQ 0>
                    <cfset NewActivity.setGroupingID(NewGroupingID)>
                <cfelse>
                    <cfset NewActivity.setGroupingID("")>
                </cfif>
				
				<cfset NewActivityID = Application.Com.ActivityDAO.Create(NewActivity)>
				
				<cfset CopyItems(NewActivityID)>
				
				<!--- ADD HISTORY ITEM --->
                <cfset OutputVar = "Activity of origin: <a href=""%WebPath%Activity.Detail?ActivityID=" & ActivityBean.getActivityID() & ">" & ActivityBean.getTitle() & "</a>">
                <cfset Application.History.Add(
                            HistoryStyleID=22,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=NewActivityID,
							ToContent=OutputVar)>
				
				<cfif ActivityBean.getSessionType() EQ "M">
					<cfset NewActivity.setParentActivityID(NewActivityID)>
					
					<cfif qSessions.RecordCount GT 0>
					<cfloop query="qSessions">
						<cfset SessionBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=qSessions.ActivityID)>
						<cfset SessionBean = Application.Com.ActivityDAO.read(SessionBean)>
						
						<cfset OldSessionTitle = SessionBean.getTitle()>
						
						<cfset SessionBean.setTitle("Copy of " & SessionBean.getTitle())>
						<cfset SessionBean.setParentActivityID(NewActivityID)>
						<cfset SessionBean.setCreatedBy(session.currentuser.id)>
						<cfset SessionBean.setStatAttendees(0)>
						<cfset SessionBean.setStatMD(0)>
						<cfset SessionBean.setStatNonMD(0)>
						<cfset SessionBean.setStatSupporters(0)>
						<cfset SessionBean.setStatSuppAmount(0)>
						<cfset NewActivity.setActivityTypeID(NewActivityTypeID)>
                        <cfif NewGroupingID NEQ 0>
                            <cfset NewActivity.setGroupingID(NewGroupingID)>
                        <cfelse>
                            <cfset NewActivity.setGroupingID("")>
                        </cfif>
						<cfset NewSessionID = Application.Com.ActivityDAO.Create(SessionBean)>
						
						<!--- READ IN ALL OTHER DATA --->
						<cfset qFaculty = Application.Com.ActivityFacultyGateway.getByAttributes(ActivityID=SessionBean.getActivityID())>
						<cfset qCommittee = Application.Com.ActivityCommitteeGateway.getByAttributes(ActivityID=SessionBean.getActivityID())>
						<cfset qCredits = Application.Com.ActivityCreditGateway.getByAttributes(ActivityID=SessionBean.getActivityID())>
						<cfset qFiles = Application.Com.FileGateway.getByAttributes(ActivityID=SessionBean.getActivityID())>
						<cfset qOther = Application.Com.ActivityOtherGateway.getByAttributes(ActivityID=SessionBean.getActivityID())>
						<cfset qCats = Application.Com.ActivityCategoryGateway.getByAttributes(ActivityID=SessionBean.getActivityID())>
						
						<cfset CopyItems(NewSessionID)>
					</cfloop>
					</cfif>
					
					<cfset Application.Com.ActivityDAO.Create(NewActivity)>
				</cfif>
                
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Copy and Paste Successful!")>
                <cfset aActivityInfo = [{
					activityid = NewActivityID
					}] />
                <cfset status.setData(aActivityInfo)>
			</cfcase>
			<cfcase value="2">
				<cfset NewActivity.setTitle(Arguments.NewActivityTitle)>
				
				<cfif NewActivity.getParentActivityID() EQ "">
					<cfset NewActivity.setParentActivityID(NewActivity.getActivityID())>
				</cfif>
				
				<cfset ParentActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=NewActivity.getParentActivityID())>
				<cfset ParentActivity = Application.Com.ActivityDAO.Read(ParentActivity)>
				
				<cfset NewActivity.setStatAttendees(0)>
				<cfset NewActivity.setStatMD(0)>
				<cfset NewActivity.setStatNonMD(0)>
				<cfset NewActivity.setStatSupporters(0)>
				<cfset NewActivity.setStatSuppAmount(0)>
				<cfset NewActivity.setCreatedBy(session.currentuser.id)>
				<cfset NewActivityID = Application.Com.ActivityDAO.Create(NewActivity)>
				
				<!--- ADD HISTORY ITEM --->
                <cfset OutputVar = "Activity of origin: <a href=""%WebPath%Activity.Detail?ActivityID=" & ActivityBean.getActivityID() & ">" & ActivityBean.getTitle & "</a>">
                <cfset Application.History.Add(
                            HistoryStyleID=22,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=NewActivityID,
							ToContent=OutputVar)>
				
				<cfset CopyItems(NewActivityID)>
				
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Copy and Paste Successful!")>
                <cfset aActivityInfo = [{
					activityid = NewActivityID
					}] />
                <cfset status.setData(aActivityInfo)>
			</cfcase>
			<cfdefaultcase>
                <cfset status.setStatusMsg("Failed because of unknown reason.")>
			</cfdefaultcase>
		</cfswitch>
		
		<cfreturn status />
	</cffunction>
	
	<cffunction name="CopyItems" access="Public" output="false">
		<cfargument name="ActivityID" required="yes" type="numeric" />
		
		<cfif qFaculty.RecordCount GT 0>
			<!---<cfloop query="qFaculty">
				<cfset FacultyBean = CreateObject("component","#Application.Settings.Com#ActivityFaculty.ActivityFaculty").init(ActivityID=qFaculty.ActivityID,PersonID=qFaculty.PersonID)>
				<cfset FacultyBean = Application.Com.ActivityFacultyDAO.read(FacultyBean)>
				<cfset FacultyBean.setActivityID(Arguments.ActivityID)>
				<cfset FacultyBean.setCreatedBy(session.currentuser.id)>
				<cfset Application.Com.ActivityFacultyDAO.Create(FacultyBean)>
			</cfloop>--->
		</cfif>
		
		<cfif qCommittee.RecordCount GT 0>
			<cfloop query="qCommittee">
				<cfset CommitteeBean = CreateObject("component","#Application.Settings.Com#ActivityCommittee.ActivityCommittee").init(qCommittee.CommitteeID)>
				<cfset CommitteeBean = Application.Com.ActivityCommitteeDAO.read(CommitteeBean)>
				<cfset CommitteeBean.setActivityID(Arguments.ActivityID)>
				<cfset Application.Com.ActivityCommitteeDAO.Create(CommitteeBean)>
			</cfloop>
		</cfif>
		
		<cfif qCredits.RecordCount GT 0>
			<cfloop query="qCredits">
				<cfset CreditBean = CreateObject("component","#Application.Settings.Com#ActivityCredit.ActivityCredit").init(ActivityID=qCredits.ActivityID,CreditID=qCredits.CreditID)>
				<cfset CreditBean = Application.Com.ActivityCreditDAO.read(CreditBean)>
				<cfset CreditBean.setActivityID(Arguments.ActivityID)>
				<cfset CreditBean.setCreatedBy(session.currentuser.id)>
				<cfset Application.Com.ActivityCreditDAO.Create(CreditBean)>
			</cfloop>
		</cfif>
		
		<cfif qFiles.RecordCount GT 0>
			<cfloop query="qFiles">
				<cfset OldDirectory = ExpandPath("/_uploads/ActivityFiles/#qFiles.ActivityID#/")>
				<cfset NewDirectory = ExpandPath("/_uploads/ActivityFiles/#Arguments.ActivityID#/")>
				
				<cfif NOT DirectoryExists(NewDirectory)>
					<cfdirectory action="Create" directory="#NewDirectory#" />
				</cfif>
				<cfset FilePath = "#OldDirectory##qFiles.FileName#">
				<cfset NewFilePath = "#NewDirectory##qFiles.FileName#">
				
				<cfif FileExists(FilePath)>
					<cffile
						action="copy" source="#FilePath#"
						destination="#NewFilePath#"
						nameconflict="overwrite" />
				
					<cfset FileBean = CreateObject("component","#Application.Settings.Com#File.File").init(FileID=qFiles.FileID)>
					<cfset FileBean = Application.Com.FileDAO.read(FileBean)>
					<cfset FileBean.setActivityID(Arguments.ActivityID)>
					<cfset FileBean.setCreatedBy(session.currentuser.id)>
					<cfset Application.Com.FileDAO.Create(FileBean)>
				</cfif>
			</cfloop>
		</cfif>
		
		<cfif qCats.RecordCount GT 0>
			<cfloop query="qCats">
				<cfset CatBean = CreateObject("component","#Application.Settings.Com#ActivityCategory.ActivityCategory").init(Activity_CategoryID=qCats.Activity_CategoryID)>
				<cfset CatBean = Application.Com.ActivityCategoryDAO.read(CatBean)>
				<cfset CatBean.setActivityID(Arguments.ActivityID)>
				<cfset CatBean.setCreatedBy(session.currentuser.id)>
				<cfset Application.Com.ActivityCategoryDAO.Create(CatBean)>
			</cfloop>
		</cfif>
        
        <cfif qAgenda.RecordCount GT 0>
        	<cfloop query="qAgenda">
            	<cfset AgendaBean = CreateObject("component","#Application.Settings.Com#Agenda.Agenda").Init(AgendaID=qAgenda.AgendaID)>
                <cfset AgendaBean = Application.Com.AgendaDAO.Read(AgendaBean)>
				<cfset AgendaBean.setActivityID(Arguments.ActivityID)>
				<cfset AgendaBean.setCreatedBy(session.currentuser.id)>
                <cfset AgendaBean.setDeletedFlag("N")>
                <cfset Application.Com.AgendaDAO.Create(AgendaBean)>
            </cfloop>
        </cfif>
	</cffunction>
    
	<cffunction name="createCategory" displayname="Create New Category" access="Public" returntype="struct">
		<cfargument name="Name" type="string" required="yes">
        
		<cfset var NewCategoryID = "">
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Failed for unknown reason.")>
		
		<cfquery name="qCheck" datasource="#Application.Settings.DSN#">
			SELECT CategoryID FROM ce_Category
			WHERE Name='#Arguments.Name#'
		</cfquery>
		
		<cfif qCheck.RecordCount EQ 0>
			<cfset CatBean = CreateObject("component","#Application.Settings.Com#Category.Category").init()>
			<cfset CatBean.setName(Arguments.Name)>
			<cfset CatBean.setCreatedBy(session.currentuser.id)>
			<cfset CatBean.setActivityCount(0)>
			<cfset NewCategoryID = Application.Com.CategoryDAO.create(CatBean)>
            
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Category successfully created.")>
		<cfelse>
            <cfset status.setStatusMsg("That category name is already taken.")>
		</cfif>
		
		<cfif isNumeric(NewCategoryID)>
			<cfset aCategoryInfo = [{
                categoryid = NewCategoryID
                }] />
            <cfset status.setData(aCategoryInfo)>
		</cfif>
        
		<cfreturn status />
	</cffunction>
    
    <cffunction name="deleteActivity" access="public" output="false" returntype="struct">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="Reason" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete activity due to unknown reasons.")>
        
        <cfset ActivityBean = CreateObject("component", "#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
        <cfset ActivityExists = Application.Com.ActivityDAO.Exists(ActivityBean)>
       	
        <cfif ActivityExists>
        	<cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
            <cfset ActivityBean.setDeletedFlag("Y")>
            <cfset ActivityBean.setDeleted(Now())>
            
            <cfset ActivityDeleted = Application.Com.ActivityDAO.Update(ActivityBean)>
            
            <cfif ActivityDeleted>
	            <cfset OutputContent = "<strong>Reason:</strong> " & Arguments.Reason>
                
            	<cfset Application.History.Add(
							HistoryStyleID=105,
							FromPersonID=session.currentuser.id,
							ToActivityID=Arguments.ActivityID,
                            ToContent=OutputContent)>
				
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Activity has been deleted.")>
            </cfif>
        </cfif>
        
        <cfreturn status />
    </cffunction>
	
	<cffunction name="deleteAgendaItem" access="Public" output="true" returntype="struct">
		<cfargument name="AgendaID" required="yes" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete agenda item for unknown reasons.")>
		
		<cfset AgendaBean = CreateObject("component","#Application.Settings.Com#Agenda.Agenda").init(AgendaID=Arguments.AgendaID)>
        
        <cfset AgendaExists = Application.Com.AgendaDAO.Exists(AgendaBean)>
        <cfif AgendaExists>
			<cfset AgendaBean = Application.Com.AgendaDAO.read(AgendaBean)>
            
            <cfquery name="qDelete" datasource="#Application.Settings.DSN#">
                DELETE ce_Agenda WHERE AgendaID=<cfqueryparam value="#Arguments.AgendaID#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <!--- ACTION UPDATER --->
            <cfset Application.History.Add(
						HistoryStyleID=4,
						FromPersonID=session.currentuser.id,
						ToActivityID=AgendaBean.getActivityID())>
            
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Agenda item has been deleted.")>
        <cfelse>
        	<cfset status.setStatusMsg("Agenda item does not exist.")>
        </cfif>
        
        <cfreturn Status />
	</cffunction>

	<cffunction name="deleteCategory" access="Public" output="true" returntype="struct">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="CategoryID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete activity category for unknown reasons.")>
		
		<!--- CAT INFO --->
		<cfset CatBean = CreateObject("component","#Application.Settings.Com#Category.Category").init(CategoryID=Arguments.CategoryID)>
		<cfset CatBean = Application.Com.CategoryDAO.read(CatBean)>
		
		<!--- ACTIVITY INFO --->
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<cftry>
			<!--- Delete each record --->
			<cfquery name="qRemove" datasource="#Application.Settings.DSN#">
				UPDATE ce_Activity_Category
				SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,Deleted=#CreateODBCDateTime(now())#,
					UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_char" />
				WHERE CategoryID = <cfqueryparam value="#CategoryID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
			</cfquery>
			
			<!--- ADD HISTORY ITEM --->
            <cfset Application.History.Add(
                        HistoryStyleID=23,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID,
                        ToContainerID=Arguments.CategoryID)>
			
			<!--- UPDATE CAT STATS --->
			<cfset CatBean.setActivityCount(CatBean.getActivityCount()-1)>
			<cfset Application.Com.CategoryDAO.Update(CatBean)>

			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Container removed successfully!")>
			
			<cfcatch type="any">
				<cfset status.addError("General","Error: " & cfcatch.message)>
			</cfcatch>
		</cftry>
		
		<cfreturn status />
	</cffunction>
    
	<cffunction name="deleteNote" access="Public" output="true" returntype="struct">
		<cfargument name="NoteID" type="string" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete activity note for unknown reasons.")>
		
		<cfif Arguments.NoteID EQ "">
			<cfset status.setStatusMsg("More information is needed to delete this note.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>
            <cfset Attributes.Deleted = CreateODBCDateTime(Now())>
            
            <cfquery name="qDeleteNote" datasource="#Application.Settings.DSN#">
                UPDATE ce_Activity_Note
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char">,
                    Deleted = <cfqueryparam value="#Attributes.Deleted#" cfsqltype="cf_sql_timestamp">,
                    UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer">
                WHERE NoteID = <cfqueryparam value="#Arguments.NoteID#" cfsqltype="cf_sql_integer">
            </cfquery>
            
            <!--- NOTE INFO --->
            <cfset NoteBean = CreateObject("component","#Application.Settings.Com#ActivityNote.ActivityNote").init(NoteID=Arguments.NoteID)>
            <cfset NoteBean = Application.Com.ActivityNoteDAO.read(NoteBean)>
            
            <!--- ADD HISTORY ITEM --->
            <cfset Application.History.Add(
                        HistoryStyleID=49,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=NoteBean.getActivityID())>
            
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("Note has been deleted!")>
            
            <cfcatch type="any">
                <cfset status.addError("General","Error: " & cfcatch.Message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>
    
    <cffunction name="emailCertificate" hint="Sends a copy of provided personId's certificate to their email address on file." access="public" output="false" returntype="struct">
        <cfargument name="activityId" type="numeric" required="yes">
    	<cfargument name="personId" type="numeric" required="yes">
        <cfargument name="subject" type="string" required="yes">
        <cfargument name="body" type="string" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        <cfset var activityBean = createObject("component", "#application.settings.com#activity.activity").init(activityId=arguments.activityId)>
        <cfset var personBean = createObject("component", "#application.settings.com#person.person").init(personId=arguments.personId)>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot send certificate via email due to unknown reasons.")>
        
        <cfset activityBean = application.com.activityDAO.read(activityBean)>
        <cfset personBean = application.com.personDAO.read(personBean)>
        
        <cfquery name="qReportDataPre" datasource="#Application.Settings.DSN#">
            SELECT 	TOP 1 a.MDFlag,
                    a.CheckIn,
                    a.CompleteDate,
                    act.StartDate AS CertificateDate,
                    act.EndDate,
                    act.ActivityID,
                    act.Title AS ActivityTitle,
                    act.ActivityTypeID, 
                    act.Location AS ActivityLocation, 
                    act.Sponsorship,
                    act.Sponsor,
                    act.City,
                    s.Name AS State,
                    a.AttendeeID,
                    p.DisplayName
                    <cfif CertType NEQ "Participation">
                    ,ac.Amount AS TotalAmount,
                    (SELECT TOP 1 attc.Amount
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = <cfqueryparam value="#CurrCreditID#" cfsqltype="cf_sql_integer" />)) AS CreditAmount,
                    (SELECT TOP 1 attc.ReferenceNo
                     FROM ce_AttendeeCredit attc
                     WHERE (attc.AttendeeID = a.AttendeeID) AND (attc.CreditID = <cfqueryparam value="#CurrCreditID#" cfsqltype="cf_sql_integer" />)) AS ReferenceNumber,
                    sc.Name AS CreditName
                    </cfif>
            FROM ce_Attendee a
            INNER JOIN ce_Person p ON p.PersonID = a.PersonID
            <cfif CertType NEQ "Participation">
                INNER JOIN ce_Activity_Credit ac ON ac.ActivityID = a.ActivityID
                INNER JOIN ce_Sys_Credit sc ON sc.CreditID = ac.CreditID
            </cfif>
            INNER JOIN ce_Activity act ON act.ActivityID = a.ActivityID
            LEFT JOIN ce_Sys_state s ON s.StateId = act.State
            WHERE 
                <cfif IsDefined("Attributes.PersonID")>
                    a.PersonID IN (#Attributes.PersonID#) AND
                </cfif>
                a.DeletedFlag <> 'Y' AND 
                a.ActivityID = <cfqueryparam value="#Attributes.ActivityID#" cfsqltype="cf_sql_integer" /> AND 
                <cfswitch expression="#CertType#">
                    <cfcase value="CME">
                        sc.Name = <cfqueryparam value="CME" cfsqltype="cf_sql_varchar" /> AND
                    </cfcase>
                    <cfcase value="CNE">
                        sc.Name = <cfqueryparam value="CNE" cfsqltype="cf_sql_varchar" /> AND
                    </cfcase>
                    <cfcase value="CPE">
                        sc.Name = <cfqueryparam value="CPE" cfsqltype="cf_sql_varchar" /> AND
                    </cfcase>
                </cfswitch>
                act.DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />
        </cfquery>
        
        <cfmail
        	to="#personBean.getEmail()#"
            from="no-reply@uc.edu"
            subject="#arguments.subject#">
            #arguments.body#
            
            This is a test for the certificate mailer.
        </cfmail>
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Certificate has been emailed.")>
        <cfreturn status />
    </cffunction>
    
	<cffunction name="fixStats" output="no" access="Public" returntype="struct">
		<cfargument name="RunDate" type="string" required="no" />
		<cfargument name="ActivityID" type="numeric" required="no" />
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot fix activity stats for unknown reasons.")>
		
		<cfquery name="qSelector" datasource="#Application.Settings.DSN#">
			SELECT
			A.ActivityID,
			A.StartDate,
			EndDate = DATEADD(n, 1439, A.EndDate),
			StatHrs =
			(CASE A.SessionType
				WHEN 'M' THEN 
					isNull((SELECT SUM(AC.Amount) AS TotalHours
							FROM ce_Activity_Credit AS AC 
							INNER JOIN ce_Activity AS A4 ON AC.ActivityID = A4.ActivityID
							WHERE (AC.CreditID = 1) AND (A4.ParentActivityID = A.ActivityID) AND AC.DeletedFlag='N' AND (A4.StatusID IN (1,2,3))),0)
				WHEN 'S' THEN 
					isNull((SELECT SUM(AC.Amount) AS TotalHours
							FROM ce_Activity_Credit AS AC 
							INNER JOIN ce_Activity AS A4 ON AC.ActivityID = A4.ActivityID
							WHERE (AC.CreditID = 1) AND (A4.ActivityID = A.ActivityID) AND AC.DeletedFlag='N' AND (A4.StatusID IN (1,2,3))),0)
			END),
			StatAttendees = 
				(CASE A.SessionType
					WHEN 'M' THEN 
						CASE
							WHEN isNull(A.ParentActivityID,0) = 0 THEN
								(SELECT Count(Att.AttendeeID)
								 FROM ce_Attendee AS Att 
								 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
								 WHERE 
									(Att.StatusID = 1) AND (A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
							ELSE
								(SELECT Count(Att.AttendeeID)
								 FROM ce_Attendee AS Att 
								 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
								 WHERE 
									(Att.StatusID = 1) AND (A2.ActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
						END
					WHEN 'S' THEN
						(SELECT Count(Att.AttendeeID)
						 FROM ce_Attendee AS Att 
						 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
						 WHERE 
							(Att.StatusID = 1) AND (Att.ActivityID = a.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
				END),
				StatMD = 
				(CASE A.SessionType
					WHEN 'M' THEN 
						CASE
							WHEN isNull(A.ParentActivityID,0) = 0 THEN
								(SELECT Count(Att.AttendeeID)
								 FROM ce_Attendee AS Att 
								 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
								 WHERE 
									(Att.StatusID = 1) AND (A2.ParentActivityID = A.ActivityID) AND (Att.MDflag = 'Y') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
							ELSE
								(SELECT Count(Att.AttendeeID)
								 FROM ce_Attendee AS Att 
								 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
								 WHERE 
									(Att.StatusID = 1) AND (A2.ActivityID = A.ActivityID) AND (Att.MDflag = 'Y') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
						END
					WHEN 'S' THEN
						(SELECT Count(Att.AttendeeID)
						 FROM ce_Attendee AS Att 
						 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
						 WHERE 
							(Att.StatusID = 1) AND (Att.ActivityID = a.ActivityID) AND (Att.MDflag = 'Y') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
				END),
				StatNonMD = 
				(CASE A.SessionType
					WHEN 'M' THEN 
						CASE
							WHEN isNull(A.ParentActivityID,0) = 0 THEN
								(SELECT Count(Att.AttendeeID)
								 FROM ce_Attendee AS Att 
								 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
								 WHERE 
									(Att.StatusID = 1) AND (A2.ParentActivityID = A.ActivityID) AND (Att.MDflag = 'N') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
							ELSE
								(SELECT Count(Att.AttendeeID)
								 FROM ce_Attendee AS Att 
								 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
								 WHERE 
									(Att.StatusID = 1) AND (A2.ActivityID = A.ActivityID) AND (Att.MDflag = 'N') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
						END
					WHEN 'S' THEN
						(SELECT Count(Att.AttendeeID)
						 FROM ce_Attendee AS Att 
						 INNER JOIN ce_Activity AS A2 ON Att.ActivityID = A2.ActivityID
						 WHERE 
							(Att.StatusID = 1) AND (Att.ActivityID = a.ActivityID) AND (Att.MDflag = 'N') AND (A2.StatusID IN (1,2,3)) AND (Att.CompleteDate BETWEEN A2.StartDate AND DATEADD(n, 1439, A2.EndDate)) AND (Att.DeletedFlag='N'))
				END)
		FROM 
			ce_Activity A
		WHERE
			(A.StatusID IN (1, 2, 3)) AND
			(A.DeletedFlag = 'N')
			<cfif Arguments.ActivityID GT 0>
			AND (A.ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />)
			<cfelse>
				<cfif isDate(Arguments.RunDate)>
				AND (A.StartDate >= <cfqueryparam value="#Arguments.RunDate#" cfsqltype="cf_sql_datetime" />)
				</cfif>
			</cfif>
		</cfquery>
		
		<cfloop query="qSelector">
			<cfset stats = {} />
			<cfif NOT isNumeric(qSelector.StatHrs)>
				<cfset stats['hrs'] = 0 />
			<cfelse>
				<cfset stats['hrs'] = qSelector.StatHrs />
			</cfif>
			<cfif NOT isNumeric(qSelector.StatAttendees)>
				<cfset stats['attendees'] = 0 />
			<cfelse>
				<cfset stats['attendees'] = qSelector.StatAttendees />
			</cfif>
			<cfif NOT isNumeric(qSelector.StatMD)>
				<cfset stats['md'] = 0 />
			<cfelse>
				<cfset stats['md'] = qSelector.StatMD />
			</cfif>
			<cfif NOT isNumeric(qSelector.StatNonMD)>
				<cfset stats['nonmd'] = 0 />
			<cfelse>
				<cfset stats['nonmd'] = qSelector.StatNonMD />
			</cfif>
			<cfquery name="qUpdater" datasource="#Application.Settings.DSN#">
				UPDATE ce_Activity
				SET 
					StatCMEHours=#stats.hrs#,
					StatAttendees=#stats.attendees#,
					StatMD = #stats.md#,
					StatNonMD = #stats.nonmd#
				WHERE ActivityID=#qSelector.ActivityID#
			</cfquery>
		</cfloop>
		
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Stats have been updated.")>
		
		<cfreturn status />
	</cffunction>
    
    <cffunction name="getActivitySpecialties" access="Public" output="no" returntype="array">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        
        <cfset var ActivitySpecialties = arrayNew(1)>
        
        <cfquery name="qActivitySpecialties" datasource="#Application.Settings.DSN#">
        	SELECT SpecialtyID
            FROM ce_Activity_SpecialtyLMS
            WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
        </cfquery>
        
        <cfif qActivitySpecialties.recordCount GT 0>
        	<cfset ActivitySpecialties = application.udf.queryToStruct(qActivitySpecialties)>
        </cfif>
        
        <cfreturn ActivitySpecialties />
    </cffunction>
    
    <cffunction name="getGroupings" hint="Returns JSON data for groupings." access="Public" output="false" returntype="string">
    	<cfargument name="ATID" type="numeric" required="yes">
        
        <cfset var JSONDataList = "">
        
        <cfquery name="GroupingList" datasource="#Application.Settings.DSN#">
        	SELECT
            	GroupingID, Name
            FROM 
            	ce_Sys_Grouping
            WHERE 
            	ActivityTypeID = <cfqueryparam value="#Arguments.ATID#" cfsqltype="cf_sql_integer" />
        </cfquery>
        
        <cfif GroupingList.RecordCount GT 0>
        	<cfoutput>
        	<cfsavecontent variable="JSONDataList">
            {<cfloop query="GroupingList">"#GroupingList.GroupingID#":"#GroupingList.Name#"<cfif GroupingList.CurrentRow NEQ GroupingList.RecordCount>,</cfif></cfloop>}
            </cfsavecontent>
            </cfoutput>
        <cfelse>
        	<cfsavecontent variable="JSONDataList">{"":"No options available"}</cfsavecontent>
        </cfif>
        
        <cfreturn JSONDataList />
    </cffunction>
    
    <cffunction name="getNoteCount" access="Public" output="no" returntype="numeric">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        
        <cfquery name="NoteInfo" datasource="#Application.Settings.DSN#">
        	SELECT COUNT(NoteID) AS NoteCount
            FROM ce_Activity_Note
            WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag = 'N'
        </cfquery>
        
        <cfreturn NoteInfo.NoteCount />
    </cffunction>
    
    <cffunction name="isCDCActivity" access="public" output="false" returntype="boolean">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        
        <cfset var status = false>
        
        <cfquery name="qActivityInfo" datasource="#Application.Settings.DSN#">
        	SELECT COUNT(ActivityID) AS activityCount
            FROM ce_Activity_Category 
            WHERE 
            	ActivityID = <cfqueryparam value="#arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND
            	CategoryID IN(31,162,196)
        </cfquery>
        
        <cfif qActivityInfo.activityCount GT 0>
        	<cfset status = true>
        </cfif>
        
    	<cfreturn status />
    </cffunction>
	
	<cffunction name="JointlyAutoComplete" access="Public" output="no" returntype="string">
		<cfargument name="q" type="string" required="yes">
		<cfargument name="limit" type="string" required="yes">
		
		<cfset var ResultArray = "">
		
		<cfquery name="qList" datasource="#Application.Settings.DSN#">
			SELECT DISTINCT TOP #Arguments.Limit# Sponsor
			FROM ce_Activity
			WHERE Sponsor LIKE <cfqueryparam value="#Arguments.q#%" cfsqltype="cf_sql_varchar" />
			ORDER BY Sponsor
		</cfquery>
		
		<cfsavecontent variable="ResultArray"><cfoutput><cfloop query="qList">#qList.Sponsor#<cfif qList.RecordCount NEQ qList.CurrentRow>#Chr(10)#</cfif></cfloop></cfoutput></cfsavecontent>
		
		<cfreturn ResultArray />
	</cffunction>
    
    <cffunction name="markComplete" hint="LMS function to mark activity as complete and let the user view the certificate." access="Public" output="true" returntype="string">
		<cfargument name="PersonID" type="string" required="yes">
        <cfargument name="ActivityID" type="string" required="yes">
        
        <cfset Status = "">
        
        <!--- CHECK IF ALL ASSESSMENTS ARE COMPLETE --->
        <cfset AllAssessComplete = Application.Assessment.areAssessComplete(ActivityID=Arguments.ActivityID,PersonID=session.currentuser.id)>
        
        <!--- CHECK IF ANY ERRORS WERE FOUND --->
        <cfif AllAssessComplete>
        	<!--- GATHER ATTENDEE INFORMATION --->
			<cfset AttendeeBean = createobject("component","#Application.Settings.Com#Attendee.Attendee").Init(ActivityID=Arguments.ActivityID,PersonID=Arguments.PersonID)>
            <cfset AttendeeBean = Application.Com.AttendeeDAO.Read(AttendeeBean)>
            
            <!--- UPDATE ATTENDEE STATUSID --->
            <cfset AttendeeBean.setStatusID(1)>
            <cfset AttendeeBean.setCompleteDate(Now())>
            <cfset AttendeeBean.setUpdated(Now())>
            <cfset AttendeeBean.setUpdatedBy(session.currentuser.id)>
            <cfset Status = Application.Com.AttendeeDAO.Save(AttendeeBean)>
			
			<cftry>
				<cfset application.email.send(EmailStyleID=5,ToAttendeeID=AttendeeBean.getAttendeeID(),ToActivityID=arguments.activityId,ToPersonID=arguments.PersonId,ToCreditID=1) />
				
				<cfcatch type="any">
				
				</cfcatch>
			</cftry>
			
            <!--- SET STATUS --->
        	<cfset Status = "true|Activity has been marked completed!">
        </cfif>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="Move" displayname="Move Activity" access="Public" output="no" returntype="any">
		<cfargument name="FromActivityID" type="numeric" required="yes">
		<cfargument name="ToActivityID" type="numeric" required="yes">
		
		<cfset var sLongName = "">
		
		<cfset FromActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.FromActivityID)>
		<cfset FromActivity = Application.Com.ActivityDAO.Read(FromActivity)>
		
		<cfset ToActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ToActivityID)>
		<cfset ToActivity = Application.Com.ActivityDAO.Read(ToActivity)>
		
		<cfset ToActivity.setSessionType("M")>
		<cfset ToActivity.setStatAttendees(ToActivity.getStatAttendees() + FromActivity.getStatAttendees())>
		<cfset ToActivity.setStatNonMD(ToActivity.getStatNonMD() + FromActivity.getStatNonMD())>
		<cfset ToActivity.setStatMD(ToActivity.getStatMD() + FromActivity.getStatMD())>
		
		<cfif FromActivity.getParentActivityID() NEQ "">
			<cfset FromParentActivity = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=FromActivity.getParentActivityID())>
			<cfset FromParentActivity = Application.Com.ActivityDAO.Read(FromParentActivity)>
			<cfset FromParentActivity.setStatAttendees(FromParentActivity.getStatAttendees() - FromActivity.getStatAttendees())>
			<cfset FromParentActivity.setStatNonMD(FromParentActivity.getStatNonMD() - FromActivity.getStatNonMD())>
			<cfset FromParentActivity.setStatMD(FromParentActivity.getStatMD() - FromActivity.getStatMD())>
			<cfset Application.Com.ActivityDAO.Update(FromParentActivity)>
		</cfif>
		
		<cfset FromActivity.setParentActivityID(Arguments.ToActivityID)>
		<cfset FromActivity.setSessionType("M")>
		<cfset FromActivity.setGroupingID(ToActivity.getGroupingID())>
		<cfset FromActivity.setSponsorship(ToActivity.getSponsorship())>
		<cfset FromActivity.setSponsor(ToActivity.getSponsor())>

		<!--- ADD HISTORY ITEM --->
        <cfset Application.History.Add(
                    HistoryStyleID=47,
                    FromPersonID=session.currentuser.id,
                    FromActivityID=Arguments.FromActivityID,
                    ToActivityID=Arguments.ToActivityID)>
		
		<cfset Application.Com.ActivityDAO.Update(ToActivity)>
		<cfset Application.Com.ActivityDAO.Update(FromActivity)>
	</cffunction>
    
    <cffunction name="saveACCMEInfo" access="public" output="false" returntype="struct">
		<cfargument name="ActivityID" type="numeric" required="yes">
		<cfargument name="competenceDesign" type="numeric" required="no" default="0">
		<cfargument name="performanceDesign" type="numeric" required="no" default="0">
		<cfargument name="outcomesDesign" type="numeric" required="no" default="0">
		<cfargument name="competenceEval" type="numeric" required="no" default="0">
		<cfargument name="performanceEval" type="numeric" required="no" default="0">
		<cfargument name="outcomesEval" type="numeric" required="no" default="0">
        
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save ACCME information for unknown reasons.")>
        
        <cfset activityOtherBean = createObject("component","#application.settings.com#activityOther.activityOther").init(activityId=arguments.activityId)>
        
        <cfif application.com.activityOtherDAO.exists(activityOtherBean)>
        	<cfset activityOtherBean = application.com.activityOtherDAO.read(activityOtherBean)>
        </cfif>
        
        <cfset activityOtherBean.setCompetenceDesign(arguments.CompetenceDesign)>
        <cfset activityOtherBean.setCompetenceEval(arguments.CompetenceEval)>
        <cfset activityOtherBean.setPerformanceDesign(arguments.PerformanceDesign)>
        <cfset activityOtherBean.setPerformanceEval(arguments.PerformanceEval)>
        <cfset activityOtherBean.setOutcomesDesign(arguments.OutcomesDesign)>
        <cfset activityOtherBean.setOutcomesEval(arguments.OutcomesEval)>
        
        <cfset activityOtherSaved = application.com.activityOtherDAO.save(activityOtherBean)>
        
        <cfif isNumeric(activityOtherSaved) OR activityOtherSaved>
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("ACCME Information has been saved.")>
		</cfif>
        
        <cfreturn status />
    </cffunction>
    
	<cffunction name="saveActivity" access="Public" output="no" returntype="struct">
		<cfargument name="ActivityID" default="" type="string" required="yes">
		<cfargument name="Title" default="" type="string" required="yes">
		<cfargument name="activityTypeId" type="string" required="no" default="0">
		<cfargument name="groupingId" type="string" required="no" default="0">
		<cfargument name="StartDate" default="" type="string">
		<cfargument name="EndDate" default="" type="string">
		<cfargument name="Description" default="" type="string">
		<cfargument name="Location" default="" type="string">
		<cfargument name="Address1" default="" type="string">
		<cfargument name="Address2" default="" type="string">
		<cfargument name="City" default="" type="string">
		<cfargument name="State" default="" type="string">
		<cfargument name="Province" default="" type="string">
		<cfargument name="Country" default="" type="string">
		<cfargument name="PostalCode" default="" type="string">
		<cfargument name="Sponsorship" default="" type="string">
		<cfargument name="Sponsor" default="" type="string">
		<cfargument name="ExternalID" default="" type="string">
		<cfargument name="ReleaseDate" type="string" default="">
		<cfargument name="ChangedFields" type="string" required="no" default="" />
		<cfargument name="ChangedValues" type="string" required="no" default="" />
		
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
		<cfset var ChangedOutput = "">
		<cfset var sShortName = "">
		<cfset var sLongName = "">
        <cfset var i = 0>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save activity information for unknown reasons.")>
        
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(Arguments.ActivityID)>
		
		<cfif arguments.activityId GT 0 AND application.com.activitydao.exists(activityBean)>
			<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		</cfif>

		<cfset ActivityBean.setTitle(Arguments.Title)>
		<cfset ActivityBean.setDescription(Arguments.Description)>
		<cfset ActivityBean.setSponsorship(Arguments.Sponsorship)>
		<cfset ActivityBean.setSponsor(Arguments.Sponsor)>
		<cfif arguments.activityTypeId GT 0>
		<cfset ActivityBean.setActivityTypeId(Arguments.activityTypeId)>
		</cfif>
		<cfif arguments.groupingId GT 0>
		<cfset ActivityBean.setGroupingId(Arguments.groupingId)>
		</cfif>
		<cfset ActivityBean.setExternalID(Arguments.ExternalID)>
		<cfset ActivityBean.setReleaseDate(Arguments.ReleaseDate)>
		<cfset ActivityBean.setStartDate(Arguments.StartDate)>
		<cfset ActivityBean.setEndDate(Arguments.EndDate)>
		<cfset ActivityBean.setLocation(Arguments.Location)>
		<cfset ActivityBean.setAddress1(Arguments.Address1)>
		<cfset ActivityBean.setAddress2(Arguments.Address2)>
		<cfset ActivityBean.setCity(Arguments.City)>
		<cfset ActivityBean.setState(Arguments.State)>
		<cfset ActivityBean.setPostalCode(Arguments.PostalCode)>
		<cfset ActivityBean.setCountry(Arguments.Country)>
		
		<cfset ActivityBean.setUpdated(now())>
		<cfset ActivityBean.setUpdatedBy(session.currentuser.id)>
		
		<!--- Validate Bean --->
		<cfset aErrors = ActivityBean.Validate()>
		
		<cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
        	<cfset status.addError(aErrors[i].Field,aErrors[i].Message)>
		</cfloop>
		
		<cfif arrayLen(status.getErrors()) EQ 0>
			<cfset activitySaved = Application.Com.ActivityDAO.save(ActivityBean)>
			
            <cfif isNumeric(activitySaved) OR activitySaved>
				<cfif ListLen(ChangedFields,"|") GTE 1>
                    <cfloop from="1" to="#ListLen(ChangedFields,'|')#" index="i">
                        <cfset ChangedOutput = ListAppend(ChangedOutput,"<b>" & GetToken(Arguments.ChangedFields,i,'|') & ":</b> " & GetToken(Arguments.ChangedValues,i,'|'),"|")>
                    </cfloop>
                    <cfset ChangedOutput = Replace(ChangedOutput,"|","<br>","ALL")>
                </cfif>
                
                <cfset Application.History.Add(
                    HistoryStyleID=8,
                    FromPersonID=session.currentuser.id,
                    ToActivityID=Arguments.ActivityID,
                    ToContent=ChangedOutput
                )>
                
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Activity information has been saved.")>
            </cfif>
		</cfif>
		
		<cfreturn status />
	</cffunction>
    
	<cffunction name="saveAgendaItem" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="AgendaID" required="no" type="string" default="">
		<cfargument name="Description" required="yes" type="string" default="">
		<cfargument name="EventDate" required="yes" type="string" default="">
		<cfargument name="StartTime" required="yes" type="string" default="">
		<cfargument name="EndTime" required="yes" type="string" default="">
		
		<cfset var Status = "">
		
		<cfif Status EQ "">
			<cfset AgendaBean = CreateObject("component","#Application.Settings.Com#Agenda.Agenda").init(ActivityID=Arguments.ActivityID)>

			<cfif isNumeric(Arguments.AgendaID)>
				<cfset AgendaBean.setAgendaID(Arguments.AgendaID)>
			<cfelse>
				<cfset AgendaBean.setAgendaID(0)>
			</cfif>
			
			<cfset AgendaBean.setDescription(Arguments.Description)>
			<cfset AgendaBean.setEventDate(Arguments.EventDate)>
			<cfset AgendaBean.setStartTime(Arguments.StartTime)>
			<cfset AgendaBean.setEndTime(Arguments.EndTime)>
			<cfset AgendaBean.setCreatedBy(session.currentuser.id)>
            <cfset AgendaBean.setDeletedFlag("N")>
			
			<cfset Application.Com.AgendaDAO.Save(AgendaBean)>
			
			<!--- ACTIVITY DETAIL --->
			<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
			<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
			
            <cfsavecontent variable="OutputVar">
            	<strong>Description:</strong> #Arguments.Description#<br />
            	<strong>Event Date:</strong> #Arguments.EventDate#<br />
            	<strong>Event Time:</strong> #Arguments.StartTime# - #Arguments.EndTime#
            </cfsavecontent>
            
			<!--- ACTION UPDATER --->
			<cfset Application.History.Add(
						HistoryStyleID=3,
						FromPersonID=session.currentuser.id,
						ToActivityID=Arguments.ActivityID,
						ToContent=OutputVar)>
			
			<cfset Status = "Success|Agenda Item successfully saved.">
		</cfif>
		
		<cfreturn Status />
	</cffunction>
    
	<cffunction name="saveCategory" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="CategoryID" required="yes" type="string">
		
		<cfset Status = "">
		
		<cfif Arguments.CategoryID EQ "" OR  Arguments.ActivityID EQ "">
			<cfset Status = "Fail|More information is required to add this Category .">
		</cfif>
		
		<!--- CAT INFO --->
		<cfset CatBean = CreateObject("component","#Application.Settings.Com#Category.Category").init(CategoryID=Arguments.CategoryID)>
		<cfset CatBean = Application.Com.CategoryDAO.read(CatBean)>
		
		<!--- ACTIVITY INFO --->
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<cfif Status EQ "">
			<cftry>
				<cfquery name="qFindCategory" datasource="#Application.Settings.DSN#">
					SELECT DeletedFlag
					FROM ce_Activity_Category
					WHERE CategoryID = <cfqueryparam value="#Arguments.CategoryID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
				</cfquery>
				
				<cfif qFindCategory.RecordCount LTE 0>
					<cfquery name="addCategory" datasource="#Application.Settings.DSN#">
						INSERT INTO ce_Activity_Category
							(
							ActivityID,
							CategoryID,
							CreatedBy
							)
							VALUES
							(
							<cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />,
							<cfqueryparam value="#Arguments.CategoryID#" CFSQLType="cf_sql_integer" />,
							<cfqueryparam value="#session.currentuser.id#" CFSQLType="cf_sql_integer" />
							)
					</cfquery>
					
					<!--- PERSONALIZED CONTAINER LIST --->
					<cfif Arguments.CategoryID GT 0>
						<cfif NOT ListFind(Cookie.USER_Containers,Arguments.CategoryID,",")>
							<cfcookie name="Settings.Containers" value="#ListSort(ListAppend(Cookie.USER_Containers,Arguments.CategoryID,','),'textnocase')#">
						</cfif>
					</cfif>
					
                    <!--- ADD HISTORY ITEM --->
					<cfset Application.History.Add(
                                HistoryStyleID=13,
                                FromPersonID=session.currentuser.id,
                                ToActivityID=Arguments.ActivityID,
								ToContainerID=Arguments.CategoryID)>
					
					<!--- UPDATE CAT STATS --->
					<cfset CatBean.setActivityCount(CatBean.getActivityCount()+1)>
					<cfset Application.Com.CategoryDAO.Update(CatBean)>
					
					<cfset Status = "Success|Category has been added.">
				<cfelse>
					<!--- Checks if there was a record for the person already --->
					<cfif qFindCategory.RecordCount EQ 1 AND qFindCategory.DeletedFlag EQ 'Y'>
						<!--- If a record exists but DeletedFlag EQ Y then it is updated to N --->
						<cfquery name="qUpdateDeletedFlag" datasource="#Application.Settings.DSN#">
							UPDATE ce_Activity_Category
							SET DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />,
								UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" />
							WHERE CategoryID = <cfqueryparam value="#CategoryID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
						</cfquery>
                        
						<!--- ADD HISTORY ITEM --->
                        <cfset Application.History.Add(
                                    HistoryStyleID=13,
                                    FromPersonID=session.currentuser.id,
                                    ToActivityID=Arguments.ActivityID,
                                    ToContainerID=Arguments.CategoryID)>
						
						<!--- UPDATE CAT STATS --->
						<cfset CatBean.setActivityCount(CatBean.getActivityCount()+1)>
						<cfset Application.Com.CategoryDAO.Update(CatBean)>
						
						<cfset Status = "Success|Category has been added.">
					<cfelse>
						<cfset Status = "Fail|Category has already been added.">
					</cfif>
				</cfif>
				<cfcatch type="any">
					<cfset Status = "Fail|Error: #cfcatch.message#">
				</cfcatch>
			</cftry>
		</cfif>
		
		<cfreturn Status />
	</cffunction>

	<cffunction name="saveNote" access="Public" output="true" returntype="struct">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="NoteBody" required="true" type="string">
		<cfargument name="NoteID" required="false" default="0">
      	
        <cfset var Status = createObject("component","#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot save activity note for unknown reasons.")>
		
		<cfif Arguments.NoteBody EQ "">
			<cfset status.setStatusMsg("More Information is needed to add this note.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<cfset ActivityNoteBean = CreateObject("component","#Application.Settings.Com#ActivityNote.ActivityNote").Init(NoteID=Arguments.NoteID,ActivityID=Arguments.ActivityID,Body=Arguments.NoteBody,CreatedBy=session.currentuser.id)>
        
        <cfset aErrors = ActivityNoteBean.Validate()>
        
        <cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
            <cfset status.addError(aErrors[i].field,aErrors[i].Message)>
        </cfloop>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
            <cftry>
                <cfset ActivityNoteBean = Application.Com.ActivityNoteDAO.Save(ActivityNoteBean)>
            
                <!--- ADD HISTORY ITEM --->
                <cfset Application.History.Add(
                            HistoryStyleID=48,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=Arguments.NoteBody)>
                
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("The note has been added.")>
                
                <cfcatch type="any">
                    <cfset status.addError("General","Error: " & cfcatch.Message)>
                </cfcatch>
            </cftry>
        </cfif>
        
		<cfreturn status />
	</cffunction>
    
    <cffunction name="startActivity" hint="LMS Function that starts the activity for the user // creates Attendee Record in Activity" access="Public" output="true" returntype="string">
    	<cfargument name="ActivityID" type="string" required="true" />
    	<cfargument name="PersonID" type="string" required="true" />
		<cfargument name="Mode" type="string" required="false" default="" />      
		<cfargument name="DegreeID" type="string" required="false" default="" />  
		<cfargument name="BillPhone" type="string" required="false" default="" />
		<cfargument name="BillAddr1" type="string" required="false" default="" />
		<cfargument name="BillAddr2" type="string" required="false" default="" />
		<cfargument name="BillCity" type="string" required="false" default="" />
		<cfargument name="BillState" type="string" required="false" default="" />
		<cfargument name="BillZipCode" type="string" required="false" default="" />
		<cfargument name="CardName" type="string" required="false" default="" />
		<cfargument name="CardNumber" type="string" required="false" default="" />
		<cfargument name="CardType" type="string" required="false" default="" />
		<cfargument name="CardExpireMonth" type="string" required="false" default="" />
		<cfargument name="CardExpireYear" type="string" required="false" default="" />
        
        <cfset var Status = "">
        <!--- GET ATTENDEE INFO --->
		<cfset AttendeeBean = createobject("component","#Application.Settings.Com#Attendee.Attendee").Init(ActivityID=Arguments.ActivityID,PersonID=Arguments.PersonID)>
        <cfset AttendeeExists = Application.Com.AttendeeDAO.Exists(AttendeeBean)>
        
        <!--- CHECK IF USER IS AN ATTENDEE --->
        <cfif NOT AttendeeExists>
        	<!--- CREATE PERSON DEGREE RECORD --->
        	<cfif Arguments.Mode EQ "Degree" AND DegreeID NEQ "">
				<cfset PersonDegreeBean = CreateObject("component","#Application.Settings.Com#PersonDegree.PersonDegree").Init(PersonID=Arguments.PersonID,DegreeID=Arguments.DegreeID,DeletedFlag="N")>
                <cfset PersonDegreeSaved = Application.Com.PersonDegreeDAO.Save(PersonDegreeBean)>
            </cfif>
            
            <!--- GET PERSON DEGREE INFO --->
        	<cfset qPersonDegree = Application.Com.PersonDegreeGateway.getByAttributes(PersonID=Arguments.PersonID,DeletedFlag="N")>
            
            <cfif qPersonDegree.RecordCount GT 0>
				<!--- USER IS NOT AN ATTENDEE --->
                <!--- GET PUB GENERAL INFO --->
                <cfset ActivityPubGeneral = createobject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").Init(ActivityID=Arguments.ActivityID)>
                <cfset ActivityPubGeneral = Application.Com.ActivityPubGeneralDAO.Read(ActivityPubGeneral)>
                
                <!--- CHECK IF TERMS OR PAYMENT IS NEEDED --->
                <cfset PaymentNeeded = ActivityPubGeneral.getPaymentFlag()>
                <cfset TermsNeeded = ActivityPubGeneral.getTermsFlag()>
            	
        
                <cfset AttendeeBean.setActivityID(Arguments.ActivityID)>
                <cfset AttendeeBean.setPersonID(Arguments.PersonID)>
                <cfset AttendeeBean.setCheckIn(DateFormat(Now(),"MM/DD/YYYY") & " " & TimeFormat(Now(), "hh:mm:ssTT"))>
                <cfset AttendeeBean.setRegisterDate(DateFormat(Now(),"MM/DD/YYYY") & " " & TimeFormat(Now(), "hh:mm:ssTT"))>
                <cfset AttendeeBean.setCreatedBy(Arguments.PersonID)>
                <!--- SET TERMS FLAG --->
                <cfif TermsNeeded EQ "N">
                    <cfset AttendeeBean.setTermsFlag("Y")>
                <cfelse>
                    <cfset AttendeeBean.setTermsFlag("N")>
                </cfif>
                <!--- SET PAYMENT FLAG --->
                <cfif PaymentNeeded EQ "N">
                    <cfset AttendeeBean.setPaymentFlag("Y")>
                <cfelse>
                    <cfset AttendeeBean.setPaymentFlag("N")>
                </cfif>
                
                <!--- CHECK IF MD --->
                <cfif isMD(personId=Arguments.PersonID)>
                    <cfset AttendeeBean.setMDFlag("Y")>
                <cfelse>
                    <cfset AttendeeBean.setMDFlag("N")>
                </cfif>
                
                <!--- SET STATUS --->
                <cfif TermsNeeded EQ "Y">
                    <cfset AttendeeBean.setStatusID("5")> <!--- PENDING STATUS --->
                    <cfset Status = "Fail|Terms">
                <cfelseif PaymentNeeded EQ "Y">
                    <cfset AttendeeBean.setStatusID("5")> <!--- PENDING STATUS --->
                    <cfset Status = "Fail|Payment">
                <cfelse>
                    <cfset AttendeeBean.setStatusID("2")> <!--- IN PROGRESS STATUS --->
                    <cfset Status = "Success|You have registered for this activity.">
                </cfif>
                
                <!--- SAVE ATTENDEE RECORD --->
                <cfset NewAttendeeID = Application.Com.AttendeeDAO.Create(AttendeeBean)>
                
                <!--- CREATE ATTENDEE CREDIT RECORD // ONLY SAVES WHEN THERE IS NO RECORD --->
                <cfset AttendeeCreditCreated = Application.ActivityAttendee.setAttendeeCredit(ActivityID=Arguments.ActivityID,AttendeeID=NewAttendeeID,PersonID=Arguments.PersonID)>
            <cfelse>
            	<cfset Status = "Fail|Degree">
            </cfif>
        <cfelse>
        	<!--- USER IS AN ATTENDEE --->
			<!--- GET PUB GENERAL INFO --->
			<cfset ActivityPubGeneral = createobject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").Init(ActivityID=Arguments.ActivityID)>
			<cfset ActivityPubGeneral = Application.Com.ActivityPubGeneralDAO.Read(ActivityPubGeneral)>
			
            <!--- GET ATTENDEE INFO --->
            <cfset AttendeeBean = Application.Com.AttendeeDAO.Read(AttendeeBean)>
            
            <cfset CurrAttendeeID = AttendeeBean.getAttendeeID()>
            <cfset AttendeeBean.setDeletedFlag("N")>
            <cfset AttendeeBean.setUpdated(Now())>
            <cfset AttendeeBean.setUpdatedBy(session.currentuser.id)>
            
            <!--- CHECK IF ATTENDEE ACCEPTED TERMS --->
            <cfif AttendeeBean.getTermsFlag() EQ "N">
            	<cfif Arguments.Mode EQ "Terms">
                	<cfset AttendeeBean.setTermsFlag("Y")>
                	<cfset Status = "Fail|Payment">
                <cfelse>
                	<cfset Status = "Fail|Terms">
                </cfif>
            <!--- CHECK IF ATTENDEE ACCEPTED PAYMENT --->
            <cfelseif AttendeeBean.getPaymentFlag() EQ "N">
            	<cfif Arguments.Mode EQ "Payment">
					<!--- PROCESS PAYMENT --->
					<cfset PayStatus = createobject("component","#Application.Settings.Com#Payment").ProcessPayment(
																								ActivityID=Arguments.ActivityID,
																								AttendeeID=AttendeeBean.getAttendeeID(),
																								Phone=Arguments.BillPhone,
																								Address1=Arguments.BillAddr1,
																								Address2=Arguments.BillAddr2,
																								City=Arguments.BillCity,
																								State=Arguments.BillState,
																								ZipCode=Arguments.BillZipCode,
																								CardName=Arguments.CardName,
																								CardNumber=Arguments.CardNumber,
																								CardType=Arguments.CardType,
																								CardExpireMonth=Arguments.CardExpireMonth,
																								CardExpireYear=Arguments.CardExpireYear
																								)>
					
					<cfif PayStatus>
						<!--- SUCCESS PAYMENT --->
						<cfset AttendeeBean.setPaymentFlag('Y')>
						<cfset AttendeeBean.setPayAmount(ActivityPubGeneral.getPaymentFee())>
						<cfset AttendeeBean.setPayOrderNo(AttendeeBean.getAttendeeID())>
						<cfset AttendeeBean.setPaymentDate(now())>
					<cfelse>
                		<cfset Status = "Fail|Payment|Card could not be authorized or was declined.  Please check the information you entered and try again.">
					</cfif>
					<!---<cfset AttendeeBean.setPaymentFlag("Y")>--->
                <cfelse>
					
                	<cfset Status = "Fail|Payment">
                </cfif>
            </cfif>
            
            <!--- CHECK IF BOTH TERMS AND PAYMENTS HAVE BEEN ACCEPTED --->
            <cfif AttendeeBean.getTermsFlag() EQ "Y" AND AttendeeBean.getPaymentFlag() EQ "Y">
            	<cfset AttendeeBean.setStatusID(2)>
				<cfset Status = "Success|You have registered for this activity.">
            </cfif>
			<cfif ListGetAt(status,1,'|') EQ "Success">
				<!--- UPDATE ATTENDEE RECORD --->
				<cfset attendeeSaved = Application.Com.AttendeeDAO.Save(AttendeeBean)>
				
				<cfif isNumeric(attendeeSaved) OR attendeeSaved>
					<cfset Status = "Success|You have registered for this activity.">
					
					<!--- ADD HISTORY ITEM --->
					<cfset Application.History.Add(
								HistoryStyleID=20,
								FromPersonID=Arguments.PersonID,
								ToActivityID=Arguments.ActivityID)>
						
					<!--- CREATE ATTENDEE CREDIT RECORD // ONLY SAVES WHEN THERE IS NO RECORD --->
					<cfset AttendeeCreditCreated = Application.ActivityAttendee.setAttendeeCredit(ActivityID=Arguments.ActivityID,AttendeeID=CurrAttendeeID,PersonID=Arguments.PersonID)>
				</cfif>
			</cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="updateActivityStats" hint="Updates activity's stats for provided attendee." access="Public" output="false">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="AttendeeId" type="numeric" required="no" default="0">
        <cfargument name="PersonID" type="numeric" required="no" default="0">
        <cfargument name="Type" type="string" required="yes">
        
        <cfset var Status = false>
        <cfset var MDFlag = false>
        <!---
		ARGUMENTS.TYPE DETERMINES IF THE ATTENDEE IS BEING ADDED OR REMOVED
		NOTE: THE TWO TYPES THAT CAN BE USED ARE:
		1. ADD
		2. REMOVE
		--->
        
        <cfif Arguments.Type EQ "Add">
			<!--- GET ACTIVITY INFO --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
            
            <cfif Application.Com.ActivityDAO.Exists(ActivityBean)>
                <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
                
                <!--- CHECK PERSON MD STATUS --->
                <cfif arguments.personId GT 0>
                	<cfset MDFlag = isMD(personId=Arguments.PersonID)>
                <cfelse>
                	<cfset MDFlag = isMD(attendeeId=Arguments.AttendeeId)>
                </cfif>
                
                <!--- UPDATE ACTIVITY STATS --->
                <cfset ActivityBean.setStatAttendees(ActivityBean.getStatAttendees() + 1)>
                
                <cfif MDFlag>
                    <cfset ActivityBean.setStatMD(ActivityBean.getStatMD() + 1)>
                <cfelse>
                    <cfset ActivityBean.setStatNonMD(ActivityBean.getStatNonMD() + 1)>
                </cfif>
                    
                <!--- SAVE ACTIVITY INFO --->
                <cfset ActivitySaved = Application.Com.ActivityDAO.Update(ActivityBean)>
                
                <!--- UPDATE RETURN STATUS --->
                <cfif ActivitySaved>
                    <cfset Status = true>
                </cfif>
                
                <cfif ActivityBean.getParentActivityID() NEQ "">
                    <!--- GET PARENT ACTIVITY INFO --->
                    <cfset ParentActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=ActivityBean.getParentActivityID())>
                    <cfset ParentActivityBean = Application.Com.ActivityDAO.Read(ParentActivityBean)>
                    
                    <!--- UPDATE PARENT ACTIVITY STATS --->
                    <cfset ParentActivityBean.setStatAttendees(ParentActivityBean.getStatAttendees() + 1)>
                        
                    <cfif MDFlag>
                        <cfset ParentActivityBean.setStatMD(ParentActivityBean.getStatMD() + 1)>
                    <cfelse>
                        <cfset ParentActivityBean.setStatNonMD(ParentActivityBean.getStatNonMD() + 1)>
                    </cfif>
                    
                    <!--- SAVE PARENT ACTIVITY INFO --->
                    <cfset ParentActivitySaved = Application.Com.ActivityDAO.Update(ParentActivityBean)>
                
                    <!--- UPDATE RETURN STATUS --->
                    <cfif ParentActivitySaved>
                        <cfset Status = true>
                    </cfif>
                </cfif>
            </cfif>
        <cfelseif Arguments.Type EQ "Remove">
			<!--- GET ACTIVITY INFO --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
            
            <cfif Application.Com.ActivityDAO.Exists(ActivityBean)>
                <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
                
                <!--- CHECK PERSON MD STATUS --->
                <cfset MDFlag = isMD(personId=Arguments.PersonID)>
                
                <!--- UPDATE ACTIVITY STATS --->
                <cfset ActivityBean.setStatAttendees(ActivityBean.getStatAttendees() - 1)>
                
                <cfif MDFlag>
                    <cfset ActivityBean.setStatMD(ActivityBean.getStatMD() - 1)>
                <cfelse>
                    <cfset ActivityBean.setStatNonMD(ActivityBean.getStatNonMD() - 1)>
                </cfif>
                    
                <!--- SAVE ACTIVITY INFO --->
                <cfset ActivitySaved = Application.Com.ActivityDAO.Update(ActivityBean)>
                
                <!--- UPDATE RETURN STATUS --->
                <cfif ActivitySaved>
                    <cfset Status = true>
                </cfif>
                
                <cfif ActivityBean.getParentActivityID() NEQ "">
                    <!--- GET PARENT ACTIVITY INFO --->
                    <cfset ParentActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=ActivityBean.getParentActivityID())>
                    <cfset ParentActivityBean = Application.Com.ActivityDAO.Read(ParentActivityBean)>
                    
                    <!--- UPDATE PARENT ACTIVITY STATS --->
                    <cfset ParentActivityBean.setStatAttendees(ParentActivityBean.getStatAttendees() - 1)>
                        
                    <cfif MDFlag>
                        <cfset ParentActivityBean.setStatMD(ParentActivityBean.getStatMD() - 1)>
                    <cfelse>
                        <cfset ParentActivityBean.setStatNonMD(ParentActivityBean.getStatNonMD() - 1)>
                    </cfif>
                    
                    <!--- SAVE PARENT ACTIVITY INFO --->
                    <cfset ParentActivitySaved = Application.Com.ActivityDAO.Update(ParentActivityBean)>
                
                    <!--- UPDATE RETURN STATUS --->
                    <cfif ParentActivitySaved>
                        <cfset Status = true>
                    </cfif>
                </cfif>
            </cfif>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
    <cffunction name="updateAddlAttendees" access="Public" output="false" returntype="any">
    	<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="AddlAttendees" type="string" required="true" />
        
        <cfset var Status = "">
        
        <cfif Arguments.ActivityID EQ "">
        	<cfset Status = "Fail|More information is required to update the additional amount of attendees.">
        </cfif>
        
        <cfif Status EQ "">
        	<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
            
            <!--- CHECK IF MAX REGISTRANTS IS BLANK --->
            <cfif Arguments.AddlAttendees EQ "">
            	<cfset Arguments.AddlAttendees = 0>
            </cfif>
            
            <cfset ActivityBean.setStatAddlAttendees(Arguments.AddlAttendees)>
            <cfset ActivityBean = Application.Com.ActivityDAO.Save(ActivityBean)>
            
            <cfset Status = "Success|Additional attendees has been updated.">
                        
			<!--- ADD HISTORY ITEM --->
            <cfset Application.History.Add(
                        HistoryStyleID=92,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID,
						ToContent="Additional Attendees:" & Arguments.AddlAttendees)>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
    
	<cffunction name="updateApplicationValue" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="Field" required="yes" type="string"> <!--- "Received, Sent, Approved, etc." --->
		<cfargument name="Flag" required="yes" type="string">
		<cfargument name="AppDate" required="yes" type="string">
		
		<cfset var Status = "Success|#Arguments.Field# marked successfully.">
		
		<!--- CHECK DATE --->
		<cfif Arguments.Flag EQ "Y" AND NOT isDate(Arguments.AppDate)>
			<cfset Status = "Failed|Invalid date for #Arguments.Field#.">
		</cfif>
		
		<cfif GetToken(Status,1,"|") NEQ "Failed">
			<cftry>
				<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
				<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
				
				<cfif Arguments.Flag EQ "Y">
					<cfquery name="qSet" datasource="#Application.Settings.DSN#">
						UPDATE ce_Activity_Application
						SET #Arguments.Field#Flag='Y',
							#Arguments.Field#Date=<cfqueryparam value="#Arguments.AppDate#" cfsqltype="cf_sql_date" />
						WHERE ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
					</cfquery>
					
					<cfset Application.History.Add(
								HistoryStyleID=5,
								FromPersonID=session.currentuser.id,
								ToActivityID=Arguments.ActivityID)>
				<cfelse>
					<cfquery name="qSet" datasource="#Application.Settings.DSN#">
						UPDATE ce_Activity_Application
						SET #Arguments.Field#Flag='N',
							#Arguments.Field#Date=<cfqueryparam null />
						WHERE ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" />
					</cfquery>
					
					<cfset Application.History.Add(
								HistoryStyleID=5,
								FromPersonID=session.currentuser.id,
								ToActivityID=Arguments.ActivityID)>
				</cfif>
				
				<cfcatch>
					<cfset Status = "Failed|Marking #Arguments.Field# failed due to critical error.">
				</cfcatch>
			</cftry>
		</cfif>
		
		
		<cfreturn Status />
	</cffunction>
    
    <cffunction name="updateMaxRegistrants" access="Public" output="false" returntype="any">
    	<cfargument name="ActivityID" type="string" required="true" />
        <cfargument name="MaxRegistrants" type="string" required="true" />
        
        <cfset var Status = "">
        
        <cfif Arguments.ActivityID EQ "">
        	<cfset Status = "Fail|More information is required to update the maximum amount of registrants.">
        </cfif>
        
        <cfif Status EQ "">
        	<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
            
            <!--- CHECK IF MAX REGISTRANTS IS BLANK --->
            <cfif Arguments.MaxRegistrants EQ "">
            	<cfset Arguments.MaxRegistrants = 0>
            </cfif>
            
            <cfset ActivityBean.setStatMaxRegistrants(Arguments.MaxRegistrants)>
            <cfset ActivityBean = Application.Com.ActivityDAO.Save(ActivityBean)>
            
            <cfset Status = "Success|Maximum registrants has been updated.">
                        
			<!--- ADD HISTORY ITEM --->
            <cfset Application.History.Add(
                        HistoryStyleID=94,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID,
						ToContent="Additional Attendees:" & Arguments.AddlAttendees)>
        </cfif>
        
        <cfreturn Status />
    </cffunction>
	
	<cffunction name="updateStatus" access="Public" output="no" displayname="Set Activity Status">
		<cfargument name="ActivityID" type="numeric" required="yes" />
		<cfargument name="StatusID" type="numeric" required="yes" />
		
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<cfset ActivityBean.setStatusID(Arguments.StatusID)>
        
        <cfswitch expression="#Arguments.StatusID#">
        	<cfcase value="1">
				<!--- ADD HISTORY ITEM // ACTIVE --->
                <cfset Application.History.Add(
                            HistoryStyleID=56,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID)>
            </cfcase>
        	<cfcase value="2">
				<!--- ADD HISTORY ITEM // PENDING --->
                <cfset Application.History.Add(
                            HistoryStyleID=57,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID)>
            </cfcase>
        	<cfcase value="3">
				<!--- ADD HISTORY ITEM // ENDED --->
                <cfset Application.History.Add(
                            HistoryStyleID=58,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID)>
            </cfcase>
        	<cfcase value="4">
				<!--- ADD HISTORY ITEM // CANCELED --->
                <cfset Application.History.Add(
                            HistoryStyleID=59,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID)>
            </cfcase>
        </cfswitch>
		
		<cfset Application.Com.ActivityDAO.Update(ActivityBean)>
		
		<cfreturn "success" />
	</cffunction>
</cfcomponent>