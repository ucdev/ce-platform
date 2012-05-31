<cfcomponent displayname="ActivityAjax" output="no">
	<cffunction name="init" access="public" output="false" returntype="_com.ProcessStep.ActivityAjax">
		<cfset variables.dsn = Application.Settings.DSN />
		<cfreturn this />
	</cffunction>
	
	<cfset myself = Request.Myself>
	
	<cffunction name="AddToQueues" access="remote" returntype="string" output="no">
		<cfargument name="Steps" type="string" required="yes" hint="PersonID of person you want to add">
		<cfargument name="Notes" type="string" required="yes" hint="GroupID" />
		<cfargument name="Assigned" type="string" required="yes" />
		<cfargument name="ActivityID" type="numeric" required="yes" />
		
		<cfset var i = "">
		<cfset var Status = "fail|Failed for unknown reason.">
		<cfset var nStepID = 0>
		<cfset var sNote = "">
		<cfset var nAssignedTo = 0>
		<cfset var dtDueDate = "">
		<cfset var qGetPerson = "">
		<cfset var qGetStep = "">
		
		<cfset var ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
		
		<cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
		
		<cfloop from="1" to="#ListLen(Arguments.Steps)#" index="i">
			<cfset nStepID = GetToken(Arguments.Steps,i,",")>
			<cfset sNote = GetToken(Arguments.Steps,i,"==")>
			<cfset nAssignedTo = GetToken(Arguments.Assigned,i,",")>
			
			<cfquery name="qGetStep" datasource="#Application.Settings.DSN#">
				SELECT StepID,Name,DueDateSetting,BeforeOrAfter,RelativeDays,NotifyFlag
				FROM ce_ProcessStep
				WHERE StepID=<cfqueryparam value="#nStepID#" cfsqltype="cf_sql_integer" />
			</cfquery>
			
			<cfif qGetStep.BeforeOrAfter EQ "B">
				<cfset nDays = qGetStep.RelativeDays * -1>
			<cfelse>
				<cfset nDays = qGetStep.RelativeDays>
			</cfif>
			
			<cfset dtDueDate = DateAdd("d",nDays,ActivityBean.getStartDate())>
			
			<cfquery name="qCheck" datasource="#Application.Settings.DSN#">
				SELECT Step_ActivityID,StepID,ActivityID 
				FROM ce_ProcessStep_Activity
				WHERE StepID=<cfqueryparam value="#nStepID#" cfsqltype="cf_sql_integer" /> AND ActivityID=<cfqueryparam value="#Arguments.ActivityID#" cfsqltype="cf_sql_integer" /> AND DeletedFlag='N'
			</cfquery>
			
			<cfset PSABean = CreateObject("component","#Application.Settings.Com#ProcessStepActivity.ProcessStepActivity").init()>
			
			<cfif qCheck.RecordCount EQ 0>
				<cfset PSABean.setStepID(nStepID)>
				<cfset PSABean.setActivityID(Arguments.ActivityID)>
				<cfset PSABean.setAssignedToID(nAssignedTo)>
				<cfset PSABean.setDueDate(dtDueDate)>
				<cfset PSABean.setStepStatusID(2)>
				<cfset PSABean.setCreatedBy(Session.Person.getPersonID())>
				
				<!--- ACTION UPDATER --->
				<cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
				<cfset ActionBean.setActivityID(Arguments.ActivityID)>
				<cfset ActionBean.setCode("PQ")>
				<cfset ActionBean.setShortName("Added to queue.")>
				<cfset ActionBean.setLongName("Added activity '<a href=""#myself#Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>' to process queue '<a href=""#myself#Process.StepDetail?StepID=#qGetStep.StepID#"">#qGetStep.Name#</a>'")>
				<cfif nAssignedTo GT 0>
					<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=nAssignedTo)>
					<cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
					<cfset ActionBean.setPersonID(PersonBean.getPersonID())>
					<cfset ActionBean.setLongName(ActionBean.getLongName() & " and assigned it to '<a href=""#myself#Person.Detail?PersonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>'")>
				</cfif>
				<cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
				<cfset Application.Com.ActionDAO.Create(ActionBean)>
				<cfset Application.Com.ProcessStepActivityDAO.Create(PSABean)>
			<cfelse>
				<cfset PSABean.setStep_ActivityID(qCheck.Step_ActivityID)>
				<cfset PSABean = Application.Com.ProcessStepActivityDAO.read(PSABean)>
				<cfset PSABean.setAssignedToID(nAssignedTo)>
				<cfset PSABean.setUpdatedBy(Session.Person.getPersonID())>
				
				<!--- ACTION UPDATER --->
				<cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
				<cfset ActionBean.setActivityID(Arguments.ActivityID)>
				<cfset ActionBean.setCode("PQ")>
				<cfset ActionBean.setShortName("Updated queue detail.")>
				<cfset ActionBean.setLongName("Updated queue detail for activity '<a href=""#myself#Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>' for process queue '<a href=""#myself#Process.StepDetail?StepID=#qGetStep.StepID#"">#qGetStep.Name#</a>'")>
				<cfif nAssignedTo GT 0>
					<cfset PersonBean = CreateObject("component","#Application.Settings.Com#Person.Person").init(PersonID=nAssignedTo)>
					<cfset PersonBean = Application.Com.PersonDAO.read(PersonBean)>
					<cfset ActionBean.setPersonID(PersonBean.getPersonID())>
					<cfset ActionBean.setLongName(ActionBean.getLongName() & " and assigned it to '<a href=""#myself#Person.Detail?PersonID=#PersonBean.getPersonID()#"">#PersonBean.getFirstName()# #PersonBean.getLastName()#</a>'")>
				</cfif>
				<cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
				<cfset Application.Com.ActionDAO.Create(ActionBean)>
				<cfset Application.Com.ProcessStepActivityDAO.Update(PSABean)>
			</cfif>
			
			
			<cfset Status = "success">
		</cfloop>
		
		<cfreturn Status />
	</cffunction>
</cfcomponent>