<cfcomponent hint="Faculty/Committed [Attendee Functions are kept in ActivityAttendee.CFC]">
	<cffunction name="init" access="public" output="no" returntype="_com.Public_ActivityPeople">
		<cfreturn this />
	</cffunction>

	<cffunction name="approveFacultyFile" access="Public" output="true" returntype="struct">
		<cfargument name="facultyId" required="true" type="string">
        <cfargument name="FileType" required="true" type="string">
        <cfargument name="Mode" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot approve faculty file for unknown reasons.")>
        
    	<cfif Arguments.facultyId EQ "" OR Arguments.FileType EQ "" OR Arguments.Mode EQ "">
        	<cfset status.setStatusMsg("More information is required.")>
            <cfreturn status />
            <cfabort>
        </cfif>
        
		<cfif Arguments.Mode EQ "Approve">
            <cfset ApproveFlag = "Y">
        <cfelse>
            <cfset ApproveFlag = "N">
        </cfif>
        
        <cftry>
            <cfif Arguments.FileType EQ "CV">
                <!--- UPDATE CVAPPROVEFLAG --->
                <cfquery name="qUpdateCVFlag" datasource="#Application.Settings.DSN#">
                    UPDATE ce_Activity_Faculty
                    SET CVApproveFlag = <cfqueryparam value="#ApproveFlag#" cfsqltype="cf_sql_char" />
                    WHERE facultyId = <cfqueryparam value="#Arguments.facultyId#" cfsqltype="cf_sql_integer" />
                </cfquery>
            <cfelseif Arguments.FileType EQ "Disclosure">
                <!--- UPDATE DISCLOSUREAPPROVEFLAG --->
                <cfquery name="qUpdateDisclosureFlag" datasource="#Application.Settings.DSN#">
                    UPDATE ce_Activity_Faculty
                    SET DisclosureApproveFlag = <cfqueryparam value="#ApproveFlag#" cfsqltype="cf_sql_char" />
                    WHERE facultyId = <cfqueryparam value="#Arguments.facultyId#" cfsqltype="cf_sql_integer" />
                </cfquery>
            </cfif>
            
            <!--- GET PERSONS NAME --->
            <cfquery name="qGetPersonName" datasource="#Application.Settings.DSN#">
                SELECT p.FirstName, p.LastName
                FROM ce_activity_faculty AS af
                INNER JOIN ce_Person AS p ON p.personId = af.personId
                WHERE af.facultyId = <cfqueryparam value="#arguments.facultyId#" cfsqltype="cf_sql_integer" />
            </cfquery>
            
            <cfif ApproveFlag EQ "Y">
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("#qGetPersonName.FirstName# #qGetPersonName.LastName#'s #Arguments.FileType# has been approved.")>
            <cfelse>
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("#qGetPersonName.FirstName# #qGetPersonName.LastName#'s #Arguments.FileType# has been unapproved.")>
            </cfif>
            
            <cfcatch type="any">
                <cfset status.addError("General","Error: " & cfcatch.Message)>
            </cfcatch>
        </cftry>
        
        <cfreturn Status />
    </cffunction>

	<cffunction name="ChangeCommitteeRoles" access="remote" output="true" returntype="struct">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="RoleID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot change committee role(s) for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.PersonList EQ "" OR Arguments.ActivityID EQ "" OR RoleID EQ "">
        	<cfset status.setStatusMsg("More information is required to update the committee roles.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>
            <cfset ChangeCount = 0>
            
            <!--- ACTIVITY DETAIL --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfswitch expression="#Arguments.RoleID#">
                <cfcase value="1">
                    <cfset RoleName = "<strong>New Role:</strong> Coordinator">
                </cfcase>
                <cfcase value="2">
                    <cfset RoleName = "<strong>New Role:</strong> Director">
                </cfcase>
                <cfcase value="3">
                    <cfset RoleName = "<strong>New Role:</strong> Speaker">
                </cfcase>
                <cfdefaultcase>
                    <cfset RoleName = "Role has been removed.">
                </cfdefaultcase>
            </cfswitch>
            
            <cfloop list="#Arguments.PersonList#" index="tempPersonID" delimiters=",">
                <!--- Delete each record --->
                <cfquery name="qUpdateRole" datasource="#Application.Settings.DSN#" result="UpdatedRole">
                    UPDATE ce_Activity_Committee
                    SET RoleID = <cfif Arguments.RoleID NEQ 0><cfqueryparam value="#Arguments.RoleID#" cfsqltype="cf_sql_integer" /><cfelse><cfqueryparam null="true" cfsqltype="cf_sql_integer" /></cfif>
                    WHERE PersonID = <cfqueryparam value="#tempPersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                </cfquery>
                >
                <!--- Count the total records being deleted --->
                <cfset ChangeCount++>
                
                <!--- PERSON ACTION UPDATER --->
                <cfset Application.History.Add(
                            HistoryStyleID=32,
                            FromPersonID=tempPersonID,
                            ToPersonID=tempPersonID,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=RoleName)>
            </cfloop>
            
            <!--- ACTIVITY ACTION UPDATER --->
            <cfif ChangeCount EQ 1>
            	<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("1 role has been changed.")>
                
                <cfset Application.History.Add(
                            HistoryStyleID=33,
                            FromPersonID=session.currentuser.id,
                            ToPersonID=Arguments.PersonList,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=RoleName)>
            <cfelse>
            	<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("#ChangeCount# roles have been changed.")>
                
                <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
                    SELECT DisplayName
                    FROM ce_Person
                    WHERE PersonID IN (#PersonList#)
                </cfquery>
                
                <cfset OutputVar = "">
                <cfloop query="PersonInfo">
                    <cfset OutputVar = ListAppend(OutputVar,Trim(PersonInfo.DisplayName),", ")>
                </cfloop>
                
                <cfset OutputVar = RoleName & "<br />" & OutputVar>
                
                <cfset Application.History.Add(
                            HistoryStyleID=34,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=OutputVar)>
            </cfif>
            
            <cfcatch type="any">
            	<cfset status.addError("General","Fail: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>

	<cffunction name="changeFacultyRoles" access="Public" output="true" returntype="struct">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="RoleID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot change faculty role(s) for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.PersonList EQ "">
			<cfset status.setStatusMsg("You must select people to update the faculty roles.")>
            <cfreturn status />
            <cfabort>
        <cfelseif Arguments.ActivityID EQ "">
			<cfset status.setStatusMsg("You must provide an activity to update the faculty roles.")>
            <cfreturn status />
            <cfabort>
		<cfelseif RoleID EQ "">
			<cfset status.setStatusMsg("You must select a role to update the faculty roles.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>
            <cfset ChangeCount = 0>
            
            <!--- ACTIVITY DETAIL --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfswitch expression="#Arguments.RoleID#">
                <cfcase value="1">
                    <cfset RoleName = "<strong>New Role:</strong> Coordinator">
                </cfcase>
                <cfcase value="2">
                    <cfset RoleName = "<strong>New Role:</strong> Director">
                </cfcase>
                <cfcase value="3">
                    <cfset RoleName = "<strong>New Role:</strong> Speaker">
                </cfcase>
                <cfdefaultcase>
                    <cfset RoleName = "Role has been removed.">
                </cfdefaultcase>
            </cfswitch>
            
            <cfloop list="#Arguments.PersonList#" index="PersonID">
                <!--- Delete each record --->
                <cfquery name="qUpdateRole" datasource="#Application.Settings.DSN#">
                    UPDATE ce_Activity_Faculty
                    SET RoleID = <cfif Arguments.RoleID NEQ 0><cfqueryparam value="#Arguments.RoleID#" cfsqltype="cf_sql_integer" /><cfelse><cfqueryparam null="true" cfsqltype="cf_sql_integer" /></cfif>
                    WHERE PersonID = <cfqueryparam value="#PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                </cfquery>
                
                <cfset Application.History.Add(
                            HistoryStyleID=27,
                            FromPersonID=session.currentuser.id,
                            ToPersonID=PersonID,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=RoleName)>
                
                <!--- Count the total records being deleted --->
                <cfset ChangeCount++>
            </cfloop>
            
			<!--- ACTIVITY ACTION UPDATER --->
            <cfif ChangeCount EQ 1>
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("1 role has been changed.")>
                
                <cfset Application.History.Add(
                            HistoryStyleID=25,
                            FromPersonID=session.currentuser.id,
                            ToPersonID=Arguments.PersonList,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=RoleName)>
            <cfelse>
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("#ChangeCount# roles have been changed.")>
                
                <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
                    SELECT DisplayName
                    FROM ce_Person
                    WHERE PersonID IN (#PersonList#)
                </cfquery>
                
                <cfset OutputVar = "">
                <cfloop query="PersonInfo">
                    <cfset OutputVar = ListAppend(OutputVar,Trim(PersonInfo.DisplayName),", ")>
                </cfloop>
                
                <cfset OutputVar = RoleName & "<br />" & OutputVar>
                
                <cfset Application.History.Add(
                            HistoryStyleID=26,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=OutputVar)>
            </cfif>
            
            <cfcatch type="any">
                <cfset status.addError("General","Error: " & cfcatch.Message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>
    
    <cffunction name="getCertType" hint="Returns the type of certificate to use for the provided activity and provided user." access="Public" output="false" returntype="string">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="PersonID" type="numeric" required="yes">
        
        <cfset var CertType = "">
        
        <!--- GET CREDIT OFFERED FOR ACTIVITY --->
        <cfquery name="ActivityCreditInfo" datasource="#Application.Settings.DSN#">
            SELECT 
                AC.CreditID,
                SC.Name AS CreditName
            FROM
                ce_Activity_Credit AC
            INNER JOIN ce_Sys_Credit SC ON SC.CreditID = AC.CreditID
            WHERE
                ActivityID = <cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND AC.DeletedFlag = 'N'
        </cfquery>
        
        <!--- GET PERSON DEGREE INFORMATION --->
        <cfquery name="PersonDegreeInfo" datasource="#Application.Settings.DSN#">
            SELECT
                PD.DegreeID,
                SD.Name AS DegreeName
            FROM
                ce_Person_Degree PD
            INNER JOIN
                ce_Sys_Degree SD ON SD.DegreeID = PD.DegreeID
            WHERE
                PD.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND PD.DeletedFlag = 'N'
        </cfquery>
        
        <cfif PersonDegreeInfo.RecordCount EQ 0>
        	<cfquery name="PersonDegreeInfo" datasource="#Application.Settings.DSN#">
            	SELECT
                	PD.DegreeID,
                    SD.Name AS DegreeName
                FROM
                	ce_Person_Degree PD
                INNER JOIN 
                	ce_Sys_Degree SD ON SD.DegreeID = PD.DegreeID
                WHERE
                	PD.PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" />
            </cfquery>
        </cfif>
        
        <cfif PersonDegreeInfo.RecordCount GT 0>
			<cfif PersonDegreeInfo.DegreeName EQ "MD" OR PersonDegreeInfo.DegreeName EQ "DO">
                <cfloop query="ActivityCreditInfo">
					<cfif ActivityCreditInfo.CreditName EQ "CME">
                        <cfset CertType = "1|CME">
                    </cfif>
                </cfloop>
            <cfelseif PersonDegreeInfo.DegreeName EQ "RN">
                <cfloop query="ActivityCreditInfo">
					<cfif ActivityCreditInfo.CreditName EQ "CNE">
                        <cfset CertType = "2|CNE">
                    </cfif>
                </cfloop>
            <cfelseif PersonDegreeInfo.DegreeName EQ "PharmD">
                <cfloop query="ActivityCreditInfo">
					<cfif ActivityCreditInfo.CreditName EQ "CPE">
                        <cfset CertType = "3|CPE">
                    </cfif>
                </cfloop>
            <cfelse>
                <cfset CertType = "1|CME">
            </cfif>
        </cfif>
        
		<cfif CertType EQ "">
        	<cfset CertType = "1|CME">
        </cfif>
        
        <cfreturn CertType />
    </cffunction>

	<cffunction name="removeAllCommittee" access="remote" output="true" returntype="struct">
		<cfargument name="ActivityID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot remove all committee members for unknown reasons.")>
		
		<!--- Check to make sure the Argument var is not blank --->
		<cfif Arguments.ActivityID EQ "">
        	<cfset status.setStatusMsg("More information is required to remove all committee members from this activity.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>				
            <!--- Delete each record --->
            <cfquery name="qRemoveAll" datasource="#Application.Settings.DSN#">
                UPDATE ce_Activity_Committee
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />
                WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
            </cfquery>
            
            <!--- ACTIVITY DETAIL --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <!--- ACTION UPDATER --->
            <cfset Application.History.Add(
                        HistoryStyleID=68,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID)>
            
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("All committee members have been removed.")>
            
            <cfcatch type="any">
       			<cfset status.setStatusMsg("Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn Status />
	</cffunction>

	<cffunction name="removeAllFaculty" access="Public" output="true" returntype="struct">
		<cfargument name="ActivityID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot remove all faculty for unknown reasons.")>
		
		<!--- Check to make sure the Argument var is not blank --->
		<cfif Arguments.ActivityID EQ "">
        <cfset status.setStatusMsg("More information is required to remove all faculty members from this activity.")>
		</cfif>
		
        <cftry>				
            <!--- Delete each record --->
            <cfquery name="qRemoveAll" datasource="#Application.Settings.DSN#">
                UPDATE ce_Activity_Faculty
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                    UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_char" />
                WHERE ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
            </cfquery>
            
            <!--- ACTIVITY DETAIL --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("All faculty members have been removed.")>
            
            <!--- ACTION UPDATER --->
            <cfset Application.History.Add(
                        HistoryStyleID=65,
                        FromPersonID=session.currentuser.id,
                        ToActivityID=Arguments.ActivityID)>
            
            <cfcatch type="any">
                <cfset status.setStatusMsg("Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>

	<cffunction name="removeCheckedCommittee" access="remote" output="true" returntype="struct">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot remove selected committee members for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.PersonList EQ "" OR Arguments.ActivityID EQ "">
	        <cfset status.setStatusMsg("More information is required to remove the selected committee members.")>
	        <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>
            <cfset AddCount = 0>
            
            <!--- ACTIVITY DETAIL --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfloop list="#Arguments.PersonList#" index="PersonID">
                <!--- Delete each record --->
                <cfquery name="qRemoveChecked" datasource="#Application.Settings.DSN#">
                    UPDATE ce_Activity_Committee
                    SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />
                    WHERE PersonID = <cfqueryparam value="#PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                </cfquery>
                
                <!--- Count the total records being deleted --->
                <cfset AddCount++>
                
                <!--- PERSON ACTION UPDATER --->
                <cfset Application.History.Add(
                            HistoryStyleID=17,
                            FromPersonID=PersonID,
                            ToPersonID=PersonID,
                            ToActivityID=Arguments.ActivityID)>
            </cfloop>
            
            <cfif AddCount EQ 1>
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("1 person has been removed.")>
                
                <cfset Application.History.Add(
                            HistoryStyleID=16,
                            FromPersonID=session.currentuser.id,
                            ToPersonID=Arguments.PersonList,
                            ToActivityID=Arguments.ActivityID)>
            <cfelse>
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg(AddCount & " people have been removed.")>
                
                <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
                    SELECT DisplayName
                    FROM ce_Person
                    WHERE PersonID IN (#PersonList#)
                </cfquery>
                
                <cfset OutputVar = "">
                <cfloop query="PersonInfo">
                    <cfset OutputVar = ListAppend(OutputVar,Trim(PersonInfo.DisplayName),", ")>
                </cfloop>
                
                <cfset Application.History.Add(
                            HistoryStyleID=15,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=OutputVar)>
            </cfif>
            
            <cfcatch type="any">
                <cfset status.setStatusMsg("Error: " &cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>

	<cffunction name="removeCheckedFaculty" access="Public" output="true" returntype="struct">
		<cfargument name="PersonList" required="true" type="string">
		<cfargument name="ActivityID" required="true" type="string">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot remove selected faculty members for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.PersonList EQ "" OR Arguments.ActivityID EQ "">
       		<cfset status.setStatusMsg("More information is required to remove the selected members.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
		<!--- ACTIVITY DETAIL --->
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
        <cftry>
            <cfset AddCount = 0>
            
            <cfloop list="#Arguments.PersonList#" index="PersonID">
                <!--- Delete each record --->
                <cfquery name="qRemoveChecked" datasource="#Application.Settings.DSN#">
                    UPDATE ce_Activity_Faculty
                    SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />,
                        UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_char" />
                    WHERE PersonID = <cfqueryparam value="#PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                </cfquery>
                
                <!--- Count the total records being deleted --->
                <cfset AddCount++>
                
                <!--- PERSON ACTION UPDATER --->
                <cfset Application.History.Add(
                            HistoryStyleID=45,
                            FromPersonID=PersonID,
                            ToPersonID=PersonID,
                            ToActivityID=Arguments.ActivityID)>
            </cfloop>
            
            <!--- ACTIVITY ACTION UPDATER --->
            <cfif AddCount EQ 1>
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg("1 faculty has been removed.")>
                
                <cfset Application.History.Add(
                            HistoryStyleID=44,
                            FromPersonID=session.currentuser.id,
                            ToPersonID=Arguments.PersonList,
                            ToActivityID=Arguments.ActivityID)>
            <cfelse>
                <cfset status.setStatus(true)>
                <cfset status.setStatusMsg(AddCount & " faculty have been removed.")>
                
                <cfquery name="PersonInfo" datasource="#Application.Settings.DSN#">
                    SELECT DisplayName
                    FROM ce_Person
                    WHERE PersonID IN (#PersonList#)
                </cfquery>
                
                <cfset OutputVar = "">
                <cfloop query="PersonInfo">
                    <cfset OutputVar = ListAppend(OutputVar,Trim(PersonInfo.DisplayName),", ")>
                </cfloop>
                
                <cfset Application.History.Add(
                            HistoryStyleID=64,
                            FromPersonID=session.currentuser.id,
                            ToActivityID=Arguments.ActivityID,
                            ToContent=OutputVar)>
            </cfif>
            
            <cfcatch type="any">
                <cfset status.setStatusMsg("Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>
    
	<cffunction name="saveCommitteeMember" access="remote" output="true" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="PersonID" required="yes" type="string">
		
		<cfset Status = "">
		
		<cfif Arguments.PersonID EQ "" OR  Arguments.ActivityID EQ "">
			<cfset Status = "Fail|More information is required to add this committee member.">
		</cfif>
		
		<!--- ACTIVITY DETAIL --->
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<cfif Status EQ "">
			<cftry>
				<cfquery name="qFindCommitteeMember" datasource="#Application.Settings.DSN#">
					SELECT DeletedFlag
					FROM ce_Activity_Committee
					WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
				</cfquery>
				
				<cfif qFindCommitteeMember.RecordCount LTE 0>
					<cfquery name="addCommitteeMember" datasource="#Application.Settings.DSN#">
						INSERT INTO ce_Activity_Committee
							(
							ActivityID,
							PersonID,
							DeletedFlag
							)
							VALUES
							(
							<cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />,
							<cfqueryparam value="#Arguments.PersonID#" CFSQLType="cf_sql_integer" />,
							<cfqueryparam value="N" CFSQLType="cf_sql_char" />
							)
					</cfquery>
					
					<!--- ACTION UPDATER --->
                    <cfset Application.History.Add(
								HistoryStyleID=14,
								FromPersonID=session.currentuser.id,
								ToPersonID=Arguments.PersonID,
								ToActivityID=Arguments.ActivityID)>
					
					<cfset Status = "Success|Committee member has been added.">
				<cfelse>
					<!--- Checks if there was a record for the person already --->
					<cfif qFindCommitteeMember.RecordCount EQ 1 AND qFindCommitteeMember.DeletedFlag EQ 'Y'>
						<!--- If a record exists but DeletedFlag EQ Y then it is updated to N --->
						<cfquery name="qUpdateDeletedFlag" datasource="#Application.Settings.DSN#">
							UPDATE ce_Activity_Committee
							SET DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />
							WHERE PersonID = <cfqueryparam value="#PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
							
							<!--- ACTION UPDATER --->
							<cfset Application.History.Add(
                                        HistoryStyleID=14,
                                        FromPersonID=session.currentuser.id,
                                        ToPersonID=Arguments.PersonID,
                                        ToActivityID=Arguments.ActivityID)>
							
							<cfset Status = "Success|Committee member has been added.">
						</cfquery>
					<cfelse>
						<cfset Status = "Fail|Committee member has already been added.">
					</cfif>
				</cfif>
				<cfcatch type="any">
					<cfset Status = "Fail|Error: #cfcatch.message#">
				</cfcatch>
			</cftry>
		</cfif>
		
		<cfreturn Status />
	</cffunction>
    
	<cffunction name="saveFacultyMember" access="Public" output="true" returntype="string">
		<cfargument name="ActivityID" required="yes" type="string">
		<cfargument name="PersonID" required="yes" type="string">
		
		<cfset var Status = "">
		
		<cfif Arguments.PersonID EQ "" OR  Arguments.ActivityID EQ "">
			<cfset Status = "Fail|More information is required to add this faculty member.">
		</cfif>
		
		<!--- ACTIVITY DETAIL --->
		<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		<cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
		
		<cfif Status EQ "">
			<cftry>
				<cfquery name="qFindFacultyMember" datasource="#Application.Settings.DSN#">
					SELECT DeletedFlag
					FROM ce_Activity_Faculty
					WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
				</cfquery>
				
				<cfif qFindFacultyMember.RecordCount LTE 0>
                	<!--- GET CV FILEID --->
                	<cfquery name="qGetCVFile" datasource="#Application.Settings.DSN#">
                    	SELECT TOP 1 FileID
                        FROM ce_File
                        WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND FileTypeID = <cfqueryparam value="4" cfsqltype="cf_sql_integer" />
                        ORDER BY Created DESC
                    </cfquery>
                    
                	<!--- GET DISCLOSURE FILEID --->
                	<cfquery name="qGetDisclosureFile" datasource="#Application.Settings.DSN#">
                    	SELECT TOP 1 FileID
                        FROM ce_File
                        WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND FileTypeID = <cfqueryparam value="5" cfsqltype="cf_sql_integer" />
                        ORDER BY Created DESC
                    </cfquery>
                
                	<!--- INSERT FACULTY MEMBER RECORD --->
					<cfquery name="addFacultyMember" datasource="#Application.Settings.DSN#">
						INSERT INTO ce_Activity_Faculty
							(
							ActivityID,
							PersonID,
                            <cfif qGetCVFile.RecordCount GT 0>
                            	CVFileID,
                            </cfif>
                            <cfif qGetDisclosureFile.RecordCount GT 0>
                            	DisclosureFileID,
                            </cfif>
							CreatedBy,
							DeletedFlag
							)
							VALUES
							(
							<cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />,
							<cfqueryparam value="#Arguments.PersonID#" CFSQLType="cf_sql_integer" />,
                            <cfif qGetCVFile.RecordCount GT 0>
                            	<cfqueryparam value="#qGetCVFile.FileID#" CFSQLType="cf_sql_integer" />,
                            </cfif>
                            <cfif qGetDisclosureFile.RecordCount GT 0>
                            	<cfqueryparam value="#qGetDisclosureFile.FileID#" CFSQLType="cf_sql_integer" />,
                            </cfif>
							<cfqueryparam value="#session.currentuser.id#" CFSQLType="cf_sql_integer" />,
							<cfqueryparam value="N" CFSQLType="cf_sql_char" />
							)
					</cfquery>
					
					<!--- ACTION UPDATER --->
					<cfset Application.History.Add(
								HistoryStyleID=36,
								FromPersonID=Arguments.PersonID,
								ToPersonID=Arguments.PersonID,
								ToActivityID=Arguments.ActivityID)>
					<cfset Application.History.Add(
								HistoryStyleID=35,
								FromPersonID=session.currentuser.id,
								ToPersonID=Arguments.PersonID,
								ToActivityID=Arguments.ActivityID)>
					
					<cfset Status = "Success|Faculty member has been added.">
				<cfelse>
					<!--- Checks if there was a record for the person already --->
					<cfif qFindFacultyMember.RecordCount EQ 1 AND qFindFacultyMember.DeletedFlag EQ 'Y'>
                        <!--- GET CV FILEID --->
                        <cfquery name="qGetCVFile" datasource="#Application.Settings.DSN#">
                            SELECT TOP 1 FileID
                            FROM ce_File
                            WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND FileTypeID = <cfqueryparam value="4" cfsqltype="cf_sql_integer" /> AND DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />
                            ORDER BY Created DESC
                        </cfquery>
                        
                        <!--- GET OLD CV FILEID --->
                        <cfquery name="qGetOldCVFileID" datasource="#Application.Settings.DSN#">
                        	SELECT CVFileID
                            FROM ce_Activity_Faculty
                            WHERE PersonID = <cfqueryparam value="#PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                        </cfquery>
                        
                        <!--- DETERMINE THE CVAPPROVEFLAG --->
                        <cfif qGetOldCVFileID.CVFileID EQ qGetCVFile.FileID>
                        	<cfset CVApproveFlag = "Y">
                        <cfelse>
                        	<cfset CVApproveFlag = "N">
                        </cfif>
                        
                        <!--- GET DISCLOSURE FILEID --->
                        <cfquery name="qGetDisclosureFile" datasource="#Application.Settings.DSN#">
                            SELECT TOP 1 FileID
                            FROM ce_File
                            WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" cfsqltype="cf_sql_integer" /> AND FileTypeID = <cfqueryparam value="5" cfsqltype="cf_sql_integer" /> AND DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />
                            ORDER BY Created DESC
                        </cfquery>
                        
                        <!--- GET OLD DISCLOSURE FILEID --->
                        <cfquery name="qGetOldDisclosureFileID" datasource="#Application.Settings.DSN#">
                        	SELECT DisclosureFileID
                            FROM ce_Activity_Faculty
                            WHERE PersonID = <cfqueryparam value="#PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
                        </cfquery>
                        
                        <!--- DETERMINE THE DISCLOSUREAPPROVEFLAG --->
                        <cfif qGetOldDisclosureFileID.DisclosureFileID EQ qGetDisclosureFile.FileID>
                        	<cfset DisclosureApproveFlag = "Y">
                        <cfelse>
                        	<cfset DisclosureApproveFlag = "N">
                        </cfif>
                        
						<!--- If a record exists but DeletedFlag EQ Y then it is updated to N --->
						<cfquery name="qUpdateDeletedFlag" datasource="#Application.Settings.DSN#">
							UPDATE ce_Activity_Faculty
							SET 
                            	<!--- SET CV FILE INFORMATION --->
                            	<cfif qGetCVFile.RecordCount NEQ 0>
                                	CVFileID = <cfqueryparam value="#qGetCVFile.FileID#" CFSQLType="cf_sql_integer" />,
                                <cfelse>
                                	CVFileID = <cfqueryparam null="true" />,
                                </cfif>
                            	CVApproveFlag = <cfqueryparam value="#CVApproveFlag#" CFSQLType="cf_sql_char" />,
                                <!--- SET DISCLOSURE FILE INFORMATION --->
                            	<cfif qGetDisclosureFile.RecordCount NEQ 0>
                                	DisclosureFileID = <cfqueryparam value="#qGetDisclosureFile.FileID#" CFSQLType="cf_sql_integer" />,
                                <cfelse>
                                	DisclosureFileID = <cfqueryparam null="true" />,
                                </cfif>
                            	DisclosureApproveFlag = <cfqueryparam value="#DisclosureApproveFlag#" CFSQLType="cf_sql_char" />,
                            	DeletedFlag = <cfqueryparam value="N" cfsqltype="cf_sql_char" />,
								UpdatedBy = <cfqueryparam value="#session.currentuser.id#" cfsqltype="cf_sql_integer" />
							WHERE PersonID = <cfqueryparam value="#Arguments.PersonID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
						</cfquery>
					
						<!--- ACTION UPDATER --->
						<cfset Application.History.Add(
                                    HistoryStyleID=36,
                                    FromPersonID=Arguments.PersonID,
                                    ToPersonID=Arguments.PersonID,
                                    ToActivityID=Arguments.ActivityID)>
                        <cfset Application.History.Add(
                                    HistoryStyleID=35,
                                    FromPersonID=session.currentuser.id,
                                    ToPersonID=Arguments.PersonID,
                                    ToActivityID=Arguments.ActivityID)>
						
						<cfset Status = "Success|Faculty member has been added.">
					<cfelse>
						<cfset Status = "Fail|Faculty member has already been added.">
					</cfif>
				</cfif>
				<cfcatch type="any">
					<cfset Status = "Fail|Error: #cfcatch.message#">
				</cfcatch>
			</cftry>
		</cfif>
		
		<cfreturn Status />
	</cffunction>
</cfcomponent>