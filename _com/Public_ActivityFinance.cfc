<cfcomponent>
	<cffunction name="init" access="public" output="no" returntype="_com.Public_ActivityFinance">
		<cfreturn this />
	</cffunction>
    
	<cffunction name="deleteBudget" access="Public" output="true" returntype="struct">
        <cfargument name="ActivityID" type="String" required="true">
        <cfargument name="BudgetID" type="String" required="true">
	
		<cfset var ExpenseOrRevenue = "Revenue">
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete budget item for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.BudgetID EQ "" OR Arguments.ActivityID EQ "">
	        <cfset status.setStatusMsg("More information is required to remove the budget entry.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>				
            <!--- Delete ledger record --->
            <cfquery name="qRemoveBudget" datasource="#Application.Settings.DSN#">
                UPDATE ce_Activity_FinBudget
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />
                WHERE BudgetID = <cfqueryparam value="#Arguments.BudgetID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
            </cfquery>

            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("The budget entry has been removed.")>
            
			<!--- REFRESH BIT --->
			<cfset application.activity.refresh(arguments.activityid) />
			
            <!--- Save the action for the Budget Delete --->
            <cfset Application.History.Add(
                        HistoryStyleID=10,
                        FromPersonID=Session.PersonID,
                        ToActivityID=Arguments.ActivityID)>
            
            <cfcatch type="any">
                <cfset status.addError("General","Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>
    
	<cffunction name="deleteFee" access="Public" output="true" returntype="struct">
        <cfargument name="ActivityID" type="String" required="true">
        <cfargument name="FeeID" type="String" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete fee item for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.FeeID EQ "" OR Arguments.ActivityID EQ "">
			<cfset status.setStatusMsg("More information is required to remove the fee.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>				
            <!--- Delete ledger record --->
            <cfquery name="qRemoveFee" datasource="#Application.Settings.DSN#">
                UPDATE ce_Activity_FinFee
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />
                WHERE FeeID = <cfqueryparam value="#Arguments.FeeID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
            </cfquery>>
            
            <cfset qActivityFee = Application.Com.ActivityFeeGateway.getByViewAttributes(ActivityID=Arguments.ActivityID,FeeID=Arguments.FeeID)>
            
            <!--- Acquire Activity Info --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfset qActivityFee.Amount = "$" & qActivityFee.Amount>
            
			<!--- REFRESH BIT --->
			<cfset application.activity.refresh(arguments.activityid) />
			
            <!--- Save the action for the Budget Entry Save --->
            <cfset Application.History.Add(
                        HistoryStyleID=39,
                        FromPersonID=Session.PersonID,
                        ToActivityID=Arguments.ActivityID)>
            
            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("The fee has been removed.")>
			
            <cfcatch type="any">
                <cfset status.addError("General","Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>

	<cffunction name="deleteLedger" access="Public" output="true" returntype="struct">
        <cfargument name="ActivityID" type="String" required="true">
        <cfargument name="EntryID" type="String" required="true">
        
		<cfset var ExpenseOrRevenue = "Revenue">
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete ledger item for unknown reasons.")>
	
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.EntryID EQ "" OR Arguments.ActivityID EQ "">
       		<cfset status.setStatusMsg("More information is required to remove the ledger entry.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>
            <!--- Acquire Ledger Entry Info --->
            
            <!--- Delete ledger record --->
            <cfquery name="qRemoveLedger" datasource="#Application.Settings.DSN#">
                UPDATE ce_Activity_FinLedger
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />
                WHERE EntryID = <cfqueryparam value="#Arguments.EntryID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
            </cfquery>
            
            <cfset qActivityLedger = Application.Com.ActivityLedgerGateway.getByViewAttributes(afl.ActivityID=Arguments.ActivityID,afl.EntryID=Arguments.EntryID)>
            
            <!--- Acquire Activity Info --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <cfif qActivityLedger.Amount LT 0>
                <cfset ExpenseOrRevenue = "Expense">
                <cfset qActivityLedger.Amount = "($" & Right(qActivityLedger.Amount,Len(qActivityLedger.Amount)-1) & ")">
            <cfelse>
                <cfset qActivityLedger.Amount = "$" & qActivityLedger.Amount>
            </cfif>

            <cfset status.setStatus(true)>
            <cfset status.setStatusMsg("The ledger entry has been removed.")>
            
			<!--- REFRESH BIT --->
			<cfset application.activity.refresh(arguments.activityid) />
			
            <!--- Save the action for the Ledger Entry Save --->
            <cfset Application.History.Add(
                        HistoryStyleID=40,
                        FromPersonID=Session.PersonID,
                        ToActivityID=Arguments.ActivityID)>
            
            <cfcatch type="any">
                <cfset status.addError("General","Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
            		
		<cfreturn status />
	</cffunction>

	<cffunction name="deleteSupport" access="remote" output="true" returntype="struct">
        <cfargument name="ActivityID" type="String" required="true">
        <cfargument name="SupportID" type="String" required="true">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Cannot delete support for unknown reasons.")>
		
		<!--- Check to make sure the Argument vars are not blank --->
		<cfif Arguments.SupportID EQ "" OR Arguments.ActivityID EQ "">
        	<cfset status.setStatusMsg("More information is required to remove the support entry.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
        <cftry>
            <!--- GET SUPPORTER INFORMATION --->
            <cfset SupporterBean = CreateObject("component","#Application.Settings.Com#ActivityFinance.Support").Init(SupportID=Arguments.SupportID)>
            <cfset SupporterBean = Application.Com.ActivitySupportDAO.Read(SupporterBean)>
                            
            <!--- Acquire Activity Info --->
            <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
            
            <!--- DEFINE THE ACTIVITY VARIABLES --->
            <cfset ActivityTitle = ActivityBean.getTitle()>
            <cfset ParentActivityID = ActivityBean.getParentActivityID()>
            
            <!--- Read in the ActivitySupport information --->
            <cfset qActivitySupport = Application.Com.ActivitySupportGateway.getByViewAttributes(ActivityID=Arguments.ActivityID,SupportID=Arguments.SupportID)>
            
            <cfif ParentActivityID NEQ "">
                <cfset ParentActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=ParentActivityID)>
                <cfset ParentActivityBean = Application.Com.ActivityDAO.Read(ParentActivityBean)>
                <cfset ParentActivityBean.setStatSupporters(ParentActivityBean.getStatSupporters()-1)>
                <cfset ParentActivityBean.setStatSuppAmount(ParentActivityBean.getStatSuppAmount()-qActivitySupport.Amount)>
                <cfset ParentActivityBean = Application.Com.ActivityDAO.Update(ParentActivityBean)>
            </cfif>
            
            <!--- Update Activity Stats --->
            <cfset ActivityBean.setStatSupporters(ActivityBean.getStatSupporters()-1)>
            <cfset ActivityBean.setStatSuppAmount(ActivityBean.getStatSuppAmount()-qActivitySupport.Amount)>
            
            <!--- Save the updated ActivityBean information --->
            <cfset ActivityBean = Application.Com.ActivityDAO.Save(ActivityBean)>
            
            <!--- Delete ledger record --->
            <cfquery name="qRemoveSupport" datasource="#Application.Settings.DSN#">
                UPDATE ce_Activity_FinSupport
                SET DeletedFlag = <cfqueryparam value="Y" cfsqltype="cf_sql_char" />
                WHERE SupportID = <cfqueryparam value="#Arguments.SupportID#" CFSQLType="cf_sql_integer" /> AND ActivityID = <cfqueryparam value="#Arguments.ActivityID#" CFSQLType="cf_sql_integer" />
            </cfquery>
            
            <!--- Adjust qActivitySupport.Amount for display --->
            <cfset qActivitySupport.Amount = "$" & qActivitySupport.Amount>
            
			<!--- REFRESH BIT --->
			<cfset application.activity.refresh(arguments.activityid) />
			
            <!--- Save the action for the Support Entry Save --->
            <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
            <cfset ActionBean.setActivityID(Arguments.ActivityID)>
            <cfset ActionBean.setShortName("Deleted a support entry.")>
            <cfset ActionBean.setCode("SUPR")>
            <cfset ActionBean.setLongName("Deleted a support entry for #qActivitySupport.SupporterName# (#qActivitySupport.SupportTypeName#) to activity '<a href=""/index.cfm/event/Activity.Detail?ActivityID=#Arguments.ActivityID#"">#ActivityTitle#</a>' for the amount of #qActivitySupport.Amount#.")>
            <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
            <cfset Application.Com.ActionDAO.Create(ActionBean)>
            
			<cfset status.setStatus(true)>
            <cfset status.setStatusMsg("The support entry has been removed.")>
            
            <cfcatch type="any">
                <cfset status.addError("General", "Error: " & cfcatch.message)>
            </cfcatch>
        </cftry>
		
		<cfreturn status />
	</cffunction>
    
    <cffunction name="saveBudget" hint="Saves provided information as a budget entry." access="Public" output="false" returntype="struct">
    	<cfargument name="ActivityID" type="numeric" required="yes">
    	<cfargument name="BudgetID" type="numeric" required="yes">
        <cfargument name="Description" type="string" required="yes">
        <cfargument name="EntryType" type="numeric" required="yes">
        <cfargument name="Amount" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Could not save budget entry for unknown reasons.")>
        
		<cfset ActivityBudgetBean = CreateObject("component","#Application.Settings.Com#ActivityFinance.Budget").Init(BudgetID=Arguments.BudgetID)>
	
    	<!--- CHECK IF THIS IS AN EDIT OR CREATE --->
    	<cfif Application.Com.ActivityBudgetDAO.Exists(ActivityBudgetBean)>
        	<cfset ActivityBudgetBean = Application.Com.ActivityBudgetDAO.Read(ActivityBudgetBean)>
        </cfif>
        
        <!--- Enter User defined vars into the bean --->
        <cfset ActivityBudgetBean.setActivityID(Arguments.ActivityID)>
        <cfset ActivityBudgetBean.setDescription(Arguments.Description)>
        <cfset ActivityBudgetBean.setEntryTypeID(Arguments.EntryType)>
        
		<!--- Query of Queries to get the ExpenseFlag and Name for the Selected EntryType --->
        <cfquery name="qExpenseTypeInfo" datasource="#Application.Settings.DSN#">
            SELECT Name,ExpenseFlag
            FROM ce_Sys_EntryType
            WHERE EntryTypeID = <cfqueryparam value="#ActivityBudgetBean.getEntryTypeID()#" cfsqltype="cf_sql_integer">
        </cfquery>
    
        <!--- Make sure the user didn't try to enter a negative number for the amount --->
        <cfif Arguments.Amount LT 0>
            <cfset Arguments.Amount = Arguments.Amount * -1>
        </cfif>
        
        <!--- Checks if the selected EntryType is an expense or revenue, if its an expense, it turns the amount negative --->
        <cfif qExpenseTypeInfo.ExpenseFlag EQ "Y">
            <!--- Perform ActionAmount value setting first as to avoid the negative sign --->
            <cfset ActionAmount = "($" & Arguments.Amount & ")">
            <cfset ExpenseOrRevenue = "an Expense">
            <cfset Arguments.Amount = Arguments.Amount * -1>
        <cfelse>
            <cfset ActionAmount = "$" & Arguments.Amount>
            <cfset ExpenseOrRevenue = "a Revenue">
        </cfif>
        
        <!--- Sets the Amount in the bean --->
        <cfset ActivityBudgetBean.setAmount(Arguments.Amount)>
        
        <!--- Determines if it is a new Ledger or an edited ledger --->
        <cfif Arguments.BudgetID EQ 0>
            <cfset ActivityBudgetBean.setCreatedBy(Session.Person.getPersonID())>
        <cfelse>
            <cfset ActivityBudgetBean.setUpdatedBy(Session.Person.getPersonID())>
        </cfif>
        
        <!--- Validate Bean --->
        <cfset aErrors = ActivityBudgetBean.Validate()>
        
        <cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
            <cfset status.addError(aErrors[i].Field, aErrors[i].Message)>
        </cfloop>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
            <cftry>
                <!--- Save Ledger Entry to the DB --->
                <cfset ActivityBudgetBean = Application.Com.ActivityBudgetDAO.Save(ActivityBudgetBean)>
                    
                <!--- Acquire Activity Info --->
                <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
                <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                
			<!--- REFRESH BIT --->
			<cfset application.activity.refresh(arguments.activityid) />
			
                <!--- Save the action for the Ledger Entry Save --->
                <cfset Application.History.Add(
							HistoryStyleID=9,
							FromPersonID=Session.PersonID,
							ToActivityID=Arguments.ActivityID)>
                
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Budget entry has been saved.")>
                
                <cfcatch type="any">
                    <cfset status.addError("General", "Error: " & cfcatch.Message)>
                </cfcatch>
            </cftry>
        </cfif>
        
        <cfreturn status />
    </cffunction>

	<cffunction name="saveFee" access="Public" ouput="true" returntype="string">
    	<cfargument name="FeeID" required="yes" default="0">
    	<cfargument name="ActivityID" required="yes">
        <cfargument name="Name" required="yes">
        <cfargument name="StartDate" required="yes">
        <cfargument name="StartTime" required="yes">
        <cfargument name="EndDate" required="yes">
        <cfargument name="EndTime" required="yes">
        <cfargument name="Amount" required="yes">
        
        <cfset var Status = "">
        
        <cfif Arguments.ActivityID EQ "">
			<cfset Status = ListAppend(Status,"ActivityID is required.","|")>
        </cfif>
        
        <cfif Status EQ "">
        	<!--- GET ACTIVITY INFORMATION --->
			<cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
            <cfset ActivityBean = Application.Com.ActivityDAO.Read(ActivityBean)>
            
            <!--- CREATE ACTIVITYFEE BEAN --->
			<cfset ActivityFeeBean = CreateObject("component","#Application.Settings.Com#ActivityFinance.Fee").Init(FeeID=Arguments.FeeID,ActivityID=Arguments.ActivityID)>
            
			<cfset ActivityFeeExists = Application.Com.ActivityFeeDAO.Exists(ActivityFeeBean)>
            <cfif ActivityFeeExists>
				<cfset ActivityFeeBean = Application.Com.ActivityFeeDAO.Read(ActivityFeeBean)>
                    <cfset ActivityFeeBean.setUpdatedBy(Session.PersonID)>
                    <cfset ActivityFeeBean.setUpdated(Now())>
            <cfelse>
                    <cfset ActivityFeeBean.setCreatedBy(Session.PersonID)>
                    <cfset ActivityFeeBean.setCreated(Now())>
            </cfif>
            
            <cfif Arguments.StartDate NEQ "" AND IsDate(Arguments.StartDate) AND Arguments.StartTime NEQ "" AND IsDate(Arguments.StartTime) AND Arguments.EndDate NEQ "" AND IsDate(Arguments.EndDate) AND Arguments.EndTime NEQ "" AND IsDate(Arguments.EndTime)>
                <!--- CREATE START AND END DATETIME VARIABLES --->
                <cfset StartDateTime = CreateODBCDateTime(Arguments.StartDate & " " & Arguments.StartTime)>
                <cfset EndDateTime = CreateODBCDateTime(Arguments.EndDate & " " & Arguments.EndTime)>
            <cfelse>
                <!--- SET VARIABLES IF THEY WERE BLANK --->
                <cfif Arguments.StartDate EQ "" OR NOT IsDate(Arguments.StartDate)>
                    <cfset Arguments.StartDate = DateFormat(ActivityBean.getStartDate(), "YYYY-MM-DD")>
                </cfif>
                <cfif Arguments.StartTime EQ "" OR NOT IsDate(Arguments.StartTime)>
                    <cfset Arguments.StartTime = "00:00:00">
                </cfif>
                <cfif Arguments.EndDate EQ "" OR NOT IsDate(Arguments.EndDate)>
                    <cfset Arguments.EndDate = DateFormat(ActivityBean.getEndDate(), "YYYY-MM-DD")>
                </cfif>
                <cfif Arguments.EndTime EQ "" OR NOT IsDate(Arguments.EndTime)>
                    <cfset Arguments.EndTime = "23:59:59">
                </cfif>
                
                <!--- CREATE START AND END DATETIME VARIABLES --->
                <cfset StartDateTime = CreateODBCDateTime(Arguments.StartDate & " " & Arguments.StartTime)>
                <cfset EndDateTime = CreateODBCDateTime(Arguments.EndDate & " " & Arguments.EndTime)>
            </cfif>
            
            <!--- Enter User defined vars into the bean --->
            <cfset ActivityFeeBean.setName(Arguments.Name)>
            <cfset ActivityFeeBean.setDisplayName(Arguments.Name)>
            <cfset ActivityFeeBean.setStartDate(StartDateTime)>
            <cfset ActivityFeeBean.setEndDate(EndDateTime)>
            
            <!--- Only modifies the amount if the amount is greater than zero --->
            <cfif Len(Arguments.Amount) GT 0 AND isNumeric(Arguments.Amount)>
                <!--- Make sure the user didn't try to enter a negative number for the amount --->
                <cfif Arguments.Amount LT 0>
                    <cfset Arguments.Amount = Arguments.Amount * -1>
                </cfif>
            
                <cfset Arguments.ActionAmount = "$" & Arguments.Amount>
            </cfif>
            
            <!--- Sets the Amount in the bean --->
            <cfset ActivityFeeBean.setAmount(Arguments.Amount)>
            <!--- Determines if it is a new Ledger or an edited ledger --->
            <cfset ActivityFeeBean.setCreatedBy(Session.Person.getPersonID())>
            
            <!--- Validate Bean --->
            <cfset aErrors = ActivityFeeBean.Validate()>
            
            <cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
                <cfset Status = ListAppend(Status,aErrors[i].Message,"|")>
            </cfloop>
            
            <cfif Status EQ "">
                <cftry>
                    <cfset ActivityFeeBean = Application.Com.ActivityFeeDAO.Save(ActivityFeeBean)>
                        
                    <!--- Acquire Activity Info --->
                    <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
                    <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                    
			<!--- REFRESH BIT --->
			<cfset application.activity.refresh(arguments.activityid) />
			
                    <!--- Save the action for the Ledger Entry Save --->
                    <cfset Application.History.Add(
								HistoryStyleID=38,
								FromPersonID=Session.PersonID,
								ToActivityID=Arguments.ActivityID)>
                    
                    <cfset Status = "Success|Fee has been added.">
                    
                    <cfcatch type="any">
                        <cfset Status = "Error: " & cfcatch.Message>
                    </cfcatch>
                </cftry>
            </cfif>
        </cfif>
        
       <cfreturn Status />
    </cffunction>
    
    <cffunction name="saveLedger" hint="Saves ledger information." access="Public" output="false" returntype="struct">
    	<cfargument name="ActivityID" type="numeric" required="yes">
        <cfargument name="EntryID" type="numeric" required="yes">
        <cfargument name="Description" type="string" required="yes">
        <cfargument name="Memo" type="string" required="yes">
        <cfargument name="EntryDate" type="date" required="yes">
        <cfargument name="EntryType" type="numeric" required="yes">
        <cfargument name="Amount" type="numeric" required="yes">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Could not save ledger entry for unknown reasons.")>
        
		<cfset ActivityLedgerBean = CreateObject("component","#Application.Settings.Com#ActivityFinance.Ledger").Init(EntryID=Arguments.EntryID)>
	
    	<!--- CHECK IF THIS IS AN EDIT OR CREATE --->
    	<cfif Application.Com.ActivityLedgerDAO.Exists(ActivityLedgerBean)>
        	<cfset ActivityLedgerBean = Application.Com.ActivityLedgerDAO.Read(ActivityLedgerBean)>
        </cfif>
        
    	<!--- Enter User defined vars into the bean --->
        <cfset ActivityLedgerBean.setActivityID(Arguments.ActivityID)>
        <cfset ActivityLedgerBean.setDescription(Arguments.Description)>
        <cfset ActivityLedgerBean.setEntryDate(Arguments.EntryDate)>
        <cfset ActivityLedgerBean.setEntryTypeID(Arguments.EntryType)>
        <cfset ActivityLedgerBean.setMemo(Arguments.Memo)>
        
		<!--- Query of Queries to get the ExpenseFlag and Name for the Selected EntryType --->
        <cfquery name="qExpenseTypeInfo" datasource="#Application.Settings.DSN#">
            SELECT Name,ExpenseFlag
            FROM ce_Sys_EntryType
            WHERE EntryTypeID = <cfqueryparam value="#ActivityLedgerBean.getEntryTypeID()#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <!--- Make sure the user didn't try to enter a negative number for the amount --->
        <cfif Arguments.Amount LT 0>
            <cfset Arguments.Amount = Arguments.Amount * -1>
        </cfif>
        
        <!--- Checks if the selected EntryType is an expense or revenue, if its an expense, it turns the amount negative --->
        <cfif qExpenseTypeInfo.ExpenseFlag EQ "Y">
            <!--- Perform ActionAmount value setting first as to avoid the negative sign --->
            <cfset ActionAmount = "($" & Arguments.Amount & ")">
            <cfset Arguments.Amount = Arguments.Amount * -1>
            <cfset ExpenseOrRevenue = "an Expense">
        <cfelse>		
            <cfset ActionAmount = "$" & Arguments.Amount>
            <cfset ExpenseOrRevenue = "a Revenue">
        </cfif>
        
        <!--- Sets the Amount in the bean --->
        <cfset ActivityLedgerBean.setAmount(Arguments.Amount)>
        
        
        <!--- Determines if it is a new Ledger or an edited ledger --->
        <cfif Arguments.EntryID EQ 0>
            <cfset ActivityLedgerBean.setCreatedBy(Session.Person.getPersonID())>
        <cfelse>
            <cfset ActivityLedgerBean.setUpdatedBy(Session.Person.getPersonID())>
        </cfif>
        
        <!--- Validate Bean --->
        <cfset aErrors = ActivityLedgerBean.Validate()>
        
        <!--- Fill Request.Status.Errors --->
        <cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
            <cfset status.addError(aErrors[i].Field,aErrors[i].Message)>
        </cfloop>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
            <cftry>
                <!--- Save Ledger Entry to the DB --->
                <cfset ActivityLedgerBean = Application.Com.ActivityLedgerDAO.Save(ActivityLedgerBean)>
                    
                <!--- Acquire Activity Info --->
                <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
                <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                
			<!--- REFRESH BIT --->
			<cfset application.activity.refresh(arguments.activityid) />
			
                <cfif Arguments.EntryID EQ 0>
					<!--- Save the action for the Ledger Entry Save --->
                    <cfset Application.History.Add(
                                HistoryStyleID=37,
                                FromPersonID=Session.PersonID,
                                ToActivityID=Arguments.ActivityID)>
                <cfelse>
					<!--- Save the action for the Ledger Entry Save --->
                    <cfset Application.History.Add(
                                HistoryStyleID=104,
                                FromPersonID=Session.PersonID,
                                ToActivityID=Arguments.ActivityID)>
                </cfif>
                
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("Ledger entry has been saved.")>
                
                <cfcatch type="any">
                    <cfset status.addError("General","Error: " & cfcatch.Message)>
                </cfcatch>
            </cftry>
        </cfif>
        
        <cfreturn status />
    </cffunction>
    
	<cffunction name="saveSupport" access="Public" output="true" returntype="struct">
    	<cfargument name="SupportID" required="false" default="-1" type="string">
		<cfargument name="ActivityID" required="true" type="string">
		<cfargument name="Supporter" required="true" type="string">
		<cfargument name="SupportType" required="true" type="string">
		<cfargument name="Amount" required="true" type="string">
		<cfargument name="ContractNum" required="false" type="string" default="">
		<cfargument name="BudgetRequested" required="false" type="string" default="">
		<cfargument name="BudgetDueDate" required="false" type="string" default="">
		<cfargument name="BudgetSentDate" required="false" type="string" default="">
		<cfargument name="SentDate" required="false" type="string" default="">
		<cfargument name="FundsReturned" required="false" type="string" default="">
        
        <cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfset status.setStatus(false)>
        <cfset status.setStatusMsg("Could not save ledger entry for unknown reasons.")>
        
		<cfif Arguments.Supporter EQ "" OR Arguments.SupportType EQ "" OR Arguments.Amount EQ "">
			<cfset status.setStatusMsg("More information is needed to add a support record.")>
            <cfreturn status />
            <cfabort>
		</cfif>
		
		<!--- Create ActivitySupportBean --->
        <cfset ActivitySupportBean = CreateObject("component","#Application.Settings.Com#ActivityFinance.Support").Init(SupportID=Arguments.SupportID,ActivityID=Arguments.ActivityID)>
        
        <cfset ActivitySupportExists = Application.Com.ActivitySupportDAO.Exists(ActivitySupportBean)>
        
        <cfif ActivitySupportExists>
            <cfset ActivitySupportBean = Application.Com.ActivitySupportDAO.Read(ActivitySupportBean)>
        </cfif>
        
        <!--- Insert User defined Variables --->
        <cfset ActivitySupportBean.setAmount(Arguments.Amount)>
        <cfset ActivitySupportBean.setSupporterID(Arguments.Supporter)>
        <cfset ActivitySupportBean.setSupportTypeID(Arguments.SupportType)>
        <cfset ActivitySupportBean.setContractNum(Arguments.ContractNum)>
        <cfset ActivitySupportBean.setBudgetRequested(Arguments.BudgetRequested)>
        <cfset ActivitySupportBean.setBudgetDueDate(Arguments.BudgetDueDate)>
        <cfset ActivitySupportBean.setBudgetSentDate(Arguments.BudgetSentDate)>
        <cfset ActivitySupportBean.setSentDate(Arguments.SentDate)>
        <cfset ActivitySupportBean.setFundsReturned(Arguments.FundsReturned)>
        <cfset ActivitySupportBean.setCreatedBy(Session.Person.getPersonID())>
        
        <!--- Validate Bean --->
        <cfset aErrors = ActivitySupportBean.Validate()>
        
        <!--- Fill Request.Status.Errors --->
        <cfloop from="1" to="#ArrayLen(aErrors)#" index="i">
            <cfset status.addError(aErrors[i].Field,aErrors[i].Message)>
        </cfloop>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
            <cftry>
                <cfset ActivitySupportBean = Application.Com.ActivitySupportDAO.Save(ActivitySupportBean)>
                    
                <!--- Read in the ActivitySupport information --->
                <cfset qActivitySupport = Application.Com.ActivitySupportGateway.getByViewAttributes(ActivityID=Arguments.ActivityID,SupportID=ActivitySupportBean)>
                
                <!--- Acquire Activity Info --->
                <cfset ActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").init(ActivityID=Arguments.ActivityID)>
                <cfset ActivityBean = Application.Com.ActivityDAO.read(ActivityBean)>
                
                <!--- Update Activity Stats --->
                <cfset ActivityBean.setStatSupporters(ActivityBean.getStatSupporters()+1)>
                <cfset ActivityBean.setStatSuppAmount(ActivityBean.getStatSuppAmount()+Arguments.Amount)>
                
                <cfif ActivityBean.getParentActivityID() NEQ "">
                    <cfset ParentActivityBean = CreateObject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=ActivityBean.getParentActivityID())>
                    <cfset ParentActivityBean = Application.Com.ActivityDAO.Read(ParentActivityBean)>
                    <cfset ParentActivityBean.setStatSupporters(ParentActivityBean.getStatSupporters()+1)>
                    <cfset ParentActivityBean.setStatSuppAmount(ParentActivityBean.getStatSuppAmount()+Arguments.Amount)>
                    <cfset ParentActivityBean = Application.Com.ActivityDAO.Update(ParentActivityBean)>
                </cfif>
    
                <!--- Adjust qActivitySupport.Amount for display --->
                <cfset qActivitySupport.Amount = "$" & qActivitySupport.Amount>
                
                <!--- Save the action for the Support Entry Save --->
                <cfset ActionBean = CreateObject("component","#Application.Settings.Com#Action.Action").init()>
                <cfset ActionBean.setActivityID(Arguments.ActivityID)>
                <cfset ActionBean.setShortName("Added a support entry.")>
                <cfset ActionBean.setCode("SUPA")>
                <cfset ActionBean.setLongName("Added a support entry for #qActivitySupport.SupporterName# (#qActivitySupport.SupportTypeName#) to activity '<a href=""/index.cfm/event/Activity.Detail?ActivityID=#ActivityBean.getActivityID()#"">#ActivityBean.getTitle()#</a>' for the amount of #qActivitySupport.Amount#.")>
                <cfset ActionBean.setCreatedBy(Session.Person.getPersonID())>
                <cfset Application.Com.ActionDAO.Create(ActionBean)>
                
				<!--- REFRESH BIT --->
				<cfset application.activity.refresh(arguments.activityid) />
				
                <!--- Save the updated ActivityBean information --->
                <cfset ActivityBean = Application.Com.ActivityDAO.Save(ActivityBean)>
                
				<cfset status.setStatus(true)>
                <cfset status.setStatusMsg("The support has been saved.")>
                
                <cfcatch type="any">
            		<cfset status.addError("General","Error: " & cfcatch.Message)>
                </cfcatch>
            </cftry>
        </cfif>
		
		<cfreturn Status />
	</cffunction>
</cfcomponent>>